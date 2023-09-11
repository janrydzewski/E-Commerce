part of 'home_bloc.dart';

class HomeState extends Equatable {
  final int pageViewIndex;
  final int categoryIndex;

  const HomeState({this.pageViewIndex = 0, this.categoryIndex = 0});

  HomeState copyWith({
    int? pageViewIndex,
    int? categoryIndex,
  }) {
    return HomeState(
      pageViewIndex: pageViewIndex ?? this.pageViewIndex,
      categoryIndex: categoryIndex ?? this.categoryIndex,
    );
  }

  List<Object> get props => [pageViewIndex, categoryIndex];
}
