import 'package:booking/app/module/home/presentation/binding/root_binding.dart';
import 'package:booking/app/module/home/presentation/view/root_view.dart';
import 'package:booking/app/routes/app_routes.dart';
import 'package:get/get.dart' show GetPage;

/// initialRout: First app route
const initialRout = Routes.root;

/// routes: App Pages Routes
final routes = <GetPage<dynamic>>[
  GetPage(
    name: Routes.root,
    page: () => const RootView(),
    binding: RootBinding(),
  ),
];
