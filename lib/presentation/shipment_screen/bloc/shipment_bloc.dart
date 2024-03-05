import 'dart:async';

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
    on<UpdateStatusToDeliveringEvent>(_onUpdateStatusToDelivering);
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

  FutureOr<void> _onUpdateStatusToDelivering(
      UpdateStatusToDeliveringEvent event, Emitter<ShipmentState> emit) async {
    showLoadingDialog();
    var value = await updateOrderStatusToDelivering(event.shipmentId);
    Navigator.pop(NavigatorService.navigatorKey.currentContext!);
    if (value) {
      var shipmentData = state.shipment?.data
          .where((element) => element.orderId == event.shipmentId)
          .firstOrNull;
      if (shipmentData != null) {
        shipmentData.statusCourier = 3;
        emit(state.copyWith(shipment: state.shipment));
      }
    } else {
      emit(state.copyWith(shipment: state.shipment));
    }
  }
}
