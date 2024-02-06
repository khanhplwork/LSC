import 'dart:async';
import 'dart:convert';
import 'dart:developer';

import 'package:equatable/equatable.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:geolocator/geolocator.dart';
import 'package:lsc/core/app_export.dart';
import 'package:lsc/core/model/trip_model/location.dart';
import 'package:lsc/core/model/trip_model/trip.dart';

part 'inprogress_event.dart';

part 'inprogress_state.dart';

class InprogressBloc extends Bloc<InprogressEvent, InprogressState> {
  InprogressBloc(InprogressState initialState) : super(initialState) {
    on<InprogressInitialEvent>(_onInprogressInitialEvent);
    on<InprogressStopLiveLocationEvent>(_onInprogressStopLiveLocationEvent);
  }

  _onInprogressStopLiveLocationEvent(InprogressStopLiveLocationEvent event,
      Emitter<InprogressState> emit) async {
    final databaseReference = FirebaseDatabase.instance.ref();

    LocationPermission permission;
    permission = await Geolocator.requestPermission();
    Position position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high);
    // curLiveLocations.add(
    //     Location(latitude: position.latitude, longtitude: position.latitude));

    for (int i = 0; i < pendingOrders!.length; i++) {
      await databaseReference
          .child(pendingOrders![i].orderId.toString())
          .once()
          .then((DatabaseEvent event) {
        if (event.snapshot.value != null) {
          Map<dynamic, dynamic> result = (event.snapshot.value as Map<Object?, Object?>);
          log("Test result: ${result.toString()}");
          DriverTrip trip = driverTripFromJson(result.toString());
          // log("Test trip$i: ${trip.location}");
          // if (trip.location.every((item) => curLiveLocations.contains(item))) {
          //   trip.updateLiveLocation(curLiveLocations);
          // } else {
          //   trip.addLocation(curLiveLocations);
          // }
          // databaseReference.child(pendingOrders![i].orderId.toString()).set({
          //   driverTripToJson(trip),
          // });
        } else {
          databaseReference.child(pendingOrders![i].orderId.toString()).set({
            'start_at': '${DateTime.now()}',
            'location': [
              [
                {
                  "latitude": position.latitude,
                  "longtitude": position.latitude
                },
              ],
            ],
          });
        }
      });
    }
  }

  _onInprogressInitialEvent(
      InprogressInitialEvent event, Emitter<InprogressState> emit) async {}
}
