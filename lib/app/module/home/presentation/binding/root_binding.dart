import 'package:booking/app/module/home/presentation/controller/root_controller.dart';
import 'package:get/get.dart';

/// RootBinding: Inject the controller in the first use
class RootBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<RootController>(
      RootController.new,
    );
  }
}
