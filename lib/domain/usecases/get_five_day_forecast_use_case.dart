import 'package:dartz/dartz.dart';
import 'package:weather/data/models/weather_model.dart';

import '../../../core/error/failures.dart';
import '../../../core/usecases/usecase.dart';
import '../entities/weather.dart';
import '../repositories/weather_repository.dart';

class GetFiveDayForecastUseCase implements UseCase<WeatherModel, NoParams> {
  final WeatherRepository? weatherRepository;

  GetFiveDayForecastUseCase({required this.weatherRepository});

  @override
  Future<Either<Failure, WeatherModel>> call(NoParams params) async {
    return await weatherRepository!.getFiveDayForecast();
  }
}
