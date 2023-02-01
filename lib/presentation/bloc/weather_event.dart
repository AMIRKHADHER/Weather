part of 'weather_bloc.dart';

abstract class WeatherEvent extends Equatable {
  const WeatherEvent();
}
class GetSevenDayForecastPressed extends WeatherEvent {
  GetSevenDayForecastPressed();

  @override
  List<Object?> get props => [];
}