import 'package:divine_mercy_app_the_right_way/controllers/login_controller.dart';
import 'package:get/get.dart';

class InitalBinding extends Bindings {
  @override
  void dependencies() {
    ///here i initalize all that needs to be initialized
    ///
    Get.lazyPut(() => LoginCtl());
  }
}
