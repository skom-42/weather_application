import 'package:bloc/bloc.dart';
import 'package:weather_application/models/weather_model.dart';
import 'package:meta/meta.dart';
import 'package:weather_application/bloc/weather_event.dart';
import 'package:weather_application/bloc/weather_state.dart';
import 'package:weather_application/repository/weather_repository.dart';


class WeatherBloc extends Bloc<WeatherEvent, WeatherState> {
  final WeatherRepository weatherRepository;

  WeatherBloc({@required this.weatherRepository})
      : assert(weatherRepository != null),
        super(WeatherLoading());

  @override
  Stream<WeatherState> mapEventToState(WeatherEvent event) async* {
    if (event is FetchWeather) {
      try {
        final Weather weather = await weatherRepository.getWeather();
        yield WeatherLoaded(weather: weather);
      } catch (_) {
        yield WeatherError();

      }
    }
  }
}