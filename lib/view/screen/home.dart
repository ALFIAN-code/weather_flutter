import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:weather_flutter/controller/weather_controller.dart';
import 'package:lottie/lottie.dart';

//style
import '../style.dart';
import '../widget/card_information.dart';

class Home extends StatelessWidget {
  Home({super.key});

  final weatherController = Get.put(WeatherController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(
      children: [
        GetBuilder<WeatherController>(
          didUpdateWidget: (__, _) => weatherController.bgColor,
          builder:(controller) => Container(
            decoration: BoxDecoration(
                gradient: LinearGradient(
                    colors: weatherController.bgColor,
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight)),
          ),
        ),
        SafeArea(
          child: Center(
            child: Padding(
              padding: const EdgeInsets.only(top: 10),
              child: Column(
                children: [
                  //weather
                  GetBuilder<WeatherController>(
                    didUpdateWidget: (_, __) => weatherController.updateView(),
                    builder:(controller) => Text(
                      '${weatherController.weather?.mainWeather}',
                      style: Fonts.extraBold36,
                    ),
                  ),
                  //animation
                  LottieBuilder.asset(
                    WeatherAnimation.sunny,
                    fit: BoxFit.cover,
                    height: 300,
                    width: 300,
                  ),
                  //temperature
                  Padding(
                    padding: const EdgeInsets.only(left: 30),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        GetBuilder<WeatherController>(
                          initState: (state) => weatherController.getWeather(),
                          init: WeatherController(),
                          builder: (controller) =>  Text(
                           '${weatherController.weather?.temperature}',
                            style: Fonts.extraBold90,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 10, vertical: 10),
                          child: Text(
                            '°',
                            style: Fonts.medium44,
                          ),
                        ),
                      ],
                    ),
                  ),

                  //feels like
                  GetBuilder<WeatherController>(
                    init: weatherController,
                    initState: (state) => weatherController.getWeather(),
                    builder: (controller) => Text(
                      'feels Like ${weatherController.weather?.feelsLike}',
                      style:
                          Fonts.regular20.copyWith(fontWeight: FontWeight.w800),
                    ),
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  // card
                  const CardInformation()
                ],
              ),
            ),
          ),
        )
      ],
    ));
  }
}
