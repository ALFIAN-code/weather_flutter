import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:get/get_connect/connect.dart';
import 'package:weather_flutter/models/weather_model.dart';

class WeatherServices extends GetConnect {
  String BASE_URL = 'https://api.openweathermap.org/data/2.5/weather';
  String apiKey = '';

  WeatherServices({required this.apiKey});

  Future getWeather({String latitude = '', String longitude = ''}) async {
    final response =
        await get('$BASE_URL?lon=$longitude&lat=$latitude&units=metric&appid=$apiKey');

    if (response.statusCode == 200) {
      // print(response.body);
      return WeatherModel.fromJson(response.body);
    } else {
      throw 'Error while get data';
    }
  }

  Future<List> getLocation() async {
    //check permission
    LocationPermission permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
    }

    //get user current location
    Position position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high);

    print('services ${position.latitude} ${position.longitude}');

    return [position.latitude, position.longitude];
  }
}
