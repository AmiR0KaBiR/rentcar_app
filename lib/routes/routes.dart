


import 'package:get/get_navigation/src/routes/get_route.dart';
import 'package:lms_appf/core/binding.dart';
import 'package:lms_appf/pages/intro/binding.dart';
import 'package:lms_appf/pages/intro/intro_pages/intro_widget.dart';
import 'package:lms_appf/pages/profile/binding.dart';
import 'package:lms_appf/pages/profile/view.dart';
import 'package:lms_appf/pages/test/binding.dart';
import 'package:lms_appf/pages/test/test.dart';

import '../core/bottomnavbar.dart';
import '../pages/intro/view.dart';
import '../pages/splash/binding.dart';
import '../pages/splash/view.dart';

class Routes {
  static String splashpage = '/splashPage';
  static String startbtn = '/startbtn';
  static String intropage = '/introPage';
  static String profilepage = '/profilepage';
  static String Btmnavbar = '/Btmnavbar';


}

final getPages = [

  GetPage(
      name: Routes.splashpage,
      page: () => SplashPage(),
      binding: SplashBinding()),

  GetPage(
      name: Routes.startbtn,
      page: () => StartBtn(),
      binding: TestBinding()),
  GetPage(
      name: Routes.intropage,
      page: () => PageViewExample(),
      binding: IntroBinding()),
  GetPage(
      name: Routes.profilepage,
      page: () => ProfilePage(),
      binding: ProfileBinding()),
  GetPage(
      name: Routes.Btmnavbar,
      page: () => MainPage(),
      binding: BottomnavBinding()),
];

