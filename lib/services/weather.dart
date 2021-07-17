import 'package:weatherapp/services/location.dart';
import 'package:weatherapp/services/networking.dart';

class WeatherModel {
  final String apiKey = '17d41c3228504d52194ce2a2b9da3390';

  Future <dynamic> getLocation()async{
    Location location = Location();
    await location.getLocation();
    print('long '+location.lat.toString());
    print('lat '+location.long.toString());
    NetworkHelper networkHelper  = NetworkHelper(
        url: 'https://api.openweathermap.org/data/2.5/weather?lat=${location.lat.toString()}&lon=${location.long.toString()}&appid=$apiKey&units=metric');
    var weatherData = await networkHelper.getWeatherData();
    return weatherData;
  }

  Future <dynamic> getLocationBasedOnCityName(String cityName)async{
    NetworkHelper networkHelper  = NetworkHelper(
        url: 'https://api.openweathermap.org/data/2.5/find?q=$cityName&appid=$apiKey&units=metric');
    var weatherData = await networkHelper.getWeatherData();
    return weatherData;
  }

  String getWeatherIcon(int condition) {
    if (condition < 300) {
      return '🌩';
    } else if (condition < 400) {
      return '🌧';
    } else if (condition < 600) {
      return '☔️';
    } else if (condition < 700) {
      return '☃️';
    } else if (condition < 800) {
      return '🌫';
    } else if (condition == 800) {
      return '☀️';
    } else if (condition <= 804) {
      return '☁️';
    } else {
      return '🤷‍';
    }
  }

  String getMessage(int temp) {
    if (temp > 25) {
      return 'It\'s 🍦 time';
    } else if (temp > 20) {
      return 'Time for shorts and 👕';
    } else if (temp < 10) {
      return 'You\'ll need 🧣 and 🧤';
    } else {
      return 'Bring a 🧥 just in case';
    }
  }
}
