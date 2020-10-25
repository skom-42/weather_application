import 'dart:convert';
import 'package:weather_application/models/weather_model.dart';
import 'package:meta/meta.dart';
import 'package:http/http.dart' as http;
import 'package:weather_application/services/location.dart';
import 'package:weather_application/constants.dart';

class WeatherApiClient {
  final http.Client httpClient;
  WeatherApiClient({@required this.httpClient}):assert(httpClient != null);


  Future<Weather> getWeatherData() async {
    Location location = Location();
    await location.getCurrentLocation();
    final cWeather= await http.Client().get('$openWeatherMapURL?lat=${location.latitude}&lon=${location
        .longitude}&appid=$apiKey&units=metric');
    if (cWeather.statusCode != 200) {
      throw Exception();
    }
    final weatherJson = json.decode(cWeather.body);

    //final weather = Weather.fromJson(weatherJson);
    //print(weather.cityName);
    return Weather.fromJson(weatherJson);
  }


  Future<List<Weather>> getForecast() async {
    Location location = Location();
    await location.getCurrentLocation();

    final fWeather= await http.Client().get('$openWeatherMapForecastUrl?lat=${location.latitude}&lon=${location
        .longitude}&appid=$apiKey&units=metric');
    print(fWeather);
    if (fWeather.statusCode != 200) {
      throw Exception();
    }
    final forecastJson = json.decode(fWeather.body);
    List<Weather> weathers = Weather.fromForecastJson(forecastJson);
    return weathers;
  }
}
