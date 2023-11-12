import 'package:get/get.dart';

import '../modules/BottomBar/bindings/bottom_bar_binding.dart';
import '../modules/BottomBar/views/bottom_bar_view.dart';
import '../modules/Edit/bindings/edit_binding.dart';
import '../modules/Edit/views/edit_view.dart';
import '../modules/Home/bindings/home_binding.dart';
import '../modules/Home/views/home_view.dart';
import '../modules/Login/bindings/login_binding.dart';
import '../modules/Login/views/login_view.dart';
import '../modules/Profile/bindings/profile_binding.dart';
import '../modules/Profile/views/profile_view.dart';
import '../modules/QrCode/bindings/qr_code_binding.dart';
import '../modules/QrCode/views/qr_code_view.dart';
import '../modules/Register/bindings/register_binding.dart';
import '../modules/Register/views/register_view.dart';
import '../modules/Scanner/bindings/scanner_binding.dart';
import '../modules/Scanner/views/scanner_view.dart';
import '../modules/SplashScreen/bindings/splash_screen_binding.dart';
import '../modules/SplashScreen/views/splash_screen_view.dart';
import '../modules/Tambah/bindings/tambah_binding.dart';
import '../modules/Tambah/views/tambah_view.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static final routes = [
    GetPage(
      name: _Paths.SPLASH_SCREEN,
      page: () => const SplashScreenView(),
      binding: SplashScreenBinding(),
    ),
    GetPage(
      name: _Paths.LOGIN,
      page: () => const LoginView(),
      binding: LoginBinding(),
    ),
    GetPage(
      name: _Paths.REGISTER,
      page: () => const RegisterView(),
      binding: RegisterBinding(),
    ),
    GetPage(
      name: _Paths.HOME,
      page: () => const HomeView(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: _Paths.BOTTOM_BAR,
      page: () => const BottomBarView(),
      binding: BottomBarBinding(),
    ),
    GetPage(
      name: _Paths.PROFILE,
      page: () => const ProfileView(),
      binding: ProfileBinding(),
    ),
    GetPage(
      name: _Paths.TAMBAH,
      page: () => const TambahView(),
      binding: TambahBinding(),
    ),
    GetPage(
      name: _Paths.EDIT,
      page: () => const EditView(),
      binding: EditBinding(),
    ),
    GetPage(
      name: _Paths.SCANNER,
      page: () => const ScannerView(),
      binding: ScannerBinding(),
    ),
    GetPage(
      name: _Paths.QR_CODE,
      page: () => const QrCodeView(),
      binding: QrCodeBinding(),
    ),
  ];
}
