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
