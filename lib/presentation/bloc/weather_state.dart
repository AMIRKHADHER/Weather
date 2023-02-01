part of 'weather_bloc.dart';

abstract class WeatherState extends Equatable {
  const WeatherState();
}

class WeatherInitial extends WeatherState {
  @override
  List<Object?> get props => [];
}
class GetSevenDayForecastLoading extends WeatherState {
  @override
  List<Object?> get props => [];
}

class GetSevenDayForecastErrorState extends WeatherState {
  const GetSevenDayForecastErrorState({
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
class GetSevenDayForecastLoaded extends WeatherState {
  final WeatherModel weatherModel;


  const GetSevenDayForecastLoaded({required this.weatherModel}) : super();


  @override
  List<Object?> get props => [weatherModel];
}
