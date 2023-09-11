part of 'payment_bloc.dart';

class PaymentEvent extends Equatable {
  const PaymentEvent();

  @override
  List<Object> get props => [];
}

class PaymentStart extends PaymentEvent {}

class PaymentCreateIntent extends PaymentEvent {
  final BillingDetails billingDetails;
  final List<ProductCartModel> items;

  const PaymentCreateIntent({
    required this.billingDetails,
    required this.items,
  });

  @override
  List<Object> get props => [billingDetails, items];
}

class PaymentConfirmIntent extends PaymentEvent {
  final String clientSecret;
  final List<ProductCartModel> items;

  const PaymentConfirmIntent({
    required this.clientSecret,
    required this.items,
  });

  @override
  List<Object> get props => [clientSecret, items];
}
