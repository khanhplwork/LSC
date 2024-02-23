

import 'package:equatable/equatable.dart';
import 'package:lsc/core/api/api.dart';
import 'package:lsc/core/app_export.dart';
import 'package:lsc/core/model/pending_order_model/pending_order.dart';
import 'package:flutter/material.dart';
import 'package:lsc/widgets/dialog/fail_dialog.dart';
import 'package:lsc/widgets/dialog/loading_dialog.dart';
import 'package:lsc/widgets/dialog/success_dialog.dart';
part 'inprogress_event.dart';

part 'inprogress_state.dart';

class InprogressBloc extends Bloc<InprogressEvent, InprogressState> {
  InprogressBloc(InprogressState initialState) : super(initialState) {
    on<InprogressInitialEvent>(_onInprogressInitialEvent);
    on<InprogressStopLiveLocationEvent>(_onInprogressStopLiveLocationEvent);
    on<InprogressChooseOrderEvent>(_onInprogressChooseOrderEvent);
    on<InprogressBackToListEvent>(_onInprogressBackToListEvent);
    on<OnClickCompletedOrderEvent>(_onClickCompletedOrderEvent);
  }

  _onClickCompletedOrderEvent(
      OnClickCompletedOrderEvent event, Emitter<InprogressState> emit) async {

    Navigator.pop(NavigatorService.navigatorKey.currentContext!);
    showLoadingDialog();
    bool result = await completedOrder(selectedOrder!.orderId.toString());
    Navigator.pop(NavigatorService.navigatorKey.currentContext!);
    if(result){
      showSuccessDialog("Order Complete Successfully");
      emit(state.copyWith(isShowCompletedButton: false));
    }else{
      showFailDialog("Order Complete Fail");
    }
  }

  _onInprogressBackToListEvent(
      InprogressBackToListEvent event, Emitter<InprogressState> emit) async {}

  _onInprogressChooseOrderEvent(
      InprogressChooseOrderEvent event, Emitter<InprogressState> emit) async {}

  _onInprogressStopLiveLocationEvent(InprogressStopLiveLocationEvent event,
      Emitter<InprogressState> emit) async {}

  _onInprogressInitialEvent(
      InprogressInitialEvent event, Emitter<InprogressState> emit) async {
    if (selectedOrder!.statusCourier == 14 ||
        selectedOrder!.statusCourier == 3) {
      emit(state.copyWith(isShowCompletedButton: true));
    }
  }
}
