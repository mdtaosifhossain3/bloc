//actual logic
//inital data asbe ekhane

import 'package:bloc/bloc.dart';
import 'package:bloc_class01/bloc/login_event.dart';
import 'package:bloc_class01/bloc/login_state.dart';
import 'package:bloc_class01/models/login_res_model.dart';
import 'package:bloc_class01/repo/login_repo.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  LoginBloc() : super(LoginInitialState()) {
    //Button e press korle eti call hbe age
    on<LoginRequestEvent>((event, emit) async {
      emit(LoadingState());

      try {
        LoginResModel loginResModel = await LoginRepo().login(
            event.loginReqModel.username ?? "",
            event.loginReqModel.password ?? "");

        emit(LoadedState(loginResModel: loginResModel));
      } catch (e) {
        emit(ErrorState(e.toString()));
      }
    });
  }
}
