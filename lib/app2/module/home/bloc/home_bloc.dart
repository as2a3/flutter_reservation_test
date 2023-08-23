import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:booking/app/module/home/data/home_api_repository.dart';
import 'package:booking/app/module/home/model/booking.dart';

part 'home_event.dart';

part 'home_state.dart';

///
class HomeBloc extends Bloc<HomeEvent, HomeState> {
  ///
  HomeBloc({
    required this.repository,
  }) : super(HomeInitial()) {
    on<GetDataEvent>(_getData);
  }

  ///
  late final HomeApiRepository repository;

  Future<void> _getData(
    GetDataEvent event,
    Emitter<HomeState> emit,
  ) async {
    emit(
      LoadingState(),
    );
    final response = await repository.getBookings();
    response.fold(
      (l) {
        emit(
          ErrorState(l),
        );
      },
      (r) {
        emit(
          SuccessState(items: r),
        );
      },
    );
  }
}
