import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:weather_flutter/controller/weather_controller.dart';
import 'package:weather_flutter/view/screen/home.dart';

class SplashScreen extends StatelessWidget {
  SplashScreen({super.key});

  final weatherController = Get.put(WeatherController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GetBuilder<WeatherController>(
        initState: (state) => weatherController.getWeather().then((value) => Get.to(Home())),
        builder: (controller) {
          return Center(child: Text('loading...'));
        },
      ),
    );
  }
}
