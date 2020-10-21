import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:weather_application/services/location.dart';
import 'package:weather_application/services/networking.dart';
import 'package:weather_application/services/networking.dart';
import 'package:weather_icons/weather_icons.dart';

const apiKey = '7cbee4239353067306bb4f466f0bee43';
const openWeatherMapURL = 'https://api.openweathermap.org/data/2.5/onecall';

class WeatherModel{
  Future <dynamic> getLocationWeather() async{
    Location location = Location();
    await location.getCurrentLocation();

    NetworkHelper networkHelper = NetworkHelper( '$openWeatherMapURL?lat=${location.latitude}&lon=${location.longitude}&appid=$apiKey&units=metric');

    var wetherData = await networkHelper.getData();
    print('weather $wetherData');
    return wetherData;
  }

}