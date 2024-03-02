import 'dart:async';

import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:lsc/core/app_export.dart';
import 'package:lsc/core/model/pending_order_model/pending_order.dart';
import 'package:lsc/presentation/inprogress_order_screen/bloc/inprogress_bloc.dart';
import 'package:lsc/presentation/inprogress_order_screen/widgets/pending_order_item.dart';
import 'package:lsc/widgets/custom_elevated_button.dart';
import 'package:lsc/widgets/dialog/fail_dialog.dart';
import 'package:lsc/widgets/dialog/success_dialog.dart';

class InProgressOrderScreen extends StatefulWidget {
  static Widget builder(BuildContext context) {
    return BlocProvider<InprogressBloc>(
      create: (context) =>
          InprogressBloc(InprogressState())..add(InprogressInitialEvent()),
      child: InProgressOrderScreen(),
    );
  }

  @override
  State<InProgressOrderScreen> createState() => _InProgressOrderScreenState();
}

class _InProgressOrderScreenState extends State<InProgressOrderScreen> {
  LatLng? _currentPosition;
  double currentZoom = 12;

  GoogleMapController? mapController;

  StreamSubscription<Position>? locationStream;

  @override
  void dispose() {
    locationStream?.cancel();
    super.dispose();
  }

  @override
  void initState() {
    getLocation();

    LocationSettings locationSettings =
        LocationSettings(accuracy: LocationAccuracy.high, distanceFilter: 1);

    locationStream =
        Geolocator.getPositionStream(locationSettings: locationSettings)
            .listen((Position? position) {
      if (!mounted) {
        return;
      }
      if (position != null) {
        if (mapController != null) {
          _currentPosition = LatLng(position.latitude, position.longitude);
          mapController!.getZoomLevel().then((value) {
            currentZoom = value;
            print(currentZoom);
            mapController!.animateCamera(
              CameraUpdate.newCameraPosition(
                CameraPosition(
                  target: _currentPosition!,
                  zoom: currentZoom,
                ),
              ),
            );
          });
        }
      }
    });

    super.initState();
  }

