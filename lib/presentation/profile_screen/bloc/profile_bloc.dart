import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lsc/core/api/api.dart';
import 'package:lsc/core/model/user_info_model/user_info.dart';
import 'package:lsc/core/utils/navigator_service.dart';
import 'package:lsc/widgets/dialog/loading_dialog.dart';

part 'profile_event.dart';
part 'profile_state.dart';

class ProfileBloc extends Bloc<ProfileEvent, ProfileState> {
  ProfileBloc(ProfileState initialState) : super(initialState) {
    on<ProfileInitialEvent>(_onInitialize);
    on<UpdateGender>(_onUpdateGender);
    on<UpdateGroupStatus>(_onUpdateGroupStatus);
    on<UpdateGroupNewsletterSubscriber>(_onUpdateGroupNewsletterSubscriber);
  }
  _onUpdateGroupNewsletterSubscriber(
      UpdateGroupNewsletterSubscriber event, Emitter<ProfileState> emit) {
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
  ) async {
    showLoadingDialog();
    UserInfo? userInfo = await getUserInfo();
    Navigator.pop(NavigatorService.navigatorKey.currentContext!);
    if (userInfo != null) {
      emit(state.copyWith(
        emailController: TextEditingController(text: userInfo.email),
        phoneController: TextEditingController(text: userInfo.phone),
        nameController: TextEditingController(text: userInfo.fname),
        lastNameController: TextEditingController(text: userInfo.lname),
        gender: userInfo.gender,
        isNewsletterSubscriber: userInfo.newsletter == 1 ? true : false,
        isActive: userInfo.active == 1 ? true : false,
        noteController: TextEditingController(text: userInfo.notes),
        userAvatar: userInfo.avatar,
        usernameController: TextEditingController(text: userInfo.username),
        vehicleCodeController:
            TextEditingController(text: userInfo.vehiclecode),
        vehicleLicensePlateController:
            TextEditingController(text: userInfo.enrollment),
      ));
    }
  }
}
