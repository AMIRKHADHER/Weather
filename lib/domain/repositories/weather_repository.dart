import 'package:dartz/dartz.dart';
import 'package:weather/data/models/weather_model.dart';

import '../../core/error/failures.dart';

abstract class WeatherRepository {
  Future<Either<Failure, WeatherModel>> getFiveDayForecast();
}
