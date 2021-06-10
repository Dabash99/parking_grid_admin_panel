import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:parking_grid_admin/modules/GET/get_cubit/get_cubit.dart';
import 'package:parking_grid_admin/shared/components/components.dart';

class AllGarages extends StatelessWidget {
  var cityName = TextEditingController();
  var garageName = TextEditingController();
  var lat = TextEditingController();
  var lng = TextEditingController();
  var id = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => GetCubit()..getGarages(),
      child: BlocConsumer<GetCubit, GetState>(
        listener: (context, state) {
          // TODO: implement listener
        },
        builder: (context, state) {
          return Scaffold(
            appBar: customAppBar(title: 'All Garages Data'),
            body: Column(
              children: [
                Container(
                  width: double.maxFinite,
                  height: 100,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.white),
                  child: Column(
                    children: [
                      defaultFormField(
                          controller: cityName,
                          type: TextInputType.name,
                          validate: null,
                          label: 'City Name')
                    ],
                  ),
                )
              ],
            ),
          );
        },
      ),
    );
  }
}
