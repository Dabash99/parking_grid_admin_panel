import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';
import 'package:parking_grid_admin/models/all_user_model.dart';
import 'package:parking_grid_admin/models/locations.dart';
import 'package:parking_grid_admin/models/parks_model.dart';
import 'package:parking_grid_admin/models/response_message.dart';
import 'package:parking_grid_admin/shared/components/components.dart';
import 'package:parking_grid_admin/shared/network/end_points.dart';
import 'package:parking_grid_admin/shared/network/remote/dio_helper.dart';

part 'get_state.dart';

class GetCubit extends Cubit<GetState> {
  GetCubit() : super(GetInitial());

  static GetCubit get(context) => BlocProvider.of(context);

  AllUsersdata allUsersdata;

  void getallUsers() {
    emit(LoadingAllUsers());
    DioHelper.getData(url: GETALLUSERS).then((value) {
      allUsersdata = AllUsersdata.fromJson(value.data);
      print('Value from Response : ${value.data}');
      print('Value Saved : ${allUsersdata.users[0].firstName}');
      emit(SuccessAllUsers(allUsersdata));
    }).catchError((onError) {
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

  void getParks({@required String GarageName}) {
    emit(LoadingAllParksDataState());
    DioHelper.getData(url: GETPARKS, query: {
      'garagename': GarageName,
    }).then((value) {
      getAllParks = GetAllParks.fromJson(value.data);
      print('Parks : ${getAllParks.parkings[0].parkingName}');
      emit(SuccessAllParksDataState(getAllParks));
    }).catchError((onError) {
      print('Error : $onError');
      emit(ErrorAllParksDataState());
    });
  }

  MessageS messageS;

  void deleteGarage({@required String GarageName, @required String CityName}) {
    emit(LoadingDeleteGarageState());
    DioHelper.deleteData(
        url: DELETEGARAGE,
        query: {'cityname': CityName, 'garagename': GarageName}).then((value) {
      messageS = MessageS.fromJson(value.data);
      print(messageS);
      showToastt(msg: messageS.message, state: ToastStates.SUCCESS);
      getGarages();
      emit(SuccessDeleteGarageState());
    }).catchError((onError) {
      print(onError);
      emit(ErrorDeleteGarageState());
    });
  }

  void deletePark(
      {@required String cityName,
      @required String garageName,
      @required String parkingID}) {
    emit(LoadingDeleteParkState());
    DioHelper.deleteData(url: DELETEPARK, query: {
      'cityname': cityName,
      'garagename': garageName,
      'parkingId': parkingID
    }).then((value) {
      messageS = MessageS.fromJson(value.data);
      print(messageS);
      showToastt(msg: messageS.message, state: ToastStates.SUCCESS);
      getParks(GarageName: garageName);
      emit(SuccessDeleteParkState());
    }).catchError((onError) {
      print(onError);
      emit(ErrorDeleteParkState());
    });
  }

  void deleteUser({@required String userID}) {
    emit(LoadingDeleteUserState());
    DioHelper.deleteData(url: DELETUSER, query: {'user_id': userID})
        .then((value) {
      messageS = MessageS.fromJson(value.data);
      print('USer Delete Message : ${messageS.message1}');
      showToastt(msg: messageS.message1, state: ToastStates.SUCCESS);
      getallUsers();
      emit(SuccessDeleteUserState());
    }).catchError((onError) {
      print('Error === $onError');
      emit(ErrorDeleteUserState());
    });
  }

  void createGarage(
      {@required String CityName,
      @required String GarageName,
      @required double Lat,
      @required double LONG}) {
    emit(LoadingCreateGarageState());
    DioHelper.postData(url: CREATEGARAGE, data: {
      'cityName': CityName,
      'garageName': GarageName,
      'lat': Lat,
      'long': LONG
    }).then((value) {
      messageS = MessageS.fromJson(value.data);
      print('USer Delete Message : ${messageS.message1}');
      showToastt(msg: messageS.message1, state: ToastStates.SUCCESS);
      emit(SuccessCreateGarageState());
    }).catchError((onError) {
      print('EEE === ${onError.toString()}');
      emit(ErrorCreateGarageState());
    });
  }

  void createPark(
      {@required String parkingFLoor,
      @required String ParkingName,
      @required String mode,
      @required String GarageName,
      @required String CityName}) {
    emit(LoadingCreateParkState());
    DioHelper.postData(url: CREATEPARK, data: {
      'parking_Floor': parkingFLoor,
      'parking_Name': ParkingName,
      'mode': mode,
      'status': 'green',
      'userData': {
        "email": null,
        "phoneNumber": null,
        "carNumber": null,
        "carLetter": null
      }
    }, query: {
      'garagename': GarageName,
      'cityName': CityName
    }).then((value) {
      messageS = MessageS.fromJson(value.data);
      print('USer Delete Message : ${messageS.message1}');
      showToastt(msg: messageS.message1, state: ToastStates.SUCCESS);
      emit(SuccessCreateParkState());
    }).catchError((onError) {
      print(onError);
      emit(ErrorCreateParkState());
    });
  }
}
