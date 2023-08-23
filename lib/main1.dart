import 'package:booking/app/module/home/data/home_api_repository.dart';
import 'package:booking/app/routes/app_pages.dart';
import 'package:booking/common/app_constants.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

Future<void> _initServices() async {
  Get.log('starting services ...');

  /// Modules repositories
  await Get.putAsync<HomeApiRepository>(() => HomeApiRepository().init());

  Get.log('All services started...');
}

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await _initServices();
  runApp(
    GetMaterialApp(
      title: 'Booking App',
      initialRoute: initialRout,
      getPages: routes,
      debugShowCheckedModeBanner: false,
      defaultTransition: Transition.cupertino,
      themeMode: ThemeMode.light,
      theme: getLightTheme(),
      darkTheme: getDarkTheme(),
      // theme: ThemeData(
      //   fontFamily: 'SFPro',
      //   primarySwatch: Colors.blue,
      //   brightness: Brightness.light,
      // ),
      // darkTheme: ThemeData(
      //   fontFamily: 'SFPro',
      //   primarySwatch: Colors.blue,
      //   brightness: Brightness.dark,
      // ),
    ),
  );
}
