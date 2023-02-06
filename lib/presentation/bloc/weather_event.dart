part of 'weather_bloc.dart';

abstract class WeatherEvent extends Equatable {
  const WeatherEvent();
}
class GetFiveDayForecastPressed extends WeatherEvent {
  GetFiveDayForecastPressed();

  @override
  List<Object?> get props => [];
}