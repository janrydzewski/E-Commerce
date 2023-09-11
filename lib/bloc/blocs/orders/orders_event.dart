part of 'orders_bloc.dart';

class OrdersEvent {}

class GetOrdersEvent extends OrdersEvent {
  final int newIndex;
  final String type;

  GetOrdersEvent(this.newIndex, this.type);
}
