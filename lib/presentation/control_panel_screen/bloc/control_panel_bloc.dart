import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lsc/core/api/api.dart';
import 'package:lsc/core/model/control_panel_model/control_panel.dart';
import 'package:lsc/core/utils/navigator_service.dart';
import 'package:lsc/widgets/dialog/loading_dialog.dart';

part 'control_panel_event.dart';
part 'control_panel_state.dart';

class ControlPanelBloc extends Bloc<ControlPanelEvent, ControlPanelState> {
  ControlPanelBloc(ControlPanelState initialState) : super(initialState) {
    on<ControlPanelInitialEvent>(_onInitialize);
  }

  _onInitialize(
    ControlPanelInitialEvent event,
    Emitter<ControlPanelState> emit,
  ) async {
    showLoadingDialog();
    ControlPanel? controlPanelData = await getControlPanelData();
    Navigator.pop(NavigatorService.navigatorKey.currentContext!);

    if (controlPanelData != null) {
      print(
          '${controlPanelData.totalShipmentProgress} - ${controlPanelData.totalPickupsProgress} - ${controlPanelData.consolidatedTotalProgress}');
      emit(state.copyWith(
        controlPanelData: controlPanelData,
      ));
    }
  }
}
