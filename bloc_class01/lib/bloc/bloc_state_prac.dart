import 'package:bloc_class01/models/login_res_model.dart';
import 'package:equatable/equatable.dart';

abstract class LoginStatePractice extends Equatable {}

class InitialState extends LoginStatePractice {
  @override
  List<Object?> get props => [];
}

class LoadingStae extends LoginStatePractice {
  @override
  List<Object?> get props => throw UnimplementedError();
}

class LoadedStateq extends LoginStatePractice {
  final LoginResModel loginResModel;
  LoadedStateq({required this.loginResModel});
  @override
  List<LoginResModel?> get props => [loginResModel];
}

class ErrorStateq extends LoginStatePractice {
  final String errorMsg;
  ErrorStateq(this.errorMsg);
  @override
  List<Object?> get props => [errorMsg];
}
