part of 'get_cubit.dart';

@immutable
abstract class GetState {}

class GetInitial extends GetState {}


class LoadingAllUsers extends GetState{}

class SuccessAllUsers extends GetState{
  AllUsersdata allUsersdata;

  SuccessAllUsers (this.allUsersdata);
}

class ErrorAllUsers extends GetState{
  final String error;

  ErrorAllUsers(this.error);
}

class LoadingAllGaragesDataState extends GetState {}

class SuccessAllGaragesState extends GetState
{
  final GetAllGarages getAllGarages;

  SuccessAllGaragesState(this.getAllGarages);

}
class ErrorAllGaragesState extends GetState {}

class LoadingAllParksDataState extends GetState {}

class SuccessAllParksDataState extends GetState
{
  GetAllParks getAllParks;

  SuccessAllParksDataState(this.getAllParks);

}
class ErrorAllParksDataState extends GetState {}

class LoadingDeleteGarageState extends GetState{}

class SuccessDeleteGarageState extends GetState{}

class ErrorDeleteGarageState extends GetState{}

class LoadingDeleteParkState extends GetState{}

class SuccessDeleteParkState extends GetState{}

class ErrorDeleteParkState extends GetState{}

class LoadingDeleteUserState extends GetState{}

class SuccessDeleteUserState extends GetState{}

class ErrorDeleteUserState extends GetState{}

class LoadingCreateGarageState extends GetState{}

class SuccessCreateGarageState extends GetState{}

class ErrorCreateGarageState extends GetState{}

class LoadingCreateParkState extends GetState{}

class SuccessCreateParkState extends GetState{}

class ErrorCreateParkState extends GetState{}

