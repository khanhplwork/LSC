import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:lsc/core/app_export.dart';

class InProgressOrderScreen extends StatelessWidget {
  static Widget builder(BuildContext context) => InProgressOrderScreen();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        alignment: Alignment.bottomCenter,
        children: [
          Container(
            width: double.infinity,
            height: double.infinity,
            child: GoogleMap(
              initialCameraPosition: CameraPosition(
                target: LatLng(37.42796133580664, -122.085749655962),
                zoom: 15,
              ),
              onMapCreated: (GoogleMapController controller) {
                // You can customize the map here
              },
            ),
          ),
          DraggableScrollableSheet(
            minChildSize: 0.1, // Minimum height of the draggable sheet
            maxChildSize: 0.5, // Maximum height of the draggable sheet
            initialChildSize: 0.1, // Initial height of the draggable sheet
            expand:
                true, // Whether the sheet should expand when dragged to its maximum height
            builder: (BuildContext context, ScrollController scrollController) {
              return Container(
                margin: EdgeInsets.only(left: 10.h, right: 10.h),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(20.v),
                    topRight: Radius.circular(20.v),
                  ),
                ),
                child: SingleChildScrollView(
                  controller: scrollController,
                  scrollDirection: Axis.vertical,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [],
                  ),
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
