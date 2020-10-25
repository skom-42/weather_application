import 'package:flutter/material.dart';
import 'package:weather_application/bloc/weather_bloc.dart';
import 'package:weather_application/bloc/weather_event.dart';
import 'package:weather_application/bloc/weather_state.dart';
import 'package:weather_application/models/weather_model.dart';
import 'package:weather_application/repository/weather_repository.dart';
import 'package:weather_application/widgets/weather_load_success.dart';
import 'package:flutter_bloc/flutter_bloc.dart';



class LocationScreen extends StatefulWidget {

  LocationScreen({this.repo});
  WeatherRepository repo;

  @override
  _LocationScreenState createState() => _LocationScreenState(repo: repo);
}

class _LocationScreenState extends State<LocationScreen> {
  WeatherRepository repo;
  Weather model;
  _LocationScreenState({this.repo});


  int _currentIndex = 0;

  @override
  void initState() {
    super.initState();
    BlocProvider.of<WeatherBloc>(context).add(FetchWeather());
  }

  getLocationData() async {
    model = await repo.getWeather();
    print(model.windSpeed);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        reverse: true,
        child: Center(
          child: BlocBuilder<WeatherBloc,WeatherState>(
              builder: weatherBlocBuilder
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

  Widget weatherBlocBuilder(context,state) {
    if(state is WeatherLoading){
      return Container(
          margin: EdgeInsets.only(top: MediaQuery.of(context).size.height / 2),
          child: Center(child: CircularProgressIndicator()));
    }
    if(state is WeatherLoaded){
      model = state.weather;
      return weatherLoadSuccess(model: model);
    }
    else {
      return Text("Error");
    }
  }
}