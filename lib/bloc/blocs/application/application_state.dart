part of 'application_bloc.dart';

class ApplicationState extends Equatable {
  int index;
  ApplicationState({this.index = 0});

  @override
  List<Object> get props => [index];
}
