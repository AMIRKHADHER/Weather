import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather/core/utils/routes.dart';
import 'package:weather/presentation/bloc/weather_bloc.dart';
import 'package:weather/presentation/screens/sign_in_screen.dart';

import '../../locator.dart';
import '../../presentation/screens/weather_screen.dart';


class RouteGenerator {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case Routes.weatherScreen:
        final WeatherScreenParameters weatherScreenParameters = settings.arguments as WeatherScreenParameters;
        return _goTo(
          BlocProvider<WeatherBloc>(
            create: (_) => sl<WeatherBloc>(),
            child:  WeatherScreen(weatherScreenParameters: weatherScreenParameters,),
          ),
        );
      default:
        return MaterialPageRoute<dynamic>(builder: (_) => const SignInScreen());
    }
  }

  /* static MaterialPageRoute<dynamic> _goTo(Widget page) {
    return MaterialPageRoute(builder: (_) => page);
  }*/
  static PageRouteBuilder<dynamic> _goTo(Widget page) {
    return PageRouteBuilder(
      pageBuilder: (_, animation, secondaryAnimation) => page,
      transitionsBuilder: (_, animation, secondaryAnimation, child) {
        const begin = Offset(0.0, 1.0);
        const end = Offset.zero;
        const curve = Curves.ease;
        var tween =
        Tween(begin: begin, end: end).chain(CurveTween(curve: curve));
        return SlideTransition(
          position: animation.drive(tween),
          child: child,
        );
      },
    );
  }
}
