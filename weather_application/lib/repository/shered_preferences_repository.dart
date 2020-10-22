import 'package:shared_preferences/shared_preferences.dart';
import 'package:weather_application/models/current_weather_model.dart';

class SPRepository{

  static void saveData(CurrentWeatherModel model) async{



    SharedPreferences myPrefs = await SharedPreferences.getInstance();

    myPrefs.setString('date', model.date.toString());
    myPrefs.setString('location', model.location);
    myPrefs.setString('description', model.description);
    myPrefs.setString('temperature', model.temperature.toString());
    myPrefs.setString('propability', model.propability.toString());
    myPrefs.setString('quantity', model.quantity.toString());
    myPrefs.setString('pressurer', model.pressurer.toString());
    myPrefs.setInt('windSpeed', model.windSpeed);
    myPrefs.setInt('windDeg', model.windDeg);
  }

  static Future<CurrentWeatherModel> loadData() async{
    SharedPreferences myPrefs = await SharedPreferences.getInstance();
    return new CurrentWeatherModel(
      myPrefs.get('location'),
      myPrefs.get('description'),
      myPrefs.get('temperature'),
      myPrefs.get('propability'),
      myPrefs.get('quantity'),
      myPrefs.get('pressurer'),
      myPrefs.get('windSpeed'),
      myPrefs.get('windDeg'),
      myPrefs.get('date'),
    );
  }

}