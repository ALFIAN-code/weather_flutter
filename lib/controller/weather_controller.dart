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
  String? cityName;
  String? animation;

  List<Color> bgColor = [];

  getWeather() async {
    try {
      var location = await weatherServices.getLocation();
      // print('dijalankan');
      weather = await weatherServices.getWeather(
          latitude: location[0].toString(), longitude: location[1].toString());
      // print('dijalankan');
      update();
      updateView();
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
    switch (weather?.mainWeather) {
      case 'clouds':
      case 'mist':
      case 'smoke':
      case 'haze':
      case 'dust':
      case 'fog':
        animation = 'lib/asset/cloudy.json';
        bgColor = AppColor.cloudy;
        update();
        break;
      case 'rain':
      case 'dizzle':
      case 'shower rain':
        animation = 'lib/asset/rainy.json';
        bgColor = AppColor.rainy;
      case 'thunderstorm':
         animation = 'lib/asset/storm.json';
        bgColor = AppColor.storm;
        update();
        break;
      case 'clear':
        animation = 'lib/asset/sunny.json';
        bgColor = AppColor.sunny;
        update();
        break;
      default:
        animation = 'lib/asset/sunny.json';
        bgColor = AppColor.sunny;
        update();
        break;
    }
    print(bgColor.toList());
  }
}
