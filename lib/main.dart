import 'package:booking/app/module/home/data/home_api_repository.dart';
import 'package:booking/app2/module/home/bloc/home_bloc.dart';
import 'package:booking/app2/module/home/page/home_page.dart';
import 'package:booking/common/app_constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final repository = await HomeApiRepository().init();
  runApp(
    MyApp(homeApiRepository: repository),
  );
}

///
class MyApp extends StatelessWidget {
  ///
  const MyApp({
    required this.homeApiRepository,
    super.key,
  });
  ///
  final HomeApiRepository homeApiRepository;


  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: BlocProvider(
        create: (_) => HomeBloc(repository: homeApiRepository),
        child: const HomePage(),
      ),
      theme: getLightTheme(),
    );
  }
}

