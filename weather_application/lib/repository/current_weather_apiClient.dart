import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;
import 'package:weather_application/services/location.dart';
import 'dart:convert';
import 'package:weather_application/models/current_weather_model.dart';
import 'package:shared_preferences/shared_preferences.dart';


const apiKey = '7cbee4239353067306bb4f466f0bee43';
const openWeatherMapURL = 'https://api.openweathermap.org/data/2.5/onecall';

class CurrentWeatherApiClient{

  final http.Client httpClient;
  CurrentWeatherApiClient({@required this.httpClient}):assert(httpClient != null);

  Future <CurrentWeatherModel> getLocationWeather() async {
    Location location = Location();
    await location.getCurrentLocation();

    final result = await http.Client().get('$openWeatherMapURL?lat=${location.latitude}&lon=${location
        .longitude}&appid=$apiKey&units=metric');

    if(result.statusCode != 200)
      throw Exception();

    return parsedJson(result.body);
  }

  CurrentWeatherModel parsedJson(final response){
    final jsonDecoded = json.decode(response);
    return CurrentWeatherModel.fromJson(jsonDecoded);
  }
  }