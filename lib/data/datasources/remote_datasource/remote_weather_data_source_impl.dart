
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:weather/data/models/weather_model.dart';
import '../../../core/error/exceptions.dart';
import '../../../core/utils/constants.dart';
import '../../../domain/data_source/remote_data_source/weather_remote_data_source.dart';

class WeatherRmoteDataSourceImp extends WeatherRemoteDataSource {
  final http.Client? client;

  WeatherRmoteDataSourceImp({required this.client});

  @override
  Future<WeatherModel> getSevenDayForecast() async {
    try{
   /* Map<String, String> headers = {
      'Content-Type': 'application/json',
    };*/
    var url = Uri.parse(
        "https://api.openweathermap.org/data/2.5/forecast?lat=48.861544098378594&lon=2.293474815554091&appid=828f09be7e149a441fb0523a9d0df9f0");
    final response = await client!.get(
      url,
    );
    print("response.statusCoderesponse.statusCode${response.statusCode}");
    if (response.statusCode == 200) {
print("WeatherModel.fromJson(jsonDecode(response.body)).city${WeatherModel.fromJson(jsonDecode(response.body)).city!.name}");
      return  WeatherModel.fromJson(jsonDecode(response.body));
    } else if (response.statusCode == 401) {
      throw UnauthorizedException( message: unauthorisedMessage,
          errorCode: unauthorisedCode);
    } else {
      throw ServerException( message: serverFailureMessage,
          errorCode: serverFailureCode);
    }
    }
    catch (ex) {
      if (ex is ServerException) {
        rethrow;
      } else {
        throw ServerException( message: serverFailureMessage,
            errorCode: serverFailureCode);
      }
    }
  }



}
