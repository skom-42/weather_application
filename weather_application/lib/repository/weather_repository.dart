import 'package:connectivity/connectivity.dart';
import 'package:weather_application/api/weather_api_client.dart';
import 'package:weather_application/models/weather_model.dart';
import 'package:meta/meta.dart';

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
      return weather;


  }
}
}
