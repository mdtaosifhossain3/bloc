import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

part 'switch_event.dart';
part 'switch_state.dart';

class SwitchBloc extends Bloc<SwitchEvent, SwitchState> {
  SwitchBloc() : super(const SwitchState()) {
    on<EnableOrDesableNotification>((event, emit) {
      emit(state.copyWith(isSwitch: !state.isSwitch));
    });

    on<SliderEvent>((event, emit) {
      emit(state.copyWith(slider: event.slider));
    });
  }
}
