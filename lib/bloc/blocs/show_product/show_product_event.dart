part of 'show_product_bloc.dart';

class ShowProductEvent {}

class ChangeSizeEvent extends ShowProductEvent {
  final int sizeIndex;

  ChangeSizeEvent({required this.sizeIndex});
}

class ChangeColorEvent extends ShowProductEvent {
  final int colorIndex;

  ChangeColorEvent({required this.colorIndex});
}

class IncreaseQuantityEvent extends ShowProductEvent {
  final int quantity;
  final int price;

  IncreaseQuantityEvent({required this.quantity, required this.price});
}

class DecreaseQuantityEvent extends ShowProductEvent {
  final int quantity;
  final int price;

  DecreaseQuantityEvent({required this.quantity, required this.price});
}
