


import 'package:get/get_navigation/src/routes/get_route.dart';
import 'package:lms_appf/pages/test/binding.dart';
import 'package:lms_appf/pages/test/test.dart';

import '../pages/splash/binding.dart';
import '../pages/splash/view.dart';

class Routes {
  static String splashpage = '/splashPage';
  static String testpage = '/testPage';
  static String intropage = '/introPage';


}

final getPages = [

  GetPage(
      name: Routes.splashpage,
      page: () => SplashPage(),
      binding: SplashBinding()),

  GetPage(
      name: Routes.testpage,
      page: () => TestPage(),
      binding: TestBinding()),

];

