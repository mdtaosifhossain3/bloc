import 'package:bloc_class01/bloc/bloc_event_prac.dart';
import 'package:bloc_class01/bloc/bloc_state_prac.dart';
import 'package:bloc_class01/models/login_res_model.dart';
import 'package:bloc_class01/repo/login_repo.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginBlocPractice extends Bloc<LoginEventPractice, LoginStatePractice> {
  LoginBlocPractice() : super(InitialState()) {
    on<LoginRequestPracticeEvent>(
      (event, emit) async {
        emit(LoadingStae());

        try {
          LoginResModel loginResModel = await LoginRepo().login(
              event.loginReqModel.username ?? "",
              event.loginReqModel.password ?? "");

          emit(LoadedStateq(loginResModel: loginResModel));
        } catch (e) {
          emit(ErrorStateq(e.toString()));
        }
      },
    );
  }
}
