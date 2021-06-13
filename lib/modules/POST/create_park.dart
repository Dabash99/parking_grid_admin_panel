import 'package:conditional_builder/conditional_builder.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:parking_grid_admin/modules/GET/get_cubit/get_cubit.dart';
import 'package:parking_grid_admin/shared/components/components.dart';

class CreatePark extends StatelessWidget {
  dynamic garageName;
  dynamic cityname;
  CreatePark({Key key, @required this.garageName,@required this.cityname});

  var ParkFloorController = TextEditingController();
  var ParkNameController = TextEditingController();
  var modeController = TextEditingController();
  var formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => GetCubit()..getParks(GarageName: garageName),
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
                              left: BorderSide(
                                  color: Colors.indigo, width: 10))),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Form(
                          key: formKey ,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Parking Name ',
                                style: TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold,
                                    fontFamily: 'Jannah'),
                              ),
                              defaultFormField(
                                  controller: ParkNameController,
                                  type: TextInputType.text),
                              Text('Parking Floor',
                                  style: TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold,
                                      fontFamily: 'Jannah')),
                              defaultFormField(
                                  controller: ParkFloorController,
                                  type: TextInputType.text),
                              Text('Mode',
                                  style: TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold,
                                      fontFamily: 'Jannah')),
                              defaultFormField(
                                validate: (value){
                                  if(int.parse(value)>2){
                                    return 'Please enter valid number (0-1-2)';
                                  }
                                },
                                  controller: modeController,
                                  type: TextInputType.number),
                              ConditionalBuilder(
                                condition: state is! LoadingCreateParkState,
                                builder: (context) =>
                                    Align(
                                      alignment: Alignment.bottomCenter,
                                      child: ElevatedButton(
                                        style: ButtonStyle(
                                            shape: MaterialStateProperty.all<
                                                RoundedRectangleBorder>(
                                                RoundedRectangleBorder(
                                                  borderRadius: BorderRadius
                                                      .circular(12),
                                                ))),
                                        onPressed: () {
                                          if(formKey.currentState.validate()){
                                            garageCubit.createPark(
                                                parkingFLoor: ParkFloorController.text,
                                                ParkingName: ParkNameController.text,
                                                mode: modeController.text,
                                                GarageName: garageName,
                                                CityName: cityname);
                                            ParkNameController.clear();
                                            ParkFloorController.clear();
                                            modeController.clear();
                                          }
                                        },
                                        child: Text('Create Garage'),
                                      ),
                                    ),
                                fallback: (context) =>
                                    Center(
                                      child: CircularProgressIndicator(),
                                    ),
                              )
                            ],
                          ),
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
