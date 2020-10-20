import 'package:flutter/material.dart';
import 'package:weather_application/components/icon_content.dart';
import 'package:weather_application/constants.dart';
import 'package:weather_application/components/dotted_line.dart';
import 'package:weather_icons/weather_icons.dart';
import 'package:weather_application/services/weather.dart';

class LocationScreen extends StatefulWidget {

  LocationScreen({this.locationWeather});
  final locationWeather;

  @override
  _LocationScreenState createState() => _LocationScreenState();
}

class _LocationScreenState extends State<LocationScreen> {

  String location;
  String description; //описание погоды //
  int temperature; //temp; //температура//
  int propability;  //pop; //вероятность осадков
  double quantity; //rain; //кол-во осадков     -------------
  int pressurer; //давление
  int windSpeed; //скорость ветра
  String windDeg;
  IconData mainIcon;


  WeatherModel weather = WeatherModel();
  String message;

  void updateUI(dynamic wetherData) {
    setState(() {
      print(wetherData);
      String loc = wetherData['timezone'];
      location = weather.getCurrentLocation(loc);
      print('location $location');
      //
      temperature  = wetherData['current']['temp'];
      print("temperature: $temperature ");
      //
      description = wetherData['current']['weather'][0]['main'];
      print('description $description');
      //
      propability = wetherData['hourly'][0]['pop'];
      print ('propability $propability');
      //
      quantity = wetherData['daily'][0]['rain'];
      print('Вероятность $quantity');
      //
      pressurer = wetherData['current']['pressure'];
      print(pressurer);
      //
      int wind = wetherData['current']['wind_speed'];
      windSpeed = weather.editedWindSpeed(wind);
      print(windSpeed);
      //
      int windDirection = wetherData['current']['wind_deg'];
      windDeg = weather.getWindDirection(windDirection);
      print(windDeg);

      mainIcon = weather.getTitleLogo(description);

    });
  }

  @override
  void initState(){
    super.initState();

    updateUI(widget.locationWeather);
  }


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
                mainIcon,
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

              Text('$location',
                style: kLocationText,
              ),

              SizedBox(
                height: 5.0,
              ),

              Text('$temperature°C | $description',
                style: kWeatherStatus,
              ),

              DottedLine(),

              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  IconContent(WeatherIcons.rain_wind,'$propability%'),
                  IconContent(WeatherIcons.raindrop, '$quantity mm'),
                  IconContent(WeatherIcons.celsius, '$pressurer hPa'),
                ],
              ),

              SizedBox(
                height: 20.0,
              ),

              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  IconContent(WeatherIcons.strong_wind, '$windSpeed km/h'),
                  IconContent(WeatherIcons.wind_direction,'$windDeg'),
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