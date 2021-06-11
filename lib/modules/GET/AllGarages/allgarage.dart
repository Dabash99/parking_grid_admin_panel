import 'package:conditional_builder/conditional_builder.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:parking_grid_admin/modules/GET/allparks/garage_parks.dart';
import 'package:parking_grid_admin/modules/GET/get_cubit/get_cubit.dart';
import 'package:parking_grid_admin/shared/components/components.dart';
import 'package:parking_grid_admin/shared/styles/colors.dart';

class AllGarages extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => GetCubit()..getGarages(),
      child: BlocConsumer<GetCubit, GetState>(
        listener: (context, state) {
          // TODO: implement listener
        },
        builder: (context, state) {
          var garageCubit = GetCubit.get(context).getAllGarages;
          return Scaffold(
              appBar: customAppBar(title: 'All Garages '),
              body: ConditionalBuilder(
                condition: state is SuccessAllGaragesState,
                builder: (context) => Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(bottom: 10),
                        child: counterContainer(
                            text: 'Garage Count',
                            length: garageCubit.garages.length),
                      ),
                      Expanded(
                        child: ListView.separated(
                          physics: BouncingScrollPhysics(),
                          itemCount: garageCubit.garages.length,
                          separatorBuilder: (context, index) {
                            return myDivider();
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
                                        'Garage Name : ${garageCubit.garages[index].garageName}',
                                        style: TextStyle(
                                            fontSize: 20,
                                            fontWeight: FontWeight.bold,
                                            fontFamily: 'Jannah'),
                                      ),
                                      Text(
                                          'City Name : ${garageCubit.garages[index].cityName}',
                                          style: TextStyle(
                                              fontSize: 20,
                                              fontWeight: FontWeight.bold,
                                              fontFamily: 'Jannah')),
                                      Text(
                                          'Latitude : ${garageCubit.garages[index].lat}',
                                          style: TextStyle(
                                              fontSize: 18,
                                              fontWeight: FontWeight.bold,
                                              fontFamily: 'Jannah')),
                                      Text(
                                          'Longitude : ${garageCubit.garages[index].long}',
                                          style: TextStyle(
                                              fontSize: 20,
                                              fontWeight: FontWeight.bold,
                                              fontFamily: 'Jannah')),
                                      Align(
                                        alignment: Alignment.bottomCenter,
                                        child: ElevatedButton(
                                          style: ButtonStyle(
                                              shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                                                  RoundedRectangleBorder(
                                                      borderRadius: BorderRadius.circular(12),
                                                  )
                                              )
                                          ),
                                          onPressed: () {  
                                            navigateTo(context, ParksScreen(garageName: garageCubit.garages[index].garageName));
                                          },
                                        child: Text('View ${garageCubit.garages[index].garageName} Parks'),

                                        ),
                                      )
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
