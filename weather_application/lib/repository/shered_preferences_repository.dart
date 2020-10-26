import 'package:shared_preferences/shared_preferences.dart';
import 'package:weather_application/models/weather_model.dart';

class SPRepository{

  static void saveData(Weather model) async{

    SharedPreferences myPrefs = await SharedPreferences.getInstance();

    List<Map<String, dynamic>> myListOfStrings=  model.forecast.map((i)=>Weather.toMap(i)).toList();

    myPrefs.setString('location', model.location.toString());
    myPrefs.setString('description', model.description);
    myPrefs.setString('temperature', model.temperature);
    myPrefs.setString('propability', model.propability.toString());
    myPrefs.setString('quantity', model.quantity.toString());
    myPrefs.setString('pressurer', model.pressurer.toString());
    myPrefs.setString('windSpeed', model.windSpeed.toString());
    myPrefs.setInt('windDeg', model.windDeg);
    myPrefs.setInt('date', model.date);
    myPrefs.setInt('main', model.main);
  }

  static Future<Weather> loadData() async{
    SharedPreferences myPrefs = await SharedPreferences.getInstance();
    return new Weather(
      location: myPrefs.get('location'),
      description: myPrefs.get('description'),
      temperature: myPrefs.get('temperature'),
      propability: myPrefs.get('propability'),
      quantity: myPrefs.get('quantity'),
      pressurer: myPrefs.get('pressurer'),
      windSpeed: myPrefs.get('windSpeed'),
      windDeg: myPrefs.get('windDeg'),
      date: myPrefs.get('date'),
      main: myPrefs.get('main'),
    );
  }



}