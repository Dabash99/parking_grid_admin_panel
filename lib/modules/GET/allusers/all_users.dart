import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:parking_grid_admin/modules/GET/get_cubit/get_cubit.dart';

class GetAllUsers extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => GetCubit()..getallUsers(),
      child: BlocConsumer<GetCubit, GetState>(
        listener: (context, state){

        },
        builder:(context, state){
          return Scaffold();
        },
      ),
    );
  }
}
