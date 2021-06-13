import 'package:conditional_builder/conditional_builder.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:parking_grid_admin/modules/GET/get_cubit/get_cubit.dart';
import 'package:parking_grid_admin/modules/POST/create_park.dart';
import 'package:parking_grid_admin/shared/components/components.dart';
import 'package:parking_grid_admin/shared/styles/colors.dart';
import 'package:parking_grid_admin/util/Mode.dart';
import 'package:parking_grid_admin/util/choose_color.dart';

class ParksScreen extends StatelessWidget {
  dynamic garageName;
  dynamic cityname;
  ParksScreen({Key key, @required this.garageName,@required this.cityname});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => GetCubit()..getParks(GarageName: garageName),
      child: BlocConsumer<GetCubit, GetState>(
        listener: (context, state) {
        },
        builder: (context, state) {
          var parksCubit = GetCubit.get(context).getAllParks;
          return Scaffold(
              appBar: customAppBar(title: ' $garageName Parks'),
              body: ConditionalBuilder(
                  condition: state is SuccessAllParksDataState,
                  builder: (context) => Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      children: [
                        Row(
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(bottom: 10),
                              child: counterContainer(
                                  text: 'Parks Count',
                                  length: parksCubit.parkings.length),
                            ),
                            Spacer(),
                            ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                primary: Colors.white
                              ),
                                onPressed: () {
                                navigateTo(context, CreatePark(cityname: cityname,garageName: garageName,));
                                }, child: Text('Create New Park',style: TextStyle(color: defaultColor),))
                          ],
                        ),
                        Expanded(
                          child: ListView.separated(
                            physics: BouncingScrollPhysics(),
                            itemCount: parksCubit.parkings.length,
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
                                                      .parkings[index].status),
                                              width: 10))),
                                  child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Column(
                                      mainAxisAlignment: MainAxisAlignment.start,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          'Park Name : ${parksCubit.parkings[index].parkingName}',
                                          style: TextStyle(
                                              fontSize: 20,
                                              fontWeight: FontWeight.bold,
                                              fontFamily: 'Jannah'),
                                        ),
                                        Text(
                                            'Park Floor : ${parksCubit.parkings[index].parkingFloor}',
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
                                                        .parkings[index].Mode),
                                                style: TextStyle(
                                                    fontSize: 20,
                                                    fontWeight: FontWeight.bold,
                                                    fontFamily: 'Jannah'))
                                          ],
                                        ),
                                        ConditionalBuilder(
                                            condition: parksCubit.parkings[index]
                                                    .userData.phoneNumber !=
                                                null,
                                            builder: (context) => Column(
                                                  children: [
                                                    Row(
                                                      children: [
                                                        Expanded(
                                                            child: myDivider(
                                                                color:
                                                                    Colors.grey)),
                                                        Center(
                                                          child: Text(
                                                            'User Data',
                                                            style: TextStyle(
                                                                fontSize: 16,
                                                                color:
                                                                    defaultColor),
                                                          ),
                                                        ),
                                                        Expanded(
                                                            child: myDivider(
                                                                color:
                                                                    Colors.grey)),
                                                      ],
                                                    ),
                                                    Text(
                                                        'User Email : ${parksCubit.parkings[index].userData.email}'),
                                                    Text(
                                                        'User Phone Number : ${parksCubit.parkings[index].userData.phoneNumber}'),
                                                    Text('User Car Plate : ${parksCubit.parkings[index].userData.carLetter.join(' ')}' +
                                                        ' | ' +
                                                        '${parksCubit.parkings[index].userData.carNumber.join(' ')}'),
                                                  ],
                                                )),
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
                ),
              );
        },
      ),
    );
  }
}
