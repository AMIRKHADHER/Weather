import 'package:flutter/cupertino.dart';
import 'package:get_it/get_it.dart';
import 'package:http/http.dart' as http;
import 'package:weather/domain/data_source/remote_data_source/weather_remote_data_source.dart';
import 'package:weather/domain/repositories/weather_repository.dart';
import 'package:weather/domain/usecases/get_seven_day_forecast_use_case.dart';
import 'package:weather/presentation/bloc/weather_bloc.dart';

import 'data/datasources/remote_datasource/remote_weather_data_source_impl.dart';
import 'data/repositories/weather_repository_impl.dart';

final sl = GetIt.instance;

Future<void> init() async {

  //! Bloc
  sl.registerFactory(
    () => WeatherBloc(getSevenDayForecastUseCase: sl()),
  );

  //! Use cases
  sl.registerLazySingleton(
      () => GetSevenDayForecastUseCase(weatherRepository: sl()));

  //! Repository
  sl.registerLazySingleton<WeatherRepository>(
    () => WheatherRepositoryImpl(weatherRmoteDataSourceImp: sl()),
  );

  //! Data sources
  sl.registerLazySingleton<WeatherRemoteDataSource>(
    () => WeatherRmoteDataSourceImp(client: sl()),
  );

  //! External
  sl.registerLazySingleton(() => http.Client());
}
