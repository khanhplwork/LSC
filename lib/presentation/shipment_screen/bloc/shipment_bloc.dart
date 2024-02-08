import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:lsc/core/app_export.dart';
import 'package:lsc/core/api/api.dart';
import 'package:lsc/core/model/shipment_model/shipment.dart';
import 'package:lsc/widgets/dialog/loading_dialog.dart';

part 'shipment_event.dart';

part 'shipment_state.dart';

class ShipmentBloc extends Bloc<ShipmentEvent, ShipmentState> {
  ShipmentBloc(ShipmentState initialState) : super(initialState) {
    on<InitShipmentEvent>(_onInitShipment);
    on<SearchShipmentEvent>(_onSearchShipment);
  }

  _onSearchShipment(
      SearchShipmentEvent event, Emitter<ShipmentState> emit) async {
    showLoadingDialog();
    Shipment? shipment = await searchShipmentByTrackingID(
        state.searchController?.text.trim() ?? '');
    Navigator.pop(NavigatorService.navigatorKey.currentContext!);
    if (shipment != null) {
      emit(state.copyWith(shipment: shipment));
    } else {
      emit(state.copyWith(shipment: null));
    }
  }

  _onInitShipment(InitShipmentEvent event, Emitter<ShipmentState> emit) async {
    showLoadingDialog();
    Shipment? shipment = await getAllShipment();
    Navigator.pop(NavigatorService.navigatorKey.currentContext!);
    if (shipment != null) {
      emit(state.copyWith(
          shipment: shipment, searchController: TextEditingController()));
    } else {
      emit(state.copyWith(
          shipment: null, searchController: TextEditingController()));
    }
  }
}
