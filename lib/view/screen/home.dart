import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:weather_flutter/controller/weather_controller.dart';
import 'package:lottie/lottie.dart';

//style
import '../style.dart';
import '../widget/card_information.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final weatherController = Get.put(WeatherController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: GetBuilder<WeatherController>(
      // didUpdateWidget: (oldWidget, state) => weatherController.getCityName() ,
      initState: (state) => weatherController.getCityName(),
      builder: (controller) => Stack(
        children: [
          Container(
            decoration: BoxDecoration(
                gradient: LinearGradient(
                    colors: weatherController.bgColor,
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight)),
          ),
          Center(
            child: Padding(
              padding: const EdgeInsets.only(top: 40),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  //weather
                  Text(
                    '${weatherController.weather?.mainWeather}',
                    style: Fonts.extraBold36,
                  ),
                  //animation
                  LottieBuilder.asset(
                    '${weatherController.animation}',
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
                        Text(
                          '${weatherController.weather?.temperature}',
                          style: Fonts.extraBold90,
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
                  Text(
                    'feels Like ${weatherController.weather?.feelsLike}',
                    style:
                        Fonts.regular20.copyWith(fontWeight: FontWeight.w800),
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  // card
                  CardInformation(
                    weatherController: weatherController,
                  ),
                  const SizedBox(
                    height: 10,
                  )
                ],
              ),
            ),
          )
        ],
      ),
    ));
  }
}
