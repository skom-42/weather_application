import 'package:weather_application/api/weather_api_client.dart';
import 'package:weather_application/models/weather_model.dart';
import 'package:meta/meta.dart';

class WeatherRepository {

  final WeatherApiClient weatherApiClient;
  WeatherRepository({@required this.weatherApiClient}) : assert(weatherApiClient != null);

  Future<Weather> getWeather() async {
    var weather = await weatherApiClient.getWeatherData();
    var weathers = await weatherApiClient.getForecast();
    weather.forecast = weathers;
    return weather;
  }
}
