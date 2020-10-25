import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_application/repository/weather_repository.dart';
import 'package:weather_application/bloc/weather_bloc.dart';
import 'api/weather_api_client.dart';
import 'screens/location_screen.dart';
import 'package:http/http.dart' as http;

void main(){
  WeatherRepository weatherRepository = new WeatherRepository(
    weatherApiClient: WeatherApiClient(
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