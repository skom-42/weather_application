import 'package:flutter/cupertino.dart';
import 'package:weather_application/repository/current_weather_apiClient.dart';
import 'package:weather_application/models/current_weather_model.dart';
import 'package:connectivity/connectivity.dart';
import 'package:weather_application/repository/shered_preferences_repository.dart';

const apiKey = '7cbee4239353067306bb4f466f0bee43';
const openWeatherMapURL = 'https://api.openweathermap.org/data/2.5/onecall';

class WeatherRepository{
  final CurrentWeatherApiClient currentWeatherApiClient;

  WeatherRepository({@required this.currentWeatherApiClient})
      : assert(currentWeatherApiClient != null);

  Future<CurrentWeatherModel> getLocationWeather() async{
    var connectivityResult = await (Connectivity().checkConnectivity());
    if (connectivityResult == ConnectivityResult.mobile || connectivityResult == ConnectivityResult.wifi) {
      var model = await currentWeatherApiClient.getLocationWeather();
      SPRepository.saveData(model);
      return model;
    } else{
      CurrentWeatherModel model = await SPRepository.loadData();
      return model.windDeg != null ? model : CurrentWeatherModel('Null','Null','Null','Null','Null','Null',0,0,0);
    }
  }
}
