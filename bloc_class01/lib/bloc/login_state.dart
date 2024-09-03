import 'package:bloc_class01/models/login_res_model.dart';
import 'package:equatable/equatable.dart';

abstract class LoginState extends Equatable {}

//Jeta samne show kortese. initial state
class LoginInitialState extends LoginState {
  @override
  List<Object?> get props => [];
}

class LoadingState extends LoginState {
  @override
  List<Object?> get props => [];
}

class LoadedState extends LoginState {
  final LoginResModel loginResModel;
  LoadedState({required this.loginResModel});

  @override
  List<Object?> get props => [loginResModel];
}

class ErrorState extends LoginState {
  final String? errorMsg;
  ErrorState(this.errorMsg);
  @override
  List<Object?> get props => [errorMsg];
}
