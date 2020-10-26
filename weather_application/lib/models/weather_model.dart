import 'package:flutter/material.dart';
import 'package:weather_icons/weather_icons.dart';
import 'dart:convert';
import 'package:intl/intl.dart';

class Weather {

  final location;
  final description;
  final temperature;
  final propability;
  final quantity;
  final pressurer;
  final windSpeed;
  final windDeg;
  final date;
  final main;

  List<Weather> forecast;

  Weather({
    this.location,
    this.description,
    this.temperature,
    this.propability,
    this.quantity,
    this.pressurer,
    this.windSpeed,
    this.windDeg,
    this.date,
    this.forecast,
    this.main
  });

  static Weather fromJson(Map<String, dynamic> json){
    DateTime now = new DateTime.now();
    DateTime date = new DateTime(now.year, now.month, now.day);

    //print(json['current']['weather'][0]['main']);
    return Weather(
        location: json["timezone"],
        description: json['current']['weather'][0]['main'],
        temperature: json['current']['temp'],
        propability: json['daily'][0]['pop'],
        quantity: json['daily'][0]['rain'],
        pressurer: json['current']['pressure'],
        windSpeed: json['current']['wind_speed'],
        windDeg: json['current']['wind_deg'],
        date: date
    );
  }

  static Map<String, dynamic> toMap(Weather weather) => {
    'date': weather.date,
    'temperature': weather.temperature,
    'description': weather.description,
    'main': weather.main,
  };

  static String encodeWeather(List<Weather> weather) => json.encode(
    weather
        .map<Map<String, dynamic>>((weather) => Weather.toMap(weather))
        .toList(),
  );

  static List<Weather> decodeWeather(String weather) {
    //print(json.decode(weather));
    Map<String, dynamic> weathers = jsonDecode(weather);
    final result = Weather.fromForecastJson(weathers);
    print(result[0].temperature);
    return result;
  }

  static List<Weather> fromForecastJson(Map<String, dynamic> json) {
    final weathers = List<Weather>();
    for (final item in json['list']) {
      weathers.add(Weather(
          date: item['dt'],
          temperature: item['main']['temp'],
          description: item ['weather'][0]['description'],
          main: item ['weather'][0]['main'],
        //iconCode: item['weather'][0]['icon']
      ));
    }
    return weathers;
  }

  static String getDay (DateTime date) {
    var formatter = new DateFormat('d');
    var day = formatter.format(date);
    return day;
  }

  static String getCurrentLocation(String loc){
    var editedText = loc.split("/");
    var result = editedText[0] + ', ' + editedText[1];
    return result;
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
    } else if (description == 'Clouds'){
      return WeatherIcons.cloudy;
    }
  }

  static int returnInt(var dTemp){
    int iTemp  = dTemp.round();
    return iTemp;
  }

}