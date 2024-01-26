
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../style.dart';

class CardInformation extends StatelessWidget {
  const CardInformation({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10)),
        Container(
          height: 210,
          padding: const EdgeInsets.symmetric(
              horizontal: 20, vertical: 20),
          margin: const EdgeInsets.symmetric(horizontal: 15),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              gradient: LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  colors: [
                    const Color(0xffFFFFFF).withOpacity(0.4),
                    const Color(0xffFFFFFF).withOpacity(0.3)
                  ])),
          child: Column(
            children: [
              Row(
                children: [
                  Image.asset(
                    'lib/asset/city2.png',
                    fit: BoxFit.contain,
                    height: 20,
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  Text(
                    'Surabaya',
                    style: Fonts.semiBold16,
                  )
                ],
              ),
              const SizedBox(
                height: 10,
              ),
              const Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Info(
                    icon: 'lib/asset/8726449_wind_icon.svg',
                    value: '5.66 m/s',
                    infoName: 'Wind Speed',
                  ),
                  Info(
                    icon:
                        'lib/asset/2682807_drop_high_humidity_percentage_precipitation_icon.svg',
                    value: '49%',
                    infoName: 'Humidity',
                  ),
                  Info(
                    icon: 'lib/asset/gauge.svg',
                    value: '1010 hPa',
                    infoName: 'Pressure',
                  ),
                ],
              )
            ],
          ),
        ),
      ],
    );
  }
}

class Info extends StatelessWidget {
  const Info(
      {super.key,
      required this.icon,
      required this.value,
      required this.infoName});

  final String icon;
  final String infoName;
  final String value;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SvgPicture.asset(
          icon,
          height: 70,
        ),
        const SizedBox(
          height: 20,
        ),
        Text(
          infoName,
          style: Fonts.regular10,
        ),
        const SizedBox(
          height: 10,
        ),
        Text(
          value,
          style: Fonts.semiBold16,
        )
      ],
    );
  }
}
