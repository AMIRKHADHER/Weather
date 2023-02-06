part of 'weather_bloc.dart';

abstract class WeatherState extends Equatable {
  const WeatherState();
}

class WeatherInitial extends WeatherState {
  @override
  List<Object?> get props => [];
}
class GetFiveDayForecastLoading extends WeatherState {
  @override
  List<Object?> get props => [];
}

class GetFiveDayForecastErrorState extends WeatherState {
  const GetFiveDayForecastErrorState({
    required this.message,
    required this.errorCode,
  });

  final String? message;
  final String? errorCode;

  @override
  List<Object> get props => [
    message!,
    errorCode!,
  ];

}

// ignore: must_be_immutable
class GetFiveDayForecastLoaded extends WeatherState {
  final WeatherModel weatherModel;


  const GetFiveDayForecastLoaded({required this.weatherModel}) : super();


  @override
  List<Object?> get props => [weatherModel];
}
