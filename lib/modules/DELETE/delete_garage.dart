import 'package:conditional_builder/conditional_builder.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:parking_grid_admin/modules/DELETE/delete_park.dart';
import 'package:parking_grid_admin/modules/GET/get_cubit/get_cubit.dart';
import 'package:parking_grid_admin/shared/components/components.dart';
import 'package:parking_grid_admin/shared/styles/colors.dart';

class DeleteGarage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => GetCubit()..getGarages(),
      child: BlocConsumer<GetCubit, GetState>(
        listener: (context, state) {
          // TODO: implement listener
        },
        builder: (context, state) {
          var garageCubit = GetCubit.get(context);
          return Scaffold(
              appBar: customAppBar(title: 'Delete garage '),
              body: ConditionalBuilder(
                condition: state is SuccessAllGaragesState || state is SuccessDeleteGarageState,
                builder: (context) => Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(bottom: 10),
                        child: counterContainer(
                            text: 'Garage Count',
                            length: garageCubit.getAllGarages.garages.length),
                      ),
                      Expanded(
                        child: ListView.separated(
                          physics: BouncingScrollPhysics(),
                          itemCount: garageCubit.getAllGarages.garages.length,
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
                                            color: Colors.indigo, width: 10))),
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        'Garage Name : ${garageCubit.getAllGarages.garages[index].garageName}',
                                        style: TextStyle(
                                            fontSize: 20,
                                            fontWeight: FontWeight.bold,
                                            fontFamily: 'Jannah'),
                                      ),
                                      Text(
                                          'City Name : ${garageCubit.getAllGarages.garages[index].cityName}',
                                          style: TextStyle(
                                              fontSize: 20,
                                              fontWeight: FontWeight.bold,
                                              fontFamily: 'Jannah')),
                                      Text(
                                          'Latitude : ${garageCubit.getAllGarages.garages[index].lat}',
                                          style: TextStyle(
                                              fontSize: 18,
                                              fontWeight: FontWeight.bold,
                                              fontFamily: 'Jannah')),
                                      Text(
                                          'Longitude : ${garageCubit.getAllGarages.garages[index].long}',
                                          style: TextStyle(
                                              fontSize: 20,
                                              fontWeight: FontWeight.bold,
                                              fontFamily: 'Jannah')),
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
                                            garageCubit.deleteGarage(
                                                GarageName: garageCubit
                                                    .getAllGarages
                                                    .garages[index]
                                                    .garageName,
                                                CityName: garageCubit
                                                    .getAllGarages
                                                    .garages[index]
                                                    .cityName);
                                          },
                                          child: Text(
                                              'Delete ${garageCubit.getAllGarages.garages[index].garageName} Garage'),
                                        ),
                                      ),
                                      Align(
                                        alignment: Alignment.bottomCenter,
                                        child: ElevatedButton(
                                          style: ElevatedButton.styleFrom(
                                            primary: defaultColor,
                                            shape: RoundedRectangleBorder(
                                                borderRadius:
                                                BorderRadius.circular(8)),
                                          ),
                                          onPressed: () {
                                            navigateTo(context, DeletePark(garageName: garageCubit.getAllGarages.garages[index].garageName));
                                          },
                                          child: Text(
                                              'View ${garageCubit.getAllGarages.garages[index].garageName} Park'),
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
