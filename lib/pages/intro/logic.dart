import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import '../../../routes/routes.dart';

class LoginLogic extends GetxController {
  RxInt localIndex = RxInt(0);

  final PageController pageController = PageController();



  void getIndex(int index) {
    localIndex.value = index;
  }

}
