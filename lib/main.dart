import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather/domain/repositories/weather_repository.dart';
import 'package:weather/presentation/bloc/weather_bloc.dart';
import 'package:weather/presentation/screens/sign_in_screen.dart';
import 'package:weather/presentation/screens/weather_screen.dart';
import 'core/utils/route_generator.dart';
import 'core/utils/simple_bloc_observer.dart';
import 'locator.dart' as di;
import 'locator.dart';

void main()async {
  WidgetsFlutterBinding.ensureInitialized();
  await di.init();
  BlocOverrides.runZoned(
          () => runApp(
          BlocProvider<WeatherBloc>(
          create: (context) => sl<WeatherBloc>(),
  child: MultiRepositoryProvider(
  providers: [
    _configureWeatherRepository(),

  ],
  child: MultiBlocProvider(providers: [
    _configureWeatherBloc(),
  ], child: const WeatherApp())),
          ),
//  ),blocObserver: SimpleBlocDelegate()
          ),
    blocObserver: SimpleBlocObserver(),
  );
}
RepositoryProvider<WeatherRepository> _configureWeatherRepository() {
  return RepositoryProvider<WeatherRepository>(
    create: (context) => sl<WeatherRepository>(),
    lazy: true,
  );
}
BlocProvider<WeatherBloc> _configureWeatherBloc() {
  return BlocProvider<WeatherBloc>(
    create: (_) => sl<WeatherBloc>(),
  );
}




class WeatherApp extends StatelessWidget {
  const WeatherApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Weather',
      debugShowCheckedModeBanner: false,
      onGenerateRoute: RouteGenerator.generateRoute,
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,

      ),
      home: const SignInScreen(),
    );
  }
}

