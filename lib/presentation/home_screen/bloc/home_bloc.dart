import 'dart:async';
import 'dart:developer';

import 'package:equatable/equatable.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:hive/hive.dart';
import 'package:lsc/core/api/api.dart';
import 'package:lsc/core/app_export.dart';
import 'package:lsc/core/model/pending_order_model/pending_order.dart';
import 'package:lsc/core/model/shipment_model/shipment.dart';
import 'package:lsc/core/model/trip_model/location.dart';
import 'package:lsc/widgets/dialog/loading_dialog.dart';

import '../../../core/model/trip_model/trip.dart';

part 'home_event.dart';

part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  HomeBloc(HomeState initialState) : super(initialState) {
    on<HomeInitialEvent>(_onInitialize);
    on<LogoutEvent>(_onLogout);
    on<TestEvent>(_onTest);
  }
  _onTest(
    TestEvent event,
    Emitter<HomeState> emit,
  ) async {
    print(
        'Test state in test event: ${state.recentShipment?.data.length ?? "null"}');
  }

  _onLogout(
    LogoutEvent event,
    Emitter<HomeState> emit,
  ) async {
    var box = Hive.box('lscBox');
    if (pendingOrdersTimer != null) pendingOrdersTimer?.cancel();
    box.clear();
    disposeConstant();
    NavigatorService.popAndPushNamed(
      AppRoutes.loginScreen,
    );
  }

  _checkLiveLocation() async {
    final databaseReference = FirebaseDatabase.instance.ref();

    LocationPermission permission;
    permission = await Geolocator.requestPermission();
    Position position = await Geolocator.getCurrentPosition(
      desiredAccuracy: LocationAccuracy.bestForNavigation,
    );

    print("current location: ${position.latitude}, ${position.longitude}");

    curLiveLocations.add(
        Location(latitude: position.latitude, longitude: position.longitude));

    //load list location from firebase db
    for (int i = 0; i < pendingOrders!.length; i++) {
      await databaseReference
          .child(pendingOrders![i].orderId.toString())
          .once()
          .then((DatabaseEvent event) {
        //if data is null - create new
        //if data is not null -  update

        if (event.snapshot.value != null) {
          Map<dynamic, dynamic> result =
              (event.snapshot.value as Map<Object?, Object?>);

          DriverTrip trip = DriverTrip.fromMap(result);
          //if current list loction has 1 item - create new list location
          //if current list loction has more than 1 item - update list location
          if (curLiveLocations.length > 1) {
            trip.updateListLocation(curLiveLocations);
          } else {
            trip.addNewListLocation(curLiveLocations);
          }
          databaseReference.child(pendingOrders![i].orderId.toString()).set({
            'start_at': trip.startAt,
            'location': trip.location
                .map((e) => e.map((e) => e.toJson()).toList())
                .toList()
          });
        } else {
          databaseReference.child(pendingOrders![i].orderId.toString()).set({
            'start_at': '${DateTime.now()}',
            'location': [
              [
                {
                  "latitude": position.latitude,
                  "longitude": position.longitude
                },
              ],
            ],
          });
        }
      });
    }
  }

  _onInitialize(
    HomeInitialEvent event,
    Emitter<HomeState> emit,
  ) async {
    showLoadingDialog();
    pendingOrders = await getPendingOrders();
    if (pendingOrders != null) {

      pendingOrdersTimer = Timer.periodic(Duration(seconds: 5), (timer) {
        _checkLiveLocation();
      });
    }
    Shipment? recentShipmentRes = await getRecentShipment();
    print('Test output: ${recentShipmentRes?.data.length}');
    Navigator.pop(NavigatorService.navigatorKey.currentContext!);
    emit(
      state.copyWith(
        pendingOrders: pendingOrders,
        recentShipment: recentShipmentRes,
      ),
    );
  }
}
