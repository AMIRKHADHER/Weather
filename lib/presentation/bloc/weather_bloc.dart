import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:weather/data/models/weather_model.dart';

import '../../core/error/failures.dart';
import '../../core/usecases/usecase.dart';
import '../../core/utils/constants.dart';
import '../../domain/usecases/get_seven_day_forecast_use_case.dart';

part 'weather_event.dart';
part 'weather_state.dart';

class WeatherBloc extends Bloc<WeatherEvent, WeatherState> {
  final GetSevenDayForecastUseCase? getSevenDayForecastUseCase;
  WeatherBloc({required this.getSevenDayForecastUseCase}) : super(WeatherInitial()) {

    on<GetSevenDayForecastPressed>(_onGetSevenDayForecastPressed);

  }

  FutureOr<void> _onGetSevenDayForecastPressed(GetSevenDayForecastPressed event, Emitter<WeatherState> emit) async {
    emit(GetSevenDayForecastLoading());

    final result = await getSevenDayForecastUseCase!(NoParams());
    result.fold((failure) {
      emit(GetSevenDayForecastErrorState(  message: mapFailureToErrorMessage(failure),
        errorCode: mapFailureToErrorCode(failure),));
    }, (weatherModel) {
      emit(GetSevenDayForecastLoaded(weatherModel: weatherModel));
    });
  }
}
String mapFailureToErrorMessage(Failure failure) {
  print("failure.runtimeTypefailure.runtimeType ${failure.runtimeType}");
  switch (failure.runtimeType) {
    case ServerFailure:
      return (failure as ServerFailure).message ??
          serverFailureMessage;
    case CacheFailure:
      return (failure as CacheFailure).message ??
          cacheFailureMessage;
    case UnauthorizedFailure:
      return (failure as UnauthorizedFailure).message ??
          unauthorisedMessage;
    default:
      return 'Unexpected Error';
  }
}

String mapFailureToErrorCode(Failure failure) {
  switch (failure.runtimeType) {
    case ServerFailure:
      return (failure as ServerFailure).errorCode ??
          serverFailureCode;
    case CacheFailure:
      return (failure as CacheFailure).errorCode ??
          cacheFailureCode;
    case UnauthorizedFailure:
      return (failure as UnauthorizedFailure).errorCode ??
          unauthorisedCode;
    default:
      return 'Unexpected Error';
  }
}