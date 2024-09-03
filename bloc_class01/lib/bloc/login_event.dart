import 'package:bloc_class01/models/login_req_model.dart';
import 'package:equatable/equatable.dart';

abstract class LoginEvent extends Equatable {}

class LoginRequestEvent extends LoginEvent {
  final LoginReqModel loginReqModel;
  LoginRequestEvent({required this.loginReqModel});

  @override
  List<Object?> get props => [loginReqModel];
}
