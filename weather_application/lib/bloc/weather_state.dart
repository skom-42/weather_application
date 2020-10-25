import 'package:weather_application/models/weather_model.dart';
import 'package:meta/meta.dart';
import 'package:equatable/equatable.dart';

abstract class WeatherState extends Equatable {
  const WeatherState();

  @override
  List<Object> get props => [];
}

class WeatherEmpty extends WeatherState {}

class WeatherLoading extends WeatherState {}

class WeatherLoaded extends WeatherState {
  final Weather weather;
  const WeatherLoaded({this.weather}) : assert(weather != null );

  @override
  List<Object> get props => [weather];
}

class WeatherError extends WeatherState{}
