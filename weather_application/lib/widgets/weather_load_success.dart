import 'package:flutter/material.dart';
import 'package:weather_application/models/weather_model.dart';

import 'package:weather_application/services/weather.dart';
import 'package:weather_icons/weather_icons.dart';

import '../constants.dart';
import 'dotted_line.dart';
import 'icon_content.dart';

class weatherLoadSuccess extends StatelessWidget {
  const weatherLoadSuccess({
    Key key,
    @required this.model,
  }) : super(key: key);

  final Weather model;

  @override
  Widget build(BuildContext context) {
    DateTime now = new DateTime.now();
    DateTime date = new DateTime(now.year, now.month, now.day);

    return Container(
      child:  SafeArea(
        child: Column(
          children: <Widget>[
            Text(getDateTime(DateTime.parse(model.date.toString())) == date ? 'Today' : model.date.toString(),
              style: kLageTex,
            ),
            Divider(
              thickness: 2.0,
            ),

            BoxedIcon(
              WeatherIcons.day_sunny,
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
                IconContent(WeatherIcons.wind_direction,'${model.windSpeed}'),
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


DateTime getDateTime (DateTime dateTime){
  return DateTime(dateTime.year,dateTime.month,dateTime.day);
}