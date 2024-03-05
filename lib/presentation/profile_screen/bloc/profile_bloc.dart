import 'dart:async';

import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:lsc/core/api/api.dart';
import 'package:lsc/core/app_export.dart';
import 'package:lsc/core/model/user_info_model/user_info.dart';
import 'package:lsc/widgets/dialog/fail_dialog.dart';
import 'package:lsc/widgets/dialog/loading_dialog.dart';
import 'package:lsc/widgets/dialog/success_dialog.dart';

part 'profile_event.dart';
part 'profile_state.dart';

class ProfileBloc extends Bloc<ProfileEvent, ProfileState> {
  ProfileBloc(ProfileState initialState) : super(initialState) {
    on<ProfileInitialEvent>(_onInitialize);
    on<UpdateGender>(_onUpdateGender);
    on<UpdateGroupStatus>(_onUpdateGroupStatus);
    on<UpdateGroupNewsletterSubscriber>(_onUpdateGroupNewsletterSubscriber);
    on<UploadAvatarEvent>(_onUploadAvatar);
    on<UpdateProfileEvent>(_onUpdateProfile);
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
        userInfo: userInfo,
      ));
    }
  }

  FutureOr<void> _onUploadAvatar(
      UploadAvatarEvent event, Emitter<ProfileState> emit) async {
    showLoadingDialog();
    XFile? image = await ImagePicker().pickImage(source: ImageSource.gallery);
    if (image != null) {
      var response = await uploadAvatar(image);
      Navigator.pop(event.context);
      if (response["status"] == true) {
        emit(state.copyWith(userAvatar: response["avatar"]));
        state.userInfo!.avatar = response["avatar"];
        add(ProfileInitialEvent());
      } else {
        showFailDialog(response["message"]);
      }
    } else {
      Navigator.pop(event.context);
    }
  }

  FutureOr<void> _onUpdateProfile(
      UpdateProfileEvent event, Emitter<ProfileState> emit) async {
    showLoadingDialog();
    state.userInfo!.fname = state.nameController!.text;
    state.userInfo!.lname = state.lastNameController!.text;
    state.userInfo!.email = state.emailController!.text;
    state.userInfo!.phone = state.phoneController!.text;
    state.userInfo!.gender = state.gender;
    state.userInfo!.enrollment = state.vehicleLicensePlateController!.text;
    state.userInfo!.vehiclecode = state.vehicleCodeController!.text;
    state.userInfo!.notes = state.noteController!.text;
    state.userInfo!.newsletter = state.isNewsletterSubscriber == true ? 1 : 0;
    var result = await updateDriverInfo(state.userInfo!);
    Navigator.of(event.context).pop();
    if (result == true) {
      showSuccessDialog("Updated");
    } else {
      showFailDialog("Failed to update profile");
    }
  }
}
