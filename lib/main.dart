import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:parking_grid_admin/modules/splash_screen.dart';
import 'package:parking_grid_admin/shared/bloc_observer.dart';
import 'package:parking_grid_admin/shared/network/remote/dio_helper.dart';
import 'package:parking_grid_admin/shared/styles/themes.dart';

void main() {
  Bloc.observer = MyBlocObserver();
  DioHelper.init();

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: lightTheme,
      debugShowCheckedModeBanner: false,
      home: SplashScreen(),
    );
  }
}
