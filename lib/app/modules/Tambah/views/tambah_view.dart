import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:todolist/app/modules/BottomBar/views/bottom_bar_view.dart';
import 'package:todolist/app/modules/Home/views/home_view.dart';
import 'package:intl/intl.dart';
import '../controllers/tambah_controller.dart';

class TambahView extends StatefulWidget {
  const TambahView({Key? key}) : super(key: key);

  @override
  State<TambahView> createState() => _TambahViewState();
}

class _TambahViewState extends State<TambahView> {
  final TextEditingController judul = TextEditingController();
  final TextEditingController des = TextEditingController();
  final TextEditingController dateController = TextEditingController();

  bool disable = true;
  @override
  void initState() {
    super.initState();
    dateController.text = DateFormat('dd/MM/yyyy').format(DateTime.now());
  }

  @override
  Widget build(BuildContext context) {
    final f = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: Color(0xffF9EA85),
      appBar: AppBar(
        backgroundColor: Color(0xffF9EA85),
        title: Text(
          'EDIT CATATAN',
          style: TextStyle(color: Colors.black),
        ),
        centerTitle: true,
        actions: <Widget>[
          TextButton(
              onPressed: disable
                  ? null
                  : () {
                      print(judul.text);
                      print(des.text);
                      print(dateController.text);
                      // Get.to(BottomBarView());
                    },
              child: Text(
                'Selesai',
                style: TextStyle(color: Colors.black),
              ))
        ],
        leading: IconButton(
            onPressed: () {
              Get.back();
            },
            icon: Icon(
              Icons.arrow_back,
              color: Colors.black,
            )),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Form(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  height: f * 0.03,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: Card(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        TextFormField(
                          controller: judul,
                          keyboardType: TextInputType.text,
                          decoration: InputDecoration(
                              contentPadding: EdgeInsets.symmetric(
                                  vertical: 10, horizontal: 10),
                              hintText: 'Masukkan Judul Catatan',
                              border: InputBorder.none),
                        ),
                        TextFormField(
                          controller: des,
                          onChanged: (text) {
                            setState(() {
                              disable = text.isEmpty;
                            });
                          },
                          maxLines: 40,
                          textAlign: TextAlign.justify,
                          decoration: InputDecoration(
                              hintText: 'Deskripsi Catatan',
                              contentPadding: EdgeInsets.symmetric(
                                  horizontal: 10, vertical: 10),
                              border: InputBorder.none),
                        ),
                      ],
                    ),
                  ),
                ),
                TextFormField(
                  controller: dateController,
                  decoration: InputDecoration(
                    border: InputBorder.none,
                  ),
                  style: TextStyle(
                    color: Colors.transparent,
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
