import 'dart:async';
import 'dart:convert';
import 'dart:developer';

import 'package:equatable/equatable.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:geolocator/geolocator.dart';
import 'package:lsc/core/app_export.dart';
import 'package:lsc/core/model/pending_order_model/pending_order.dart';
import 'package:lsc/core/model/trip_model/location.dart';
import 'package:lsc/core/model/trip_model/trip.dart';

part 'inprogress_event.dart';

part 'inprogress_state.dart';

class InprogressBloc extends Bloc<InprogressEvent, InprogressState> {
  InprogressBloc(InprogressState initialState) : super(initialState) {
    on<InprogressInitialEvent>(_onInprogressInitialEvent);
    on<InprogressStopLiveLocationEvent>(_onInprogressStopLiveLocationEvent);
    on<InprogressChooseOrderEvent>(_onInprogressChooseOrderEvent);
    on<InprogressBackToListEvent>(_onInprogressBackToListEvent);
  }

  _onInprogressBackToListEvent(
      InprogressBackToListEvent event, Emitter<InprogressState> emit) async {
    emit(state.copyWith(isShowDetail: false, selectedOrder: null));
  }

  _onInprogressChooseOrderEvent(
      InprogressChooseOrderEvent event, Emitter<InprogressState> emit) async {
    emit(state.copyWith(selectedOrder: event.selectedOrder, isShowDetail: true));
  }

  _onInprogressStopLiveLocationEvent(InprogressStopLiveLocationEvent event,
      Emitter<InprogressState> emit) async {

  }

  _onInprogressInitialEvent(
      InprogressInitialEvent event, Emitter<InprogressState> emit) async {}
}
