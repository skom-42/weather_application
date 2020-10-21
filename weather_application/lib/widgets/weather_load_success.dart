import 'package:flutter/material.dart';
import 'package:weather_application/models/current_weather_model.dart';
import 'package:weather_icons/weather_icons.dart';

import '../constants.dart';
import 'dotted_line.dart';
import 'icon_content.dart';

class weatherLoadSuccess extends StatelessWidget {
  const weatherLoadSuccess({
    Key key,
    @required this.model,
  }) : super(key: key);

  final CurrentWeatherModel model;

  @override
  Widget build(BuildContext context) {
    return Container(
      child:  SafeArea(
        child: Column(
          children: <Widget>[
            Text('Today', //TODO change if offline
              style: kLageTex,
            ),
            Divider(
              thickness: 2.0,
            ),

            BoxedIcon(
              CurrentWeatherModel.getTitleLogo(model.description),
              color: Colors.amber,
              size: MediaQuery.of(context).size.width/3,
            ),
            // Container(
            //   margin: EdgeInsets.only(top: 20, bottom: 40),
            //   child: Icon(WeatherIcons.day_sunny,
            //   size: MediaQuery.of(context).size.width/3,
            //   color: Colors.amber,
            //   ),
            // ),

            Text('${model.location}',
              style: kLocationText,
            ),

            SizedBox(
              height: 5.0,
            ),

            Text('${model.temperature}°C | ${model.description}',
              style: kWeatherStatus,
            ),

            DottedLine(),

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                IconContent(WeatherIcons.rain_wind,'${model.propability} %'),
                IconContent(WeatherIcons.raindrop, '${model.quantity} mm'),
                IconContent(WeatherIcons.celsius, '${model.pressurer} hPa'),
              ],
            ),

            SizedBox(
              height: 20.0,
            ),

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                IconContent(WeatherIcons.strong_wind, '${model.windSpeed} km/h'),
                IconContent(WeatherIcons.wind_direction,'${CurrentWeatherModel.getWindDirection(model.windDeg)}'),
              ],
            ),

            DottedLine(),

            FlatButton(
              onPressed: (){
              },
              child:
              Text('Share', style: TextStyle(
                color: Colors.deepOrangeAccent,
                fontSize: 20.0,
              ),),
            ),
          ],
        ),
      ),
    );
  }}