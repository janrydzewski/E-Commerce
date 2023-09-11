import 'dart:async';
import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:ecommerce/data/models/models.dart';
import 'package:ecommerce/repositories/repositories.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_stripe/flutter_stripe.dart';
import 'package:http/http.dart' as http;

part 'payment_event.dart';

part 'payment_state.dart';

class PaymentBloc extends Bloc<PaymentEvent, PaymentState> {
  final OrdersRepository orderRepository;
  final CartRepository cartRepository;

  PaymentBloc({required this.orderRepository, required this.cartRepository})
      : super(const PaymentState()) {
    on<PaymentStart>(_onPaymentStart);
    on<PaymentCreateIntent>(_onPaymentCreateIntent);
    on<PaymentConfirmIntent>(_onPaymentConfirmIntent);
  }

  _onPaymentStart(PaymentStart event, Emitter<PaymentState> emit) {
    emit(state.copyWith(status: PaymentStatus.initial));
  }

  _onPaymentCreateIntent(
      PaymentCreateIntent event, Emitter<PaymentState> emit) async {
    emit(state.copyWith(status: PaymentStatus.loading));
    final paymentMethod = await Stripe.instance.createPaymentMethod(
        params: PaymentMethodParams.card(
            paymentMethodData:
                PaymentMethodData(billingDetails: event.billingDetails)));

    print("payment: ${paymentMethod.toString()}");

    final paymentIntentResult = await _callPayEndpointMethodId(
      useStripeSdk: true,
      paymentMethodId: paymentMethod.id,
      currency: "usd",
      productCartList: event.items,
    );

    print("whole: ${paymentIntentResult.toString()}");
    print("error: ${paymentIntentResult['error']}");
    print("clientSecret: ${paymentIntentResult['clientSecret']}");
    print("requiresAction: ${paymentIntentResult['requiresAction']}");
    print("productCartList: ${event.items.toString()}");

    if (paymentIntentResult['error'] != null) {
      emit(state.copyWith(status: PaymentStatus.failure));
    }
    if (paymentIntentResult['clientSecret'] != null &&
        paymentIntentResult['requiresAction'] == null) {
      orderRepository.addProductsToOrders(event.items);
      cartRepository.clearCart();
      emit(state.copyWith(status: PaymentStatus.success));
    }

    if (paymentIntentResult['clientSecret'] != null &&
        paymentIntentResult['requiresAction'] == true) {
      final String clientSecret = paymentIntentResult['clientSecret'];
      add(PaymentConfirmIntent(clientSecret: clientSecret, items: event.items));
    }
  }

  _onPaymentConfirmIntent(
      PaymentConfirmIntent event, Emitter<PaymentState> emit) async {
    try {
      final paymentIntent =
          await Stripe.instance.handleNextAction(event.clientSecret);
      if (paymentIntent.status == PaymentIntentsStatus.RequiresConfirmation) {
        Map<String, dynamic> result = await _callPayEndPointIntentId(
          paymentIntentId: paymentIntent.id,
        );
        if (result['error'] != null) {
          emit(state.copyWith(status: PaymentStatus.failure));
        } else {
          orderRepository.addProductsToOrders(event.items);
          cartRepository.clearCart();
          emit(state.copyWith(status: PaymentStatus.success));
        }
      }
    } catch (e) {
      print(e);
    }
  }

  List<Map<String, dynamic>> convertProductCartListToMapList(
      List<ProductCartModel> productCartList) {
    List<Map<String, dynamic>> mapList = [];

    for (var product in productCartList) {
      mapList.add(product.toJson());
    }

    return mapList;
  }

  Future<Map<String, dynamic>> _callPayEndpointMethodId({
    required bool useStripeSdk,
    required String paymentMethodId,
    required String currency,
    List<ProductCartModel>? productCartList,
  }) async {
    final url = Uri.parse(
        "https://us-central1-e-commerce-75c8c.cloudfunctions.net/StripePayEndpointMethodId");
    List<Map<String, dynamic>> items =
        convertProductCartListToMapList(productCartList!);

    final response = await http.post(
      url,
      headers: {'Content-Type': 'application/json'},
      body: json.encode(
        {
          'useStripeSdk': useStripeSdk,
          'paymentMethodId': paymentMethodId,
          'currency': currency,
          'items': items,
        },
      ),
    );
    return json.decode(response.body);
  }

  Future<Map<String, dynamic>> _callPayEndPointIntentId({
    required String paymentIntentId,
  }) async {
    final url = Uri.parse(
        "https://us-central1-e-commerce-75c8c.cloudfunctions.net/StripePayEndpointIntentId");
    final response = await http.post(
      url,
      headers: {'Content-Type': 'application/json'},
      body: json.encode(
        {
          'paymentIntentId': paymentIntentId,
        },
      ),
    );
    return json.decode(response.body);
  }
}
