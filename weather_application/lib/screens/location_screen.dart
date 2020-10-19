import 'package:flutter/material.dart';
import 'package:weather_application/components/icon_content.dart';
import 'package:weather_application/constants.dart';
import 'package:weather_application/components/dotted_line.dart';
import 'package:weather_icons/weather_icons.dart';

class LocationScreen extends StatefulWidget {

  @override
  _LocationScreenState createState() => _LocationScreenState();
}

class _LocationScreenState extends State<LocationScreen> {


  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: SafeArea(
          child: Column(
            children: <Widget>[
              Text('Today',
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

              Text('London, UK',
                style: kLocationText,
              ),

              SizedBox(
                height: 5.0,
              ),

              Text('22°C | Sunny',
                style: kWeatherStatus,
              ),

              DottedLine(),

              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  IconContent(WeatherIcons.rain_wind,'57%'),
                  IconContent(WeatherIcons.raindrop, '1.0 mm'),
                  IconContent(WeatherIcons.celsius, '1019 hPa'),
                ],
              ),

              SizedBox(
                height: 20.0,
              ),

              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  IconContent(WeatherIcons.strong_wind, '20 km/h'),
                  IconContent(WeatherIcons.wind_direction,'SE'),
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

      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        type: BottomNavigationBarType.fixed,
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.wb_sunny),
            title: Text('Today'),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.wb_sunny),
            title: Text('Forecast'),
          ),
        ],
        onTap: (index){
          setState(() {
            _currentIndex = index;
          });
        },
      ),
    );
  }
}
