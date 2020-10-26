import 'package:flutter/material.dart';
import 'package:weather_application/models/weather_model.dart';
import 'package:weather_application/widgets/list_item.dart';
import 'package:grouped_list/grouped_list.dart';
import 'package:intl/intl.dart';
import "package:collection/collection.dart";
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

    // readGroup() {
    //   setState((){
    //     this.widget.weathers.forEach((item){
    //       groupSet.add(Weather.getDay(item.date));
    //     });
    //   });
    // }
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
            //var condition = DateFormat('EEEE').format(DateTime.fromMillisecondsSinceEpoch(weather.date * 1000));
            return date.weekday;
            },
          groupSeparatorBuilder: (int value) {
            return Seporator(day: value);
            },
            // groupComparator: (value1, value2) {
            // var date = DateTime.now();
            // var currentNumberOfDay = date.weekday;
            // //return
            // },
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
          //   itemBuilder: (context, index) {
          //     final item = this.widget.weathers[index];
          //     return Center(
          //       child: Item(
          //         date: item.date,
          //         temperature: item.temperature,
          //         description: item.description,),
          //    );
          //   },
          ),
      ),
         // child: ListView.separated(
         //   separatorBuilder: (context, index) => Divider(),
         //   itemCount: groupSet.length,
         //   itemBuilder: (context, index) {
         //     final item = this.widget.weathers[index];
         //     return Center(
         //       child: Item(
         //         date: item.date,
         //         temperature: item.temperature,
         //         description: item.description,),
         //    );
         //   },
         // ),
      );
  }
}