  getLocation() async {
    LocationPermission permission;
    permission = await Geolocator.requestPermission();

    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.deniedForever) {
        return Future.error('Location permission is denied forever.');
      }
      if (permission == LocationPermission.denied) {
        return Future.error('Location permission is denied.');
      }
    }

    Position position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high);
    double lat = position.latitude;
    double long = position.longitude;

    LatLng location = LatLng(lat, long);

    setState(() {
      _currentPosition = location;
    });
  }

  void _currentLocation() async {
    if(mapController == null || _currentPosition == null){

    }else{
      mapController?.animateCamera(CameraUpdate.newCameraPosition(
        CameraPosition(
          bearing: 0,
          target: LatLng(_currentPosition!.latitude, _currentPosition!.longitude),
          zoom: 17.0,
        ),
      ));
    }

  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<InprogressBloc, InprogressState>(
        builder: (context, state) {
          final _inprogressBloc = context.read<InprogressBloc>();
      return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          toolbarHeight: 50.v,
          leading: IconButton(
            onPressed: () {

              selectedOrder = null;
              NavigatorService.pushNamedAndRemoveUntil(AppRoutes.homeScreen);
            },
            icon: Icon(
              Icons.arrow_back_ios,
            ),
          ),
          title: Text('Order Detail',
              style: theme.textTheme.headlineLarge!.copyWith(
                color: Colors.black,
                fontSize: 20.v,
                fontWeight: FontWeight.w700,
              )),
          centerTitle: true,
          iconTheme: IconThemeData(
            color: Colors.black, // Change color here
            size: 20.h, // Change size here
          ),
        ),
        floatingActionButton: (state.isShowCompletedButton)
            ? CustomElevatedButton(
                onPressed: () {
                  showDialog<void>(
                    context: context,
                    barrierDismissible: true, // user must tap button!
                    builder: (context) {
                      return AlertDialog(
                        content: SingleChildScrollView(
                          child: ListBody(
                            children: <Widget>[
                              Text("Are you sure to complete this order?"),
                            ],
                          ),
                        ),
                        actions: <Widget>[
                          TextButton(
                            child: Text(
                              'Cancel',
                              style: theme.textTheme.bodyMedium!.copyWith(
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            onPressed: () {
                              Navigator.pop(context);
                            },
                          ),
                          TextButton(
                            child: Text(
                              'Confirm',
                              style: theme.textTheme.bodyMedium!.copyWith(
                                  fontWeight: FontWeight.bold,
                                  color: appTheme.indigoA700),
                            ),
                            onPressed: () {
                              _inprogressBloc.add(
                                OnClickCompletedOrderEvent(),
                              );
                            },
                          ),
                        ],
                      );
                    },
                  );
                },
                text: "Completed Order",
                buttonStyle: ElevatedButton.styleFrom(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20.h), // <-- Radius
                  ),
                  backgroundColor: appTheme.indigoA700,
                  textStyle: TextStyle(
                    fontSize: 16.fSize,
                  ),
                  padding: EdgeInsets.all(10.fSize),
                  elevation: 5,
                  shadowColor: Colors.grey,
                ),
                margin: EdgeInsets.only(
                  left: 22.h,
                  right: 16.h,
                ),
              )
            : SizedBox(),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
        body: _currentPosition == null
            ? Center(child: CircularProgressIndicator())
            : Stack(
                alignment: Alignment.bottomCenter,
                children: [
                  Container(
                    width: double.infinity,
                    height: double.infinity,
                    child: GoogleMap(
                      myLocationEnabled: true,
                      myLocationButtonEnabled: false,
                      initialCameraPosition: CameraPosition(
                        target: _currentPosition!,
                        zoom: currentZoom,
                      ),
                      mapType: MapType.normal,
                      onMapCreated: (GoogleMapController controller) {
                        mapController = controller;
                      },
                    ),
                  ),
                  DraggableScrollableSheet(
                    minChildSize: 0.2,
                    // Minimum height of the draggable sheet
                    maxChildSize: 0.6,
                    // Maximum height of the draggable sheet
                    initialChildSize: 0.2,
                    // Initial height of the draggable sheet
                    expand: true,
                    // Whether the sheet should expand when dragged to its maximum height

                    builder: (BuildContext context,
                        ScrollController scrollController) {
                      return SingleChildScrollView(

                        controller: scrollController,
                        scrollDirection: Axis.vertical,
                        child: Column(
                          children: [
                            Align(
                              alignment: Alignment.topRight,
                              child: Container(
                                margin: EdgeInsets.only(left: 10.h, bottom: 5.v),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(5.fSize),
                                  color: Colors.grey.withOpacity(0.4),
                                ),
                                child: IconButton(
                                  onPressed: _currentLocation,
                                  icon: Icon(Icons.location_on),
                                ),
                              ),
                            ),
                            Container(
                              width: double.infinity,
                              margin: EdgeInsets.only(left: 10.h, right: 10.h),
                              decoration: BoxDecoration(
                                color: appTheme.bgEDF5F8,
                                borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(20.v),
                                  topRight: Radius.circular(20.v),
                                ),
                              ),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Column(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Container(
                                        margin:
                                            EdgeInsets.only(top: 20.v, left: 20.h),
                                        child: Text(
                                          "Order Details",
                                          style: TextStyle(
                                            fontSize: 20.fSize,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                      ),
                                      Container(
                                        margin:
                                            EdgeInsets.only(top: 20.v, left: 20.h),
                                        child: Text(
                                          "Order ID: ${selectedOrder?.orderId ?? ''}",
                                          style: TextStyle(
                                            fontSize: 16.fSize,
                                          ),
                                        ),
                                      ),
                                      Container(
                                        margin:
                                            EdgeInsets.only(top: 20.v, left: 20.h),
                                        child: Text(
                                          "Order Date: ${selectedOrder?.orderDate.toString().split(" ")[0] ?? ''}",
                                          style: TextStyle(
                                            fontSize: 16.fSize,
                                          ),
                                        ),
                                      ),
                                      Container(
                                        margin:
                                            EdgeInsets.only(top: 20.v, left: 20.h),
                                        child: Text(
                                          "Receiver: ${selectedOrder?.receiverName ?? ''}",
                                          style: TextStyle(
                                            fontSize: 16.fSize,
                                          ),
                                        ),
                                      ),
                                      Container(
                                        margin:
                                            EdgeInsets.only(top: 20.v, left: 20.h),
                                        child: Text(
                                          "Order Address: ${selectedOrder?.addressOrder ?? ''}",
                                          style: TextStyle(
                                            fontSize: 16.fSize,
                                          ),
                                        ),
                                      ),
                                      Container(
                                        margin:
                                            EdgeInsets.only(top: 20.v, left: 20.h),
                                        child: Text(
                                          "Payment: ${selectedOrder?.payment ?? ''}",
                                          style: TextStyle(
                                            fontSize: 16.fSize,
                                          ),
                                        ),
                                      ),
                                      Container(
                                        margin:
                                            EdgeInsets.only(top: 20.v, left: 20.h),
                                        child: Text(
                                          "Order Status: ${selectedOrder!.modStyle}",
                                          style: TextStyle(
                                            fontSize: 16.fSize,
                                          ),
                                        ),
                                      ),
                                      Container(
                                        margin:
                                            EdgeInsets.only(top: 20.v, left: 20.h),
                                        child: Text(
                                          "Total cost: ${selectedOrder?.totalCost ?? ''}",
                                          style: TextStyle(
                                            fontSize: 16.fSize,
                                          ),
                                        ),
                                      ),
                                      Container(
                                        margin:
                                            EdgeInsets.only(top: 20.v, left: 20.h),
                                        child: Text(
                                          "Invoice status: ${selectedOrder?.invoiceStatus ?? ''}",
                                          style: TextStyle(
                                            fontSize: 16.fSize,
                                          ),
                                        ),
                                      ),
                                      SizedBox(
                                        height: 100.v,
                                      ),
                                    ],
                                  )
                                ],
                              ),
                            ),
                          ],
                        ),
                      );
                    },
                  ),
                ],
              ),
      );
    });
  }
}
