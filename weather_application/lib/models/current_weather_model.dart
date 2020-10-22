import 'package:flutter/cupertino.dart';
import 'package:weather_icons/weather_icons.dart';

class CurrentWeatherModel{
  final location;
  final description; //описание погоды //
  final temperature; //temp; //температура//
  final propability;  //pop; //вероятность осадков
  final quantity; //rain; //кол-во осадков     -------------
  final pressurer; //давление
  final windSpeed; //скорость ветра
  final windDeg;
  final date;


  CurrentWeatherModel(
      this.location,
      this.description,
      this.temperature,
      this.propability,
      this.quantity,
      this.pressurer,
      this.windSpeed,
      this.windDeg,
      this.date
      );

  factory CurrentWeatherModel.fromJson(Map<String, dynamic> json){
    DateTime now = new DateTime.now();
    DateTime date = new DateTime(now.year, now.month, now.day);

    //print(json['current']['weather'][0]['main']);
    return CurrentWeatherModel(
        json["timezone"],
        json['current']['weather'][0]['main'],
        json['current']['temp'],
        json['daily'][0]['pop'],
        json['daily'][0]['rain'],
        json['current']['pressure'],
        json['current']['wind_speed'],
        json['current']['wind_deg'],
        date
    );
  }

  String getCurrentLocation(String loc){
    var editedText = loc.split("/");
    var result = editedText[0] + ', ' + editedText[1];
    return result;
  }

  int editedWindSpeed(int speed){
    return (speed / 3.6).toInt();
  }

  static String getWindDirection(int degrees){
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

  static IconData getTitleLogo(String description){
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