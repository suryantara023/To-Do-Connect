import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:lottie/lottie.dart';

import '../controllers/splash_screen_controller.dart';

class SplashScreenView extends StatefulWidget {
  const SplashScreenView({Key? key}) : super(key: key);

  @override
  State<SplashScreenView> createState() => _SplashScreenViewState();
}

class _SplashScreenViewState extends State<SplashScreenView> {
  final SplashScreenController controller = Get.put(SplashScreenController());
  double _opacity = 0.0;

  @override
  void initState() {
    super.initState();
    controller.splashStart();
    // controller.cekLogin();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.only(bottom: 100, left: 10, right: 10),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Center(
              child: SizedBox(
                  width: 200,
                  height: 200,
                  child: LottieBuilder.asset('images/splash.json')),
            ),
            Center(
              child: Container(
                width: MediaQuery.of(context).size.width * 0.5,
                child: FittedBox(
                    child: Text(
                  'Yuk Catatan',
                  style: TextStyle(
                      fontWeight: FontWeight.w700, color: Colors.black),
                )),
              ),
            )
          ],
        ),
      ),
    );
  }
}
