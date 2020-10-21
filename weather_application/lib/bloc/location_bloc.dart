import 'package:meta/meta.dart';
import 'package:bloc/bloc.dart';
import 'package:weather_application/repository/weather_repository.dart';
import 'package:weather_application/models/current_weather_model.dart';
import 'package:weather_application/bloc/location_events.dart';
import 'package:weather_application/bloc/location_states.dart';




class WeatherBloc extends Bloc<WeatherEvent, WeatherState> {
  final WeatherRepository weatherRepository;

  WeatherBloc({@required this.weatherRepository})
      : assert(weatherRepository != null),
        super(WeatherLoading());

  @override
  Stream<WeatherState> mapEventToState(WeatherEvent event) async* {
    if (event is WeatherRequested) {
      try {
        final CurrentWeatherModel weather = await weatherRepository.getLocationWeather();
        yield WeatherLoadSuccess(model: weather);
      } catch (_) {
        yield WeatherLoadFailure();
      }
    }
  }
}