import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../pages/splash/view.dart';
import '../routes/routes.dart';
import '../theme/theme.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(

      getPages: getPages,
      initialRoute: Routes.splashpage,
      debugShowCheckedModeBanner: false,
      home: SplashPage(),
      theme: ThemeData(fontFamily: 'Vazir'),

    );
  }
}

