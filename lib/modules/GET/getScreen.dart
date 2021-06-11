import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:parking_grid_admin/modules/GET/AllGarages/allgarage.dart';
import 'package:parking_grid_admin/modules/GET/allusers/all_users.dart';
import 'package:parking_grid_admin/modules/GET/get_cubit/get_cubit.dart';
import 'package:parking_grid_admin/shared/components/components.dart';


class GetScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => GetCubit(),
      child: Scaffold(
        appBar: customAppBar(title: 'GET Panel'),
        body: Column(
          children: [
            cutomContianer(context,
              colorside: Colors.green,
              imagePath: 'assets/images/profile.png', text: 'get all users',
              widget: GetAllUsers(),
            ),
            cutomContianer(context,
                colorside: Colors.green,
                imagePath: 'assets/images/logo_splash.png',
                text: 'get all garages',
                widget: AllGarages()
            ),
          ],
        ),
      ),
    );
  }
}
