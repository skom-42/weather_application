import 'package:flutter/material.dart';
import 'package:weather_application/models/weather_model.dart';
import 'package:weather_application/widgets/dotted_line.dart';
import 'package:weather_application/widgets/icon_content.dart';
import 'package:weather_icons/weather_icons.dart';

import '../../constants.dart';

class CurrentWeatherPage extends StatelessWidget {

  const CurrentWeatherPage({this.model});
  final Weather model;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        child:  SafeArea(
          child: Column(
            children: <Widget>[
              Text('Today',
                style: kLageTex,
              ),
              Divider(
                thickness: 2.0,
              ),

              BoxedIcon(
                 Weather.getTitleLogo(model.description),
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

              Text('${Weather.getCurrentLocation(model.location)}',
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
                  IconContent(WeatherIcons.wind_direction,'${Weather.getWindDirection(model.windDeg)}'),
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
      ),
    );
  }
}