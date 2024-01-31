import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:weather_flutter/controller/weather_controller.dart';

import 'package:weather_flutter/view/screen/home.dart';
import 'package:weather_flutter/view/style.dart';

class SplashScreen extends StatelessWidget {
  SplashScreen({super.key});

  final weatherController = Get.put(WeatherController());

  var isError = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GetBuilder<WeatherController>(
          initState: (state) => weatherController.getWeather().then((value) {
                if (weatherController.weather?.mainWeather == null) {
                  // myshowDialog();
                  Get.dialog(
                    MyDialog(weatherController: weatherController),
                  );
                } else {
                  Get.offAll(() => const Home(), transition: Transition.leftToRight);
                }
              }),
          builder: (controller) {
            // print(weatherController.weather?.mainWeather);
            // print(weatherController.isLoading);

            return Center(
              child: LottieBuilder.asset(
                'lib/asset/loading.json',
                height: 300,
                fit: BoxFit.contain,
              ),
            );
          }),
    );
  }
}

class MyDialog extends StatelessWidget {
  const MyDialog({
    super.key,
    required this.weatherController,
  });

  final WeatherController weatherController;

  @override
  Widget build(BuildContext context) {
    return Dialog(
      child: Padding(
        padding: const EdgeInsets.fromLTRB(50, 0, 50, 20),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            LottieBuilder.asset('lib/asset/error.json',
                height: 200, repeat: false),
            Text('Oh snap..!!!', style: Fonts.bold18),
            const SizedBox(
              height: 10,
            ),
            Text(
              'something went wrong while getting the data',
              style: Fonts.regular12,
              textAlign: TextAlign.center,
            ),
            const SizedBox(
              height: 15,
            ),
            // SizedBox(
            //   width: double.infinity,
            //   child: ElevatedButton(
            //     onPressed: () => weatherController.update(),
            //     style: ElevatedButton.styleFrom(
            //         backgroundColor: Colors.red.shade200),
            //     child: const Text(
            //       'Reload',
            //       style: TextStyle(color: Colors.white),
            //     ),
            //   ),
            // )
          ],
        ),
      ),
    );
  }
}
