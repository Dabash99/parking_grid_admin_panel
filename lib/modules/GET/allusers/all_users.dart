import 'package:conditional_builder/conditional_builder.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:parking_grid_admin/modules/GET/get_cubit/get_cubit.dart';
import 'package:parking_grid_admin/shared/components/components.dart';

class GetAllUsers extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => GetCubit()..getallUsers(),
      child: BlocConsumer<GetCubit, GetState>(
        listener: (context, state) {},
        builder: (context, state) {
          var usersCubit = GetCubit.get(context);
          return Scaffold(
              appBar: customAppBar(title: 'All Users'),
              body: ConditionalBuilder(
                condition: state is SuccessAllUsers,
                builder: (context) => Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(bottom: 10),
                        child: counterContainer(text: 'Users Count', length: usersCubit.allUsersdata.users.length),
                      ),
                      Expanded(
                        child: ListView.separated(
                          physics: BouncingScrollPhysics(),
                          itemCount: usersCubit.allUsersdata.users.length,
                          separatorBuilder: (context, index) {
                            return myDivider(color: Colors.white);
                          },
                          itemBuilder: (context, index) {
                            return Dismissible(
                              key: Key(usersCubit.allUsersdata.users[index].sId),
                                onDismissed:(direction){
                                  usersCubit.deleteUser(userID: usersCubit.allUsersdata.users[index].sId);
                                },
                              child: Padding(
                                padding: const EdgeInsets.symmetric(horizontal: 8),
                                child: Container(
                                  decoration: BoxDecoration(
                                      color: Colors.white,
                                      border: Border(left: BorderSide(color: Colors.amberAccent,width: 10))),
                                  child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Column(
                                      mainAxisAlignment: MainAxisAlignment.start,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          'Name : ${usersCubit.allUsersdata.users[index].firstName + ' ' + usersCubit.allUsersdata.users[index].lastName}',
                                          style: TextStyle(
                                              fontSize: 20,
                                              fontWeight: FontWeight.bold,
                                              fontFamily: 'Jannah'),
                                        ),
                                        Text(
                                            'Car Plate : ${usersCubit.allUsersdata.users[index].carNumber.join(' ') + ' | ' + usersCubit.allUsersdata.users[index].carLetter.join(' ')}',
                                            style: TextStyle(
                                                fontSize: 20,
                                                fontWeight: FontWeight.bold,
                                                fontFamily: 'Jannah')),
                                        Text(
                                            'Email Address : ${usersCubit.allUsersdata.users[index].email}',
                                            style: TextStyle(
                                                fontSize: 18,
                                                fontWeight: FontWeight.bold,
                                                fontFamily: 'Jannah')),
                                        Text(
                                            'Phone Number : ${usersCubit.allUsersdata.users[index].phoneNumber}',
                                            style: TextStyle(
                                                fontSize: 20,
                                                fontWeight: FontWeight.bold,
                                                fontFamily: 'Jannah'))
                                      ],
                                    ),
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
                      Text('Please Wait....',style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold),),
                    ],
                  ),
                ),
              ));
        },
      ),
    );
  }
}
