part of 'home_bloc.dart';

class HomeEvent {}

class ChangePageViewEvent extends HomeEvent {
  final int newIndex;

  ChangePageViewEvent({required this.newIndex});
}

class ChangeCategoryEvent extends HomeEvent {
  final int newIndex;

  ChangeCategoryEvent({required this.newIndex});
}
