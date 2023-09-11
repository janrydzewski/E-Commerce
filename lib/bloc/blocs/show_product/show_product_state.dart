part of 'show_product_bloc.dart';

class ShowProductState extends Equatable {
  final int sizeIndex;
  final int colorIndex;
  final int quantity;
  final int finalPrice;

  const ShowProductState(
      {this.sizeIndex = 0,
      this.colorIndex = 0,
      this.quantity = 0,
      this.finalPrice = 0});

  ShowProductState copyWith({
    int? sizeIndex,
    int? colorIndex,
    int? quantity,
    int? finalPrice,
  }) {
    return ShowProductState(
      sizeIndex: sizeIndex ?? this.sizeIndex,
      colorIndex: colorIndex ?? this.colorIndex,
      quantity: quantity ?? this.quantity,
      finalPrice: finalPrice ?? this.finalPrice,
    );
  }

  @override
  List<Object> get props => [sizeIndex, colorIndex, quantity, finalPrice];
}
