import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class Background extends StatelessWidget {
  final Widget? child;
  final String? icon;

  const Background({Key? key, @required this.child, this.icon})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SizedBox(
        height: size.height,
        width: double.infinity,
        child: Stack(
          children: [
            Positioned(
                bottom: 0,
                right: 0,
                left: 0,
                child:Lottie.asset(
                    'assets/lottie/weather.json', height: 150, width:
                150)),




            child!,
          ],
        )

        //Image.asset("assets/icons/splash_screen_coli.splash_background_coli.png",),

        );
  }
}
