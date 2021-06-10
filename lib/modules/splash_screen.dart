import 'dart:async';

import 'package:flutter/material.dart';
import 'package:parking_grid_admin/modules/home_screen.dart';
import 'package:parking_grid_admin/shared/components/components.dart';
import 'package:parking_grid_admin/shared/styles/colors.dart';
import 'package:widget_circular_animator/widget_circular_animator.dart';

class SplashScreen extends StatefulWidget {

  @override
  _SplashScreenState createState() => _SplashScreenState();


}

class _SplashScreenState extends State<SplashScreen> {

  @override
  void initState() {
    super.initState();
    Timer(
        Duration(seconds: 5),
            ()=> navigateAndFinish(context, HomeScreen()));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: defaultColor,
        body: WidgetCircularAnimator(
          innerColor: Colors.white,
          outerColor: Colors.white,
          child: Center(
            child: Image(
                image: AssetImage(
                  'assets/images/oie_221049429DjEMstz.gif',
                ),height: 300,width: 300,
                fit: BoxFit.cover,),
          ),
        ));
  }
}
