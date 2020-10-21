import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_application/repository/CurrentWeatherApiClient.dart';
import 'package:weather_application/repository/weather_repository.dart';
import 'package:weather_application/bloc/location_bloc.dart';
import 'screens/location_screen.dart';
import 'package:http/http.dart' as http;

void main(){
  WeatherRepository weatherRepository = new WeatherRepository(
    currentWeatherApiClient: CurrentWeatherApiClient(
      httpClient: http.Client(),
    ),
  );
  runApp(MyApp(weatherRepository: weatherRepository,));
}


class MyApp extends StatelessWidget {
  final WeatherRepository weatherRepository;

  MyApp({@required this.weatherRepository}) : assert (weatherRepository != null);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: BlocProvider(
        create: (context) => WeatherBloc(
          weatherRepository: weatherRepository,
        ),
        child: LocationScreen(repo: weatherRepository,),
      ),
    );

  }
}