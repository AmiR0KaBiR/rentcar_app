import 'package:get/get.dart';
import 'logic.dart';

class AllcarsBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<AllcarsLogic>(() => AllcarsLogic());
  }
}
