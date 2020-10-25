import 'package:flutter/material.dart';

class Weather {
  // int id;
  // int time;
  // int sunrise;
  // int sunset;
  // int humidity;
  // int temperature;
  //
  // String description;
  // String iconCode;
  // String main;
  // String cityName;
  //
  // double windSpeed;

  final location;
  final description; //описание погоды //
  final temperature; //temp; //температура//
  final propability;  //pop; //вероятность осадков
  final quantity; //rain; //кол-во осадков     -------------
  final pressurer; //давление
  final windSpeed; //скорость ветра
  final windDeg;
  final date;

  // Temperature maxTemperature;
  // Temperature minTemperature;

  List<Weather> forecast;

  // Weather(
  //     {this.id,
  //       this.time,
  //       this.sunrise,
  //       this.sunset,
  //       this.humidity,
  //       this.description,
  //       this.iconCode,
  //       this.main,
  //       this.cityName,
  //       this.windSpeed,
  //       this.temperature,
  //       // this.maxTemperature,
  //       // this.minTemperature,
  //       this.forecast});

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
    this.forecast
  });

  // static Weather fromJson(Map<String, dynamic> json) {
  //   final weather = json['weather'][0];
  //   //print(weather['description']);
  //   return Weather(
  //     id: weather['id'],
  //     time: json['dt'],
  //     description: weather['description'],
  //     iconCode: weather['icon'],
  //     main: weather['main'],
  //     cityName: json['name'],
  //     temperature: json['main']['temp'],
  //     // maxTemperature: Temperature(intToDouble(json['main']['temp_max'])),
  //     // minTemperature: Temperature(intToDouble(json['main']['temp_min'])),
  //     sunrise: json['sys']['sunrise'],
  //     sunset: json['sys']['sunset'],
  //     humidity: json['main']['humidity'],
  //     windSpeed: json['wind']['speed'],
  //   );
  // }

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

  static List<Weather> fromForecastJson(Map<String, dynamic> json) {
    final weathers = List<Weather>();
    for (final item in json['list']) {
      weathers.add(Weather(
          date: item['dt'],
          temperature: item['main']['temp']
        //iconCode: item['weather'][0]['icon']
      ));
    }
    return weathers;
  }
}