import 'package:conditional_builder/conditional_builder.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:parking_grid_admin/modules/GET/get_cubit/get_cubit.dart';
import 'package:parking_grid_admin/shared/components/components.dart';

class PostScreen extends StatelessWidget {
  var garageNameController = TextEditingController();
  var cityNameController = TextEditingController();
  var latitudeController = TextEditingController();
  var longitudeNameController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => GetCubit(),
      child: BlocConsumer<GetCubit, GetState>(
        listener: (context, state) {
          // TODO: implement listener
        },
        builder: (context, state) {
          var garageCubit = GetCubit.get(context);
          return Scaffold(
            appBar: customAppBar(title: 'Create Panel'),
            body: SingleChildScrollView(
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(10),
                    child: Container(
                      decoration: BoxDecoration(
                          color: Colors.white,
                          border: Border(
                              left: BorderSide(color: Colors.indigo, width: 10))),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Garage Name ',
                              style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                  fontFamily: 'Jannah'),
                            ),
                            defaultFormField(
                                controller: garageNameController,
                                type: TextInputType.text),
                            Text('City Name',
                                style: TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold,
                                    fontFamily: 'Jannah')),
                            defaultFormField(
                                controller: cityNameController,
                                type: TextInputType.text),
                            Text('Latitude',
                                style: TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold,
                                    fontFamily: 'Jannah')),
                            defaultFormField(
                                controller: latitudeController,
                                type: TextInputType.number),
                            Text('Longitude',
                                style: TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold,
                                    fontFamily: 'Jannah')),
                            defaultFormField(
                                controller: longitudeNameController,
                                type: TextInputType.number),
                            ConditionalBuilder(condition: state is! LoadingCreateGarageState,
                              builder:(context)=> Align(
                                alignment: Alignment.bottomCenter,
                                child: ElevatedButton(
                                  style: ButtonStyle(
                                      shape: MaterialStateProperty.all<
                                          RoundedRectangleBorder>(
                                          RoundedRectangleBorder(
                                            borderRadius: BorderRadius.circular(12),
                                          ))),
                                  onPressed: () {
                                    garageCubit.createGarage(
                                        CityName: cityNameController.text,
                                        GarageName: garageNameController.text,
                                        Lat: double.parse(latitudeController.text),
                                        LONG: double.parse(longitudeNameController.text)
                                    );
                                    cityNameController.clear();
                                    garageNameController.clear();
                                    latitudeController.clear();
                                    longitudeNameController.clear();
                                  },
                                  child: Text('Create Garage'),
                                ),
                              ),
                              fallback: (context)=> Center(
                                child: CircularProgressIndicator(),
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
