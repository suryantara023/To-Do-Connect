import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:todolist/app/modules/Home/views/home_view.dart';
import 'package:todolist/app/modules/Profile/views/profile_view.dart';
import 'package:todolist/app/modules/Scanner/views/scanner_view.dart';
import 'package:todolist/app/modules/Tambah/views/tambah_view.dart';

import '../controllers/bottom_bar_controller.dart';

class BottomBarView extends StatefulWidget {
  const BottomBarView({Key? key}) : super(key: key);

  @override
  State<BottomBarView> createState() => _BottomBarViewState();
}

class _BottomBarViewState extends State<BottomBarView> {
  int selectedIndex = 0;
  List<Widget> body = [HomeView(), ProfileView()];

  void tapItem(int index) {
    setState(() {
      selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
          child: Icon(Icons.qr_code_scanner_rounded),
          onPressed: () {
            Get.to(ScannerView());
          }),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      body: body[selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
          selectedItemColor: Colors.white,
          unselectedItemColor: Colors.white,
          backgroundColor: Colors.blueAccent,
          currentIndex: selectedIndex,
          onTap: tapItem,
          items: [
            BottomNavigationBarItem(
              icon: Icon(Icons.home_rounded),
              label: 'Home',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.person),
              label: 'Profile',
            ),
          ]),
    );
  }
}
