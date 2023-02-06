import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lottie/lottie.dart';
import 'package:weather/core/mapper.dart';
import 'package:weather/data/models/weather_model.dart';
import 'package:weather/presentation/bloc/weather_bloc.dart';

import '../../locator.dart';

class WeatherScreen extends StatefulWidget {
  final WeatherScreenParameters? weatherScreenParameters;

  const WeatherScreen({Key? key, required this.weatherScreenParameters})
      : super(key: key);

  @override
  State<WeatherScreen> createState() => _WeatherScreenState();
}

class _WeatherScreenState extends State<WeatherScreen> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return BlocProvider<WeatherBloc>(
      create: (context) => sl<WeatherBloc>()..add(GetFiveDayForecastPressed()),
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
            elevation: 0,
            toolbarHeight: 100,
            iconTheme: IconThemeData(
              color: Colors.black, //change your color here
            ),
            title: Text(
              "BIENVENUE ${widget.weatherScreenParameters!.userIdantidiant.toString()}",
              style: const TextStyle(
                color: Colors.black,
                fontSize: 18,
                // fontFamily: 'Gilroy bold',
              ),
            )),
        body: Center(
          child: SingleChildScrollView(
            child: BlocConsumer<WeatherBloc, WeatherState>(
              listener: (context, state) {
                // TODO: implement listener
              },
              builder: (context, state) {
                if (state is GetFiveDayForecastLoading) {
                  return Center(child: Lottie.asset(
                      'assets/lottie/loader.json', height: 150, width:
                  150),);
                }
                if (state is GetFiveDayForecastErrorState) {}
                if (state is GetFiveDayForecastLoaded) {
                  return Center(
                    child: Padding(
                      padding: const EdgeInsets.all(4),
                      child: Card(
                          elevation: 0,
                          color: Colors.white,
                          child: ListView.builder(
                              itemCount: state.weatherModel.list!.length,
                              padding: EdgeInsets.only(top: 10, bottom: 10),
                              shrinkWrap: true,
                              physics: NeverScrollableScrollPhysics(),
                              itemBuilder: (context, index) {
                                return _buildFiveDayForecast(
                                    state.weatherModel.list![index].weather![0],
                                    state.weatherModel.list![index].dtTxt);
                              })),
                    ),
                  );
                }
                return Container();
              },
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildFiveDayForecast(Weather weatherElement, DateTime? dtTxt) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        CachedNetworkImage(
          imageUrl: Mapper.convertImage(weatherElement.icon!),
          fit: BoxFit.cover,
        ),
        Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "${dtTxt!.toString().substring(0, 10)}  ${dtTxt.toString().substring(11, 19)}",
              style: const TextStyle(color: Colors.black),
            ),
            Text(
              "${weatherElement.main} : \n${weatherElement.description}",
              style: const TextStyle(color: Colors.black),
            )
          ],
        )
      ],
    );
  }
}

class WeatherScreenParameters {
  final String? userIdantidiant;

  const WeatherScreenParameters({required this.userIdantidiant});
}
