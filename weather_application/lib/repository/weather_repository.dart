import 'package:connectivity/connectivity.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:weather_application/api/weather_api_client.dart';
import 'package:weather_application/models/weather_model.dart';
import 'package:meta/meta.dart';
import 'dart:convert';

import 'package:weather_application/repository/shered_preferences_repository.dart';

class WeatherRepository {

  final WeatherApiClient weatherApiClient;
  WeatherRepository({@required this.weatherApiClient}) : assert(weatherApiClient != null);

  Future<Weather> getWeather() async {

    var connectivityResult = await (Connectivity().checkConnectivity());
    if (connectivityResult == ConnectivityResult.mobile || connectivityResult == ConnectivityResult.wifi) {
      var weather = await weatherApiClient.getWeatherData();
      var weathers = await weatherApiClient.getForecast();
      weather.forecast = weathers;
      SPRepository.saveData(weather);
      return weather;
    }else {
      Weather weather = await SPRepository.loadData();
      return weather.windDeg != null ? weather : Weather(
          location: Null,
          description: Null,
          temperature: Null,
          propability: Null,
          quantity: Null,
          pressurer: Null,
          windSpeed: 0,
          windDeg: 0,
          date: 0,
          main: null,
      );}

  }
}
