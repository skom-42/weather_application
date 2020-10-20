import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:weather_application/services/location.dart';
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
    return wetherData;
  }

  String getCurrentLocation(String loc){
    var editedText = loc.split("/");
    var result = editedText[0] + ', ' + editedText[1];
    return result;
  }

  int editedWindSpeed(int speed){
    return (speed / 3).toInt();
  }

  String getWindDirection(int degrees){
    if(degrees == 0){
      return 'N';
    } else if(degrees > 0 && degrees < 90){
      return 'NE';
    } else if(degrees == 90){
      return 'E';
    } else if(degrees > 90 && degrees < 180){
      return 'SE';
    } else if(degrees == 180){
      return 'S';
    } else if(degrees > 180 && degrees < 270){
      return 'SW';
    } else if(degrees == 270){
      return 'W';
    } else{
      return 'NW';
    }
  }

  IconData getTitleLogo(String description){
    if(description == 'Thunderstorm'){
      return WeatherIcons.thunderstorm;
    } else if(description == 'Drizzle'){
      return WeatherIcons.sleet;
    } else if(description == 'Rain'){
      return WeatherIcons.rain;
    } else if(description == 'Snow'){
      return WeatherIcons.snow;
    } else if(description == 'Atmosphere'){
      return WeatherIcons.smog;
    } else if(description == 'Clear'){
      return WeatherIcons.day_sunny;
    } else if(description == 'Clouds'){
      return WeatherIcons.cloudy;
    }
  }
}