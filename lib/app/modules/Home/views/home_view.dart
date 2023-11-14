import 'package:flutter/material.dart';
import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'package:todolist/app/modules/Edit/views/edit_view.dart';
import 'package:todolist/app/modules/Login/controllers/login_controller.dart';
import 'package:todolist/app/modules/QrCode/views/qr_code_view.dart';
import 'package:todolist/app/modules/Tambah/views/tambah_view.dart';

import '../controllers/home_controller.dart';

class HomeView extends StatefulWidget {
  HomeView({Key? key}) : super(key: key);

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  final LoginController login = LoginController();
  Dio dio = Dio();
  final String baseUrl = "https://crowning-bailing.000webhostapp.com/api/home";
  void GetData() async {
    final response = await dio.get(baseUrl);
    if (response.statusCode == 200) {
      print(
        response.data,
      );
    }
  }

  @override
  void initState() {
    super.initState();
    GetData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Stack(
          clipBehavior: Clip.none,
          children: [
            Container(
              width: double.infinity,
              height: MediaQuery.of(context).size.height * 0.8,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(1000),
                    bottomRight: Radius.circular(1000)),
                color: Color(0xffF9EA85),
              ),
            ),
            Positioned(
              top: 50,
              left: 55,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Hello Agus',
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 30),
                      ),
                      Text(
                        'Ingat List Kegiatan Mu !!!',
                        style: TextStyle(
                            fontWeight: FontWeight.w300, fontSize: 15),
                      ),
                    ],
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Container(
                    width: 100,
                    height: 100,
                    child: CircleAvatar(
                      backgroundImage: AssetImage('images/-.jfif'),
                    ),
                  )
                ],
              ),
            ),
            Positioned(
                top: 150,
                left: 20,
                child: FilledButton(
                    onPressed: () {
                      Get.to(TambahView());
                    },
                    child: Text(
                      'Tambah Catatan Baru',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ))),
            Positioned(
              top: 200,
              child: Container(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height * 0.6,
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: ListView.builder(
                      itemCount: 100,
                      itemBuilder: (context, index) {
                        return GestureDetector(
                          onTap: () {
                            showModalBottomSheet(
                                context: context,
                                builder: (context) {
                                  return Column(
                                    children: [
                                      Card(
                                        child: ListTile(
                                          title: Text('Lihat Qr Code'),
                                          leading:
                                              Icon(Icons.qr_code_2_outlined),
                                          onTap: () {
                                            Get.to(QrCodeView());
                                          },
                                        ),
                                      ),
                                      Card(
                                        child: ListTile(
                                          title: Text('Edit Catatan'),
                                          leading: Icon(Icons.edit),
                                          onTap: () {
                                            Get.to(EditView());
                                          },
                                        ),
                                      ),
                                      Card(
                                        child: ListTile(
                                          title: Text('Hapus Catatan'),
                                          leading: Icon(Icons.delete),
                                          onTap: () {},
                                        ),
                                      ),
                                    ],
                                  );
                                });
                          },
                          child: Card(
                            child: ListTile(
                              leading: Icon(
                                Icons.calendar_today_rounded,
                                size: 30,
                              ),
                              title: Text(
                                'Judul',
                                style: TextStyle(
                                    fontWeight: FontWeight.bold, fontSize: 20),
                              ),
                              subtitle: Text(
                                'Tanggal',
                                style: TextStyle(fontWeight: FontWeight.w300),
                              ),
                            ),
                          ),
                        );
                      }),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
