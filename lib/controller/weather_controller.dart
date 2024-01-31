import 'dart:ui';

import 'package:geocoding/geocoding.dart';
import 'package:get/get.dart';
import 'package:weather_flutter/models/weather_model.dart';
import 'package:weather_flutter/services/weather_services.dart';
import 'package:weather_flutter/view/style.dart';

class WeatherController extends GetxController {
  var weatherServices =
      WeatherServices(apiKey: '025bf7f21bca338a41ebb2116ef4890d');
  WeatherModel? weather;
  // var isLoading = true;
  String? cityName;
  String? animation;

  List<Color> bgColor = [];

  getWeather() async {
    // isLoading = true;
    // update();
    try {
      var location = await weatherServices.getLocation();
      weather = await weatherServices.getWeather(
          latitude: location[0].toString(), longitude: location[1].toString());
      updateView();
      getCityName();
      update();
      print(weather?.mainWeather);
    } catch (e) {
      print('error : $e');
    }
  }

  getCityName() async {
    var location = await weatherServices.getLocation();
    var address = await placemarkFromCoordinates(location[0], location[1]);
    cityName = address[0].locality;
    update();
  }

  updateView() {
    /* 
      //cloudy
      clouds, mist, smoke, haze, dust, fog, 

      //rain 
      rain, dizzle, shower rain

      //storm
      thunderstorm

      //clear
      sunny
    */
    switch (weather?.mainWeather.toLowerCase()) {
      case 'clouds':
      case 'mist':
      case 'smoke':
      case 'haze':
      case 'dust':
      case 'fog':
        weather?.mainWeather = 'Cloudy';
        animation = WeatherAnimation.cloudy;
        bgColor = AppColor.cloudy;
        break;
      case 'rain':
      case 'dizzle':
      case 'shower rain':
        weather?.mainWeather = 'Rainy';
        animation = WeatherAnimation.rainy;
        bgColor = AppColor.rainy;
      case 'thunderstorm':
        weather?.mainWeather = 'Storm';
        animation = WeatherAnimation.storm;
        bgColor = AppColor.storm;
        break;
      case 'clear':
        weather?.mainWeather = 'Sunny';
        animation = WeatherAnimation.sunny;
        bgColor = AppColor.sunny;
        break;
      default:
        weather?.mainWeather = 'Sunny';
        animation = WeatherAnimation.sunny;
        bgColor = AppColor.sunny;
        break;
    }
    update();
  }
}
