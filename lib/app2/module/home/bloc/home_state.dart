part of 'home_bloc.dart';

abstract class HomeState {}

class HomeInitial extends HomeState {}

class LoadingState extends HomeState {}

class SuccessState extends HomeState {
  SuccessState({
    required this.items,
  });

  final List<Booking> items;

  @override
  List<Object> get props => [items];

  @override
  String toString() => 'SearchStateSuccess { items: $items }';
}

class ErrorState extends HomeState {
  ErrorState(this.error);

  final String error;

  @override
  List<Object> get props => [error];
}
