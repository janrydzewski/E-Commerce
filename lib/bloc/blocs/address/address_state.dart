part of 'address_bloc.dart';

class AddressState extends Equatable {
  final List<AddressModel> addressList;
  final bool isLoaded;
  final int index;

  AddressState({
    List<AddressModel>? addressList,
    bool? isLoaded,
    required this.index,
  })
      : addressList = addressList ?? [],
        isLoaded = isLoaded ?? false;


  AddressState copyWith({
    List<AddressModel>? addressList,
    bool? isLoaded,
    int? index,
  }) {
    return AddressState(
      addressList: addressList ?? this.addressList,
      isLoaded: isLoaded ?? this.isLoaded,
      index: index ?? this.index,
    );
  }

  Map<String, dynamic> toJson() => {
    'index': index,
  };

  factory AddressState.fromJson(Map<String, dynamic> json) => AddressState(index: json['index']);

  @override
  List<Object> get props => [addressList, isLoaded, index];
}

class AddressError extends AddressState{
  final String message;

  AddressError({
    List<AddressModel>? addressList,
    bool? isLoaded,
    int? index,
    required this.message,
  }) : super(
    addressList: addressList,
    isLoaded: isLoaded,
    index: index!,
  );
}
