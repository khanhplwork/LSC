// import 'dart:async';
// import 'package:firebase_database/firebase_database.dart';

// void saveLocationToFirebase() {
//   // Initialize Firebase Realtime Database
//   final database = FirebaseDatabase.instance.reference();

//   // Start a timer that runs every 5 seconds
//   Timer.periodic(Duration(seconds: 5), (timer) {
//     // Get the current location
//     // Replace this with your own logic to get the location
//     final latitude = 37.7749;
//     final longitude = -122.4194;

//     // Save the location to Firebase Realtime Database
//     database.child('locations').push().set({
//       'latitude': latitude,
//       'longitude': longitude,
//       'timestamp': DateTime.now().toUtc().toString(),
//     });
//   });
// }

// void main() {
//   saveLocationToFirebase();
// }
