import 'package:bloc_class01/models/login_req_model.dart';
import 'package:equatable/equatable.dart';

abstract class LoginEventPractice extends Equatable {}

class LoginRequestPracticeEvent extends LoginEventPractice {
  final LoginReqModel loginReqModel;

  LoginRequestPracticeEvent({required this.loginReqModel});
  @override
  List<LoginReqModel?> get props => [loginReqModel];
}
