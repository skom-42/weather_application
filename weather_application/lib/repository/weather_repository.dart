import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;
import 'package:weather_application/repository/CurrentWeatherApiClient.dart';
import 'package:weather_application/models/current_weather_model.dart';

const apiKey = '7cbee4239353067306bb4f466f0bee43';
const openWeatherMapURL = 'https://api.openweathermap.org/data/2.5/onecall';

class WeatherRepository{
  final CurrentWeatherApiClient currentWeatherApiClient;

  WeatherRepository({@required this.currentWeatherApiClient})
      : assert(currentWeatherApiClient != null);

  Future<CurrentWeatherModel> getLocationWeather() {
    return currentWeatherApiClient.getLocationWeather();
    //TODO Shared Preferences save
  }
}
