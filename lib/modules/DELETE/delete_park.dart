import 'package:conditional_builder/conditional_builder.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:parking_grid_admin/modules/GET/get_cubit/get_cubit.dart';
import 'package:parking_grid_admin/shared/components/components.dart';
import 'package:parking_grid_admin/shared/styles/colors.dart';
import 'package:parking_grid_admin/util/Mode.dart';
import 'package:parking_grid_admin/util/choose_color.dart';

class DeletePark extends StatelessWidget {
  dynamic garageName;

  DeletePark({Key key, @required this.garageName});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => GetCubit()..getParks(GarageName: garageName),
      child: BlocConsumer<GetCubit, GetState>(
        listener: (context, state) {
          // TODO: implement listener
        },
        builder: (context, state) {
          var parksCubit = GetCubit.get(context);
          return Scaffold(
              appBar: customAppBar(title: 'Delete $garageName Parks'),
              body: ConditionalBuilder(
                condition: state is SuccessAllParksDataState,
                builder: (context) => Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(bottom: 10),
                        child: counterContainer(
                            text: 'Parks Count',
                            length: parksCubit.getAllParks.parkings.length),
                      ),

                      Expanded(
                        child: ListView.separated(
                          physics: BouncingScrollPhysics(),
                          itemCount: parksCubit.getAllParks.parkings.length,
                          separatorBuilder: (context, index) {
                            return myDivider(color: Colors.white);
                          },
                          itemBuilder: (context, index) {
                            return Padding(
                              padding:
                              const EdgeInsets.symmetric(horizontal: 8),
                              child: Container(
                                decoration: BoxDecoration(
                                    color: Colors.white,
                                    border: Border(
                                        left: BorderSide(
                                            color: ChooseColor(
                                                status: parksCubit
                                                    .getAllParks.parkings[index].status),
                                            width: 10))),
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment:
                                    CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        'Park Name : ${parksCubit.getAllParks.parkings[index].parkingName}',
                                        style: TextStyle(
                                            fontSize: 20,
                                            fontWeight: FontWeight.bold,
                                            fontFamily: 'Jannah'),
                                      ),
                                      Text(
                                          'Park Floor : ${parksCubit.getAllParks.parkings[index].parkingFloor}',
                                          style: TextStyle(
                                              fontSize: 20,
                                              fontWeight: FontWeight.bold,
                                              fontFamily: 'Jannah')),
                                      Row(
                                        children: [
                                          Text('Park Type : ',
                                              style: TextStyle(
                                                  fontSize: 20,
                                                  fontWeight: FontWeight.bold,
                                                  fontFamily: 'Jannah')),
                                          Text(
                                              Mode(
                                                  mode: parksCubit
                                                      .getAllParks.parkings[index].Mode),
                                              style: TextStyle(
                                                  fontSize: 20,
                                                  fontWeight: FontWeight.bold,
                                                  fontFamily: 'Jannah'))
                                        ],
                                      ),
                                      ConditionalBuilder(
                                          condition: parksCubit.getAllParks.parkings[index]
                                              .userData.phoneNumber !=
                                              null,
                                          builder: (context) => Column(
                                            children: [
                                              Row(
                                                children: [
                                                  Expanded(
                                                      child: myDivider(color: Colors.grey)),
                                                  Center(
                                                    child: Text(
                                                      'User Data',
                                                      style: TextStyle(
                                                          fontSize: 16,
                                                          color: defaultColor),
                                                    ),
                                                  ),
                                                  Expanded(
                                                      child: myDivider(color: Colors.grey)),
                                                ],
                                              ),
                                              Text(
                                                  'User Email : ${parksCubit.getAllParks.parkings[index].userData.email}'),
                                              Text(
                                                  'User Phone Number : ${parksCubit.getAllParks.parkings[index].userData.phoneNumber}'),
                                              Text('User Car Plate : ${parksCubit.getAllParks.parkings[index].userData.carLetter.join(' ')}' +
                                                  ' | ' +
                                                  '${parksCubit.getAllParks.parkings[index].userData.carNumber.join(' ')}'),
                                            ],
                                          )),
                                      Align(
                                        alignment: Alignment.bottomCenter,
                                        child: ElevatedButton(
                                          style: ElevatedButton.styleFrom(
                                            primary: Colors.red,
                                            shape: RoundedRectangleBorder(
                                                borderRadius:
                                                BorderRadius.circular(8)),
                                          ),
                                          onPressed: () {
                                            parksCubit.deletePark(garageName: parksCubit.getAllParks.garageName, parkingID: parksCubit.getAllParks.parkings[index].sId, cityName:parksCubit.getAllParks.cityName);
                                          },
                                          child: Text(
                                              'Delete ${parksCubit.getAllParks.parkings[index].parkingName} Garage'),
                                        ),
                                      ),

                                    ],
                                  ),
                                ),
                              ),
                            );
                          },
                        ),
                      ),
                    ],
                  ),
                ),
                fallback: (context) => Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20),
                        child: LinearProgressIndicator(),
                      ),
                      Text(
                        'Please Wait....',
                        style: TextStyle(
                            color: Colors.white, fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                ),
              ));
        },
      ),
    );
  }
}
