import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';
import 'package:parking_grid_admin/models/all_user_model.dart';
import 'package:parking_grid_admin/models/locations.dart';
import 'package:parking_grid_admin/models/parks_model.dart';
import 'package:parking_grid_admin/shared/network/end_points.dart';
import 'package:parking_grid_admin/shared/network/remote/dio_helper.dart';

part 'get_state.dart';

class GetCubit extends Cubit<GetState> {
  GetCubit() : super(GetInitial());

  static GetCubit get(context) => BlocProvider.of(context);

  AllUsersdata allUsersdata;

  void getallUsers(){
    emit(LoadingAllUsers());
    DioHelper.getData(url: GETALLUSERS).then((value) {
      allUsersdata = AllUsersdata.fromJson(value.data);
      print('Value from Response : ${value.data}');
      print('Value Saved : ${allUsersdata.users[0].firstName}');
      emit(SuccessAllUsers(allUsersdata));
    }).catchError((onError){
      print('Error : $onError');
      emit(ErrorAllUsers(onError));
    });
  }

  GetAllGarages getAllGarages;

  void getGarages() {
    emit(LoadingAllGaragesDataState());
    DioHelper.getData(url: GETALLGARAGE).then((value) {
      getAllGarages = GetAllGarages.fromJson(value.data);
      print('Garages : ${value.data}');
      emit(SuccessAllGaragesState(getAllGarages));
    }).catchError((error) {
      print('Erorr = ${error.toString()}');
      emit(ErrorAllGaragesState());
    });
  }

  GetAllParks getAllParks;

  void getParks({@required String GarageName}){
    emit(LoadingAllParksDataState());
    DioHelper.getData(url: GETPARKS,query: {
      'garagename':GarageName,
    }).then((value) {
      getAllParks= GetAllParks.fromJson(value.data);
      print('Parks : ${getAllParks.parkings[0].parkingName}');
      emit(SuccessAllParksDataState(getAllParks));
    }).catchError((onError){
      print('Error : $onError');
      emit(ErrorAllParksDataState());
    });
  }

}
