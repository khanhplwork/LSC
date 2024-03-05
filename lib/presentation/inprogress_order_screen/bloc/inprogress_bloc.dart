import 'dart:async';
import 'dart:developer';

import 'package:equatable/equatable.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:image_picker/image_picker.dart';
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
    on<InprogressAddReceiptLocation>(_onInprogressAddReceiptLocation);
  }

  GoogleMapController? mapController;

  _onClickCompletedOrderEvent(
      OnClickCompletedOrderEvent event, Emitter<InprogressState> emit) async {
    showLoadingDialog();
    bool result =
        await completedOrder(selectedOrder!.orderId.toString(), event.images);
    Navigator.pop(NavigatorService.navigatorKey.currentContext!);
    if (result) {
      showSuccessDialog("Order Complete Successfully");
      emit(state.copyWith(isShowCompletedButton: false));
    } else {
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
    if (selectedOrder!.statusCourier == 15 ||
        selectedOrder!.statusCourier == 3) {
      emit(state.copyWith(isShowCompletedButton: true));
    }
  }

  FutureOr<void> _onInprogressAddReceiptLocation(
      InprogressAddReceiptLocation event, Emitter<InprogressState> emit) async {
    log("_onInprogressAddReceiptLocation");
    if (selectedOrder != null) {
      List<Location> locations =
          await locationFromAddress(selectedOrder!.addressOrder);

      if (locations.length > 0) {
        BitmapDescriptor bitmapDescriptor =
            await BitmapDescriptor.fromAssetImage(
          ImageConfiguration(size: Size(100, 100)),
          "assets/images/destination.png",
        );

        List<Marker> markers = [];
        markers.add(
          Marker(
            markerId: MarkerId("receiptLocation"),
            position: LatLng(
              locations.firstOrNull!.latitude,
              locations.firstOrNull!.longitude,
            ),
            icon: bitmapDescriptor,
          ),
        );

        Position currentLocation = await Geolocator.getCurrentPosition(
            desiredAccuracy: LocationAccuracy.high);

        var source = LatLng(
          currentLocation.latitude,
          currentLocation.longitude,
        );

        var destination = LatLng(
          locations.firstOrNull!.latitude,
          locations.firstOrNull!.longitude,
        );

        LatLngBounds bounds;

        if (source.latitude > destination.latitude &&
            source.longitude > destination.longitude) {
          bounds = LatLngBounds(southwest: destination, northeast: source);
        } else if (source.longitude > destination.longitude) {
          bounds = LatLngBounds(
              southwest: LatLng(source.latitude, destination.longitude),
              northeast: LatLng(destination.latitude, source.longitude));
        } else if (source.latitude > destination.latitude) {
          bounds = LatLngBounds(
              southwest: LatLng(destination.latitude, source.longitude),
              northeast: LatLng(source.latitude, destination.longitude));
        } else {
          bounds = LatLngBounds(southwest: source, northeast: destination);
        }

        CameraUpdate u2 = CameraUpdate.newLatLngBounds(bounds, 90);

        mapController!.animateCamera(
          u2,
        );

        await checkCameraLocation(u2);

        emit(
          state.copyWith(
            receiptLocation: locations.firstOrNull,
            markers: markers,
          ),
        );
      }
    }
  }

  Future<void> checkCameraLocation(CameraUpdate cameraUpdate) async {
    mapController!.animateCamera(cameraUpdate);
    LatLngBounds l1 = await mapController!.getVisibleRegion();
    LatLngBounds l2 = await mapController!.getVisibleRegion();

    if (l1.southwest.latitude == -90 || l2.southwest.latitude == -90) {
      return checkCameraLocation(cameraUpdate);
    }
  }
}
