import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:todolist/app/modules/BottomBar/views/bottom_bar_view.dart';
import 'package:todolist/app/modules/Home/views/home_view.dart';

class LoginController extends GetxController {
  final TextEditingController email = TextEditingController();
  final TextEditingController password = TextEditingController();

  Dio dio = Dio();
  final String baseUlr = 'https://crowning-bailing.000webhostapp.com/api/login';

  Future<void> login(String email, String password) async {
    try {
      final response =
          await dio.post(baseUlr, data: {'email': email, 'password': password});

      if (response.statusCode == 201) {
        print(response.data);
        Get.to(HomeView());
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
