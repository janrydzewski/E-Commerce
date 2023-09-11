part of 'shipping_bloc.dart';

class ShippingEvent {
  const ShippingEvent();
}
class ChangeShippingIndexEvent extends ShippingEvent{
  final int newIndex;
  const ChangeShippingIndexEvent(this.newIndex);
}
