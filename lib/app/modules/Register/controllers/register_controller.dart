import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:todolist/app/modules/Login/views/login_view.dart';

class RegisterController extends GetxController {
  //TODO: Implement RegisterController
  final TextEditingController name = TextEditingController();
  final TextEditingController email = TextEditingController();
  final TextEditingController password = TextEditingController();

  Dio dio = Dio();
  final String baseUrl =
      'https://crowning-bailing.000webhostapp.com/api/register';

  Future<void> register(String name, String email, String password) async {
    try {
      final response = await dio.post(baseUrl,
          data: {'name': name, 'email': email, 'password': password});

      if (response.statusCode == 201) {
        print(response.data);
        Get.to(LoginView());
        return response.data;
      }
    } catch (e) {
      print(e);
    }
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
