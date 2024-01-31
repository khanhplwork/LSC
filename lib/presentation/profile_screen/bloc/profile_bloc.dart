import 'dart:async';

import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'profile_event.dart';
part 'profile_state.dart';

class ProfileBloc extends Bloc<ProfileEvent, ProfileState> {
  ProfileBloc(ProfileState initialState) : super(initialState) {
    on<ProfileInitialEvent>(_onInitialize);
    on<UpdateGender>(_onUpdateGender);
    on<UpdateGroupStatus>(_onUpdateGroupStatus);
    on<UpdateGroupNewsletterSubscriber>(_onUpdateGroupNewsletterSubscriber);
  }
  _onUpdateGroupNewsletterSubscriber(UpdateGroupNewsletterSubscriber event, Emitter<ProfileState> emit) {
    emit(state.copyWith(isNewsletterSubscriber: event.value));
  }

  _onUpdateGroupStatus(UpdateGroupStatus event, Emitter<ProfileState> emit) {
    emit(state.copyWith(isActive: event.value));
  }

  _onUpdateGender(
    UpdateGender event,
    Emitter<ProfileState> emit,
  ) async {
    emit(state.copyWith(gender: event.value));
  }

  _onInitialize(
    ProfileInitialEvent event,
    Emitter<ProfileState> emit,
  ) async {}
}
