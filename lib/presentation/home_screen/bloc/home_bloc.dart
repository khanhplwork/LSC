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
import 'package:lsc/core/model/trip_model/location.dart';

import '../../../core/model/trip_model/trip.dart';

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
    Position position = await Geolocator.getCurrentPosition(desiredAccuracy: LocationAccuracy.high);
    print('Test position: ${position.latitude} - ${position.longitude}');
      curLiveLocations.add(Location(latitude: position.latitude, longtitude: position.longitude));

    for(int i = 0; i < pendingOrders!.length; i++){
      await databaseReference.child(pendingOrders![i].orderId.toString()).once().then((DatabaseEvent event) {
        if (event.snapshot.value != null) {
          DriverTrip trip = driverTripFromJson(event.snapshot.value!.toString());
          if (trip.location.every((item) => curLiveLocations.contains(item))) {
            // trip.updateLiveLocation(curLiveLocations);
          } else {
            // trip.addLocation(curLiveLocations);
          }
        } else {
          databaseReference.child(pendingOrders![i].orderId.toString()).set({
            'start_at': '${DateTime.now()}',
            'location': {
              'live_location': [
                {"latitude": 1.1, "longtitude": 2.2},
              ],
            },
          });
        }
      });
    }
  }

  _onInitialize(
    HomeInitialEvent event,
    Emitter<HomeState> emit,
  ) async {
    pendingOrders = await getPendingOrders();
    if (pendingOrders != null) {
      pendingOrdersTimer = Timer.periodic(Duration(seconds: 3), (timer) {
        // _checkLiveLocation();
      });
    }
    emit(
      state.copyWith(
        pendingOrders: pendingOrders,
      ),
    );
  }
}
