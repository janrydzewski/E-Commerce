part of 'shipping_bloc.dart';

class ShippingState extends Equatable {
  final int index;

  const ShippingState({required this.index});

  ShippingState copyWith({
    int? index,
  }) {
    return ShippingState(
      index: index ?? this.index,
    );
  }

  Map<String, dynamic> toJson() => {
    'index': index,
  };

  factory ShippingState.fromJson(Map<String, dynamic> json) => ShippingState(index: json['index']);

  List<Object> get props => [index];
}

