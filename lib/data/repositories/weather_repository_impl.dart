import 'package:dartz/dartz.dart';
import 'package:weather/data/models/weather_model.dart';
import 'package:weather/domain/repositories/weather_repository.dart';

import '../../core/error/exceptions.dart';
import '../../core/error/failures.dart';
import '../../core/network/connection.dart';
import '../../core/utils/constants.dart';
import '../../domain/data_source/remote_data_source/weather_remote_data_source.dart';
import '../datasources/remote_datasource/remote_weather_data_source_impl.dart';

class WheatherRepositoryImpl extends WeatherRepository {
  final WeatherRemoteDataSource? weatherRmoteDataSourceImp;
  WheatherRepositoryImpl({required this.weatherRmoteDataSourceImp
      //this.networkStatus
      });


  @override
  Future<Either<Failure, WeatherModel>> getSevenDayForecast() async {
    final hasConnection = await ConnectionHelper.hasConnection();
    if (await hasConnection) {
      try {
        final remoteData =
        await weatherRmoteDataSourceImp!.getSevenDayForecast();
        return Right(remoteData);
      } on ServerException catch (ex) {
        return Left(
            ServerFailure(message: ex.message, errorCode: ex.errorCode));
      }on UnauthorizedException catch (ex) {
        return Left(
            UnauthorizedFailure(message: ex.message, errorCode: ex.errorCode));
      }
    } else {
      return const Left(ServerFailure(
        message: noInternetMessage,
        errorCode: noInternetCode,
      ));
    }
  }
  

}
