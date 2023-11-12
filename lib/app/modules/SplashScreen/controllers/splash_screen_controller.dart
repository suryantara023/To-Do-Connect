import 'package:get/get.dart';
import 'package:todolist/app/modules/Login/views/login_view.dart';

class SplashScreenController extends GetxController {
  //TODO: Implement SplashScreenController
  var duration = Duration(seconds: 4);

  splashStart() async {
    return Future.delayed(duration, () {
      Get.to(LoginView());
    });
  }

  final count = 0.obs;
  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

  void increment() => count.value++;
}
