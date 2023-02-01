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
            toolbarHeight: 100,
            title: Text("BIENVENUE ${widget.weatherScreenParameters!.userIdantidiant.toString()}"
              ,
              style: const TextStyle(
                color: Colors.white,
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
                if (state is GetSevenDayForecastLoading) {}
                if (state is GetSevenDayForecastErrorState) {}
                if (state is GetSevenDayForecastLoaded) {
                  return Padding(padding: const EdgeInsets.all(4),
                    child: Card(elevation: 0,color: Colors.white,
                      child: Column(
                        children: [
                          buildSevenDayForecast(
                              state.weatherModel.list![0].weather![0],
                              state.weatherModel.list![0].dtTxt),
                          buildSevenDayForecast(
                              state.weatherModel.list![9].weather![0],
                              state.weatherModel.list![9].dtTxt),
                          buildSevenDayForecast(
                              state.weatherModel.list![12].weather![0],
                              state.weatherModel.list![12].dtTxt),
                          buildSevenDayForecast(
                              state.weatherModel.list![23].weather![0],
                              state.weatherModel.list![23].dtTxt),
                          buildSevenDayForecast(
                              state.weatherModel.list![31].weather![0],
                              state.weatherModel.list![31].dtTxt)
                        ],
                      ),
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

  Widget buildSevenDayForecast(Weather weatherElement, DateTime? dtTxt) {
    return Row(mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        CachedNetworkImage(
          imageUrl: Mapper.convertImage(weatherElement.icon!),
          fit: BoxFit.cover,
          /*   placeholder: (context, url) =>
                          LoadingView(),*/
          /* errorWidget: (context, url, error) =>
                          ErrorImage(),*/
        ),
        Column(mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "${dtTxt!.toString().substring(0,10)}  ${dtTxt.toString().substring(11,19)}",
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
