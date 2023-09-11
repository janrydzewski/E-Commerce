import 'package:bloc/bloc.dart';
import 'package:ecommerce/data/models/models.dart';
import 'package:equatable/equatable.dart';

import 'package:ecommerce/repositories/repositories.dart';

part 'orders_event.dart';

part 'orders_state.dart';

class OrdersBloc extends Bloc<OrdersEvent, OrdersState> {
  final OrdersRepository ordersRepository;

  OrdersBloc({required this.ordersRepository}) : super(OrdersState(index: 0)) {
    on<GetOrdersEvent>(_onGetOrdersEvent);
  }

  _onGetOrdersEvent(GetOrdersEvent event, Emitter<OrdersState> emit) async {
    emit(state.copyWith(isLoaded: false, index: event.newIndex));
    print("xdd");
    try {
      print("XDDDD");
      final productList = await ordersRepository.getProducts(event.type);
      print("LENGHT: ${productList.length}");
      emit(state.copyWith(productList: productList, isLoaded: true));
    } catch (e) {
      emit(OrdersError(message: e.toString(), index: state.index));
    }
  }
}
