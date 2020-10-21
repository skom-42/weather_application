import 'package:equatable/equatable.dart';
import 'package:weather_application/models/current_weather_model.dart';

abstract class WeatherState extends Equatable {
  const WeatherState();

  @override
  List<Object> get props => [];
}

class WeatherLoading extends WeatherState{}

class WeatherLoadSuccess extends WeatherState{
  final CurrentWeatherModel model;

  const WeatherLoadSuccess({this.model}) : assert(model != null );

  @override
  List<Object> get props => [model];
}

class WeatherLoadFailure extends WeatherState{

}