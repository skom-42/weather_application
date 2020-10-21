import 'package:flutter/material.dart';
import 'package:weather_application/bloc/location_bloc.dart';
import 'package:weather_application/bloc/location_events.dart';
import 'package:weather_application/bloc/location_states.dart';
import 'package:weather_application/models/current_weather_model.dart';
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
  CurrentWeatherModel model;
  _LocationScreenState({this.repo});


  int _currentIndex = 0;

  @override
  void initState() {
    super.initState();
    BlocProvider.of<WeatherBloc>(context).add(WeatherRequested());
  }

  getLocationData() async {
    model = await repo.getLocationWeather();
    print(model.windDeg);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: BlocBuilder<WeatherBloc,WeatherState>(
            builder: weatherBlocBuilder
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
      return Center(child: CircularProgressIndicator());
    }
    if(state is WeatherLoadSuccess){
      model = state.model;
      return weatherLoadSuccess(model: model);
    }
    else {
      //TODO if SP empty return textError
      //TODO when data loaded from SP return weatherLoadSuccess + Toast(no connection)
      return Text("Error");
    }
  }
}