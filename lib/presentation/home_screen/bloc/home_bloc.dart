import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:lsc/core/app_export.dart';
part 'home_event.dart';
part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  HomeBloc(HomeState initialState) : super(initialState) {
    on<HomeInitialEvent>(_onInitialize);
    on<LogoutEvent>(_onLogout);
  }
  _onLogout(
    LogoutEvent event,
    Emitter<HomeState> emit,
  ) async {
    var box = Hive.box('lscBox');
    box.clear();
    disposeConstant();
    NavigatorService.popAndPushNamed(
      AppRoutes.loginScreen,
    );
  }

  _onInitialize(
    HomeInitialEvent event,
    Emitter<HomeState> emit,
  ) async {}
}
