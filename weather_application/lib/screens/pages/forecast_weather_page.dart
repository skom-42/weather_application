import 'package:flutter/material.dart';
import 'package:weather_application/models/weather_model.dart';
import 'package:weather_application/widgets/list_item.dart';
import 'package:grouped_list/grouped_list.dart';
import 'package:weather_application/widgets/separator.dart';

class ForecastWeatherPage extends StatefulWidget {
  const ForecastWeatherPage({this.weathers, this.city});
  final List<Weather> weathers;
  final String city;

  @override
  _ForecastWeatherPageState createState() => _ForecastWeatherPageState();
}

class _ForecastWeatherPageState extends State<ForecastWeatherPage> {

  @override
  void initState() {
    super.initState();

  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          title: Text(Weather.getCurrentLocation(this.widget.city),
          style: TextStyle(color: Colors.black),),
        ),
        body: GroupedListView<dynamic, int>(
          elements: this.widget.weathers,
            groupBy: (weather) {
            var date = DateTime.fromMillisecondsSinceEpoch(weather.date * 1000);
            return date.weekday;
            },
          groupSeparatorBuilder: (int value) {
            return Seporator(day: value);
            },

          order: GroupedListOrder.ASC,
          itemBuilder: (context, dynamic weather) {
            return Card(
              child: Item(
                date: weather.date,
                temperature: weather.temperature,
                description: weather.description,
                main: weather.main,
              ),
            );
          }
          ),
      ),
    );
  }
}
