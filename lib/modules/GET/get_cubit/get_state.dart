part of 'get_cubit.dart';

@immutable
abstract class GetState {}

class GetInitial extends GetState {}


class LoadingAllUsers extends GetState{}

class SuccessAllUsers extends GetState{
  LoginModel loginModel;

  SuccessAllUsers (this.loginModel);
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