import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:todolist/app/modules/BottomBar/views/bottom_bar_view.dart';
import 'package:todolist/app/modules/Home/views/home_view.dart';
import 'package:todolist/app/modules/Register/views/register_view.dart';

import '../controllers/login_controller.dart';

class LoginView extends StatefulWidget {
  const LoginView({Key? key}) : super(key: key);

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  final LoginController controller = Get.put(LoginController());
  final _formkey = GlobalKey<FormState>();
  final RxBool sembunyikan = false.obs;

  void buttonSembunyikan() {
    sembunyikan.toggle();
  }

  @override
  Widget build(BuildContext context) {
    final f = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: Color(0xffF9EA85),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Form(
            key: _formkey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Center(
                  child: Container(
                    width: double.infinity,
                    height: f * 0.35,
                    child: Image(
                      image: AssetImage('images/login.png'),
                    ),
                  ),
                ),
                SizedBox(
                  height: f * 0.01,
                ),
                Container(
                  height: f * 0.06,
                  child: FittedBox(
                    child: Text(
                      'To-Do Connect',
                      style: TextStyle(
                          fontFamily: 'Poppins',
                          fontWeight: FontWeight.w700,
                          fontSize: 50),
                    ),
                  ),
                ),
                SizedBox(
                  height: f * 0.03,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 30),
                  child: Container(
                    height: f * 0.4,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        TextFormField(
                          keyboardType: TextInputType.emailAddress,
                          // controller: _loginController.username,
                          validator: (value) {
                            if (value!.isEmpty) {
                              return "Email Tidak Boleh Kosong";
                            }
                            return null;
                          },
                          decoration: InputDecoration(
                              contentPadding: EdgeInsets.symmetric(
                                  vertical: 5, horizontal: 20),
                              label: Text('Masukkan Username/Email'),
                              border: OutlineInputBorder(),
                              suffixIcon: Icon(Icons.person)),
                        ),
                        SizedBox(
                          height: f * 0.01,
                        ),
                        Obx(
                          () => TextFormField(
                            // controller: _loginController.password,
                            obscureText: !sembunyikan.value,
                            validator: (value) {
                              if (value!.isEmpty) {
                                return "Password Tidak Boleh Kosong";
                              }
                              return null;
                            },
                            decoration: InputDecoration(
                                contentPadding: EdgeInsets.symmetric(
                                    vertical: 5, horizontal: 20),
                                label: Text('Masukkan Password'),
                                border: OutlineInputBorder(),
                                suffixIcon: IconButton(
                                    onPressed: buttonSembunyikan,
                                    icon: sembunyikan.value
                                        ? Icon(Icons.visibility)
                                        : Icon(Icons.visibility_off))),
                          ),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Text(
                              'Belum Punya Akun?',
                              style: TextStyle(
                                  fontFamily: 'Poppins', fontSize: 12),
                            ),
                            TextButton(
                                onPressed: () {
                                  Get.to(RegisterView());
                                },
                                child: Text(
                                  'Registrasi',
                                  style: TextStyle(
                                      fontFamily: 'Poppins',
                                      fontSize: 16,
                                      fontWeight: FontWeight.w700),
                                ))
                          ],
                        )
                      ],
                    ),
                  ),
                ),
                Center(
                  child: FilledButton(
                    onPressed: () {
                      if (_formkey.currentState!.validate()) {
                        _formkey.currentState!.save();
                        Get.to(BottomBarView());
                        // return _loginController.login(
                        //     _loginController.username.text,
                        //     _loginController.password.text);
                      }
                    },
                    style: ButtonStyle(
                      backgroundColor:
                          MaterialStatePropertyAll(Colors.lightGreen),
                      padding: MaterialStatePropertyAll(
                        EdgeInsets.symmetric(vertical: 15, horizontal: 80),
                      ),
                    ),
                    child: Text(
                      'Login',
                      style: TextStyle(
                          fontFamily: 'Poppins', fontWeight: FontWeight.w700),
                    ),
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
