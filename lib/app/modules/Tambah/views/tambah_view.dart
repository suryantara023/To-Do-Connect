import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:todolist/app/modules/BottomBar/views/bottom_bar_view.dart';
import 'package:todolist/app/modules/Home/views/home_view.dart';

import '../controllers/tambah_controller.dart';

class TambahView extends StatefulWidget {
  const TambahView({Key? key}) : super(key: key);

  @override
  State<TambahView> createState() => _TambahViewState();
}

class _TambahViewState extends State<TambahView> {
  final TextEditingController judul = TextEditingController();
  final TextEditingController des = TextEditingController();
  bool disable = true;

  @override
  Widget build(BuildContext context) {
    final f = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
        title: Text('To-Do Connect'),
        centerTitle: true,
        actions: <Widget>[
          TextButton(
              onPressed: disable
                  ? null
                  : () {
                      Get.to(BottomBarView());
                    },
              child: Text(
                'Selesai',
                style: TextStyle(color: Colors.white),
              ))
        ],
        leading: IconButton(
            onPressed: () {
              Get.back();
            },
            icon: Icon(Icons.arrow_back)),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Form(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  height: f * 0.01,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Card(
                        child: TextFormField(
                          controller: judul,
                          keyboardType: TextInputType.text,
                          decoration: InputDecoration(
                            contentPadding: EdgeInsets.symmetric(
                                vertical: 10, horizontal: 10),
                            label: Text('Masukkan Judul Catatan'),
                            border: OutlineInputBorder(),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: f * 0.01,
                      ),
                      Card(
                        child: TextFormField(
                          controller: des,
                          onChanged: (text) {
                            setState(() {
                              disable = text.isEmpty;
                            });
                          },
                          maxLines: 42,
                          textAlign: TextAlign.justify,
                          decoration: InputDecoration(
                            hintText: 'Deskripsi Catatan',
                            contentPadding: EdgeInsets.symmetric(
                                horizontal: 10, vertical: 10),
                            border: OutlineInputBorder(),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
