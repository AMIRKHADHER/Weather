import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
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
      create: (context) => sl<WeatherBloc>()..add(GetSevenDayForecastPressed()),
      child: Scaffold(
        appBar: AppBar(
            elevation: 0,
            title: Text("BIENVENUE ${widget.weatherScreenParameters!.userIdantidiant.toString()}"
              ,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 18,
                // fontFamily: 'Gilroy bold',
              ),
            )),
        body: SingleChildScrollView(
          child: BlocConsumer<WeatherBloc, WeatherState>(
            listener: (context, state) {
              // TODO: implement listener
            },
            builder: (context, state) {
              if (state is GetSevenDayForecastLoading) {}
              if (state is GetSevenDayForecastErrorState) {}
              if (state is GetSevenDayForecastLoaded) {
                return Column(
                  children: [
                    buildSevenDayForecast(
                        state.weatherModel.list![0].weather![0],
                        state.weatherModel.list![0].dtTxt),
                    buildSevenDayForecast(
                        state.weatherModel.list![1].weather![0],
                        state.weatherModel.list![0].dtTxt),
                    buildSevenDayForecast(
                        state.weatherModel.list![2].weather![0],
                        state.weatherModel.list![0].dtTxt),
                    buildSevenDayForecast(
                        state.weatherModel.list![3].weather![0],
                        state.weatherModel.list![0].dtTxt),
                    buildSevenDayForecast(
                        state.weatherModel.list![4].weather![0],
                        state.weatherModel.list![0].dtTxt)
                  ],
                );
              }
              return Container();
            },
          ),
        ),
      ),
    );
  }

  Widget buildSevenDayForecast(WeatherElement weatherElement, DateTime? dtTxt) {
    return Row(
      children: [
        CachedNetworkImage(
          imageUrl: Mapper.convertImage(weatherElement.icon!),
          fit: BoxFit.cover,
          /*   placeholder: (context, url) =>
                          LoadingView(),*/
          /* errorWidget: (context, url, error) =>
                          ErrorImage(),*/
        ),
        Column(
          children: [
            Text(
              dtTxt!.toString(),
              style: TextStyle(color: Colors.black),
            ),
            Text(
              "${weatherElement.main} : ${weatherElement.description}",
              style: TextStyle(color: Colors.black),
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
