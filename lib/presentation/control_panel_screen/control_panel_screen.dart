import 'package:flutter/material.dart';
import 'package:lsc/core/app_export.dart';
import 'package:lsc/presentation/control_panel_screen/bloc/control_panel_bloc.dart';
import 'package:percent_indicator/percent_indicator.dart';

class ControlPanelScreen extends StatelessWidget {
  static Widget builder(BuildContext context) {
    return BlocProvider<ControlPanelBloc>(
        create: (context) => ControlPanelBloc(ControlPanelState())
          ..add(ControlPanelInitialEvent()),
        child: ControlPanelScreen());
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ControlPanelBloc, ControlPanelState>(
        builder: (context, state) {
      return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          toolbarHeight: 50.v,
          leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: Icon(
              Icons.arrow_back_ios,
            ),
          ),
          title: Text('Control Panel',
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
        body: Material(
          child: Container(
            color: appTheme.bgEDF5F8,
            width: double.infinity,
            height: double.infinity,
            padding: EdgeInsets.all(10.h),
            child: SingleChildScrollView(
              scrollDirection: Axis.vertical,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: EdgeInsets.fromLTRB(10.h, 20.v, 10.h, 20.v),
                    child: Text(
                      "Control Panel",
                      style: theme.textTheme.bodyMedium!.copyWith(
                        color: Colors.black.withOpacity(0.8),
                        fontSize: 14.v,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                  Container(
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10.v),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: EdgeInsets.fromLTRB(10.h, 20.v, 10.h, 20.v),
                          child: Text(
                            "Shippment Summary",
                            style: theme.textTheme.bodyMedium!.copyWith(
                              color: Colors.black.withOpacity(0.8),
                              fontSize: 14.v,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),
                        Divider(
                          color: appTheme.bgEDF5F8,
                          thickness: 2.v,
                        ),
                        Padding(
                          padding: EdgeInsets.only(left: 10.h),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Padding(
                                padding: EdgeInsets.only(
                                  right: 10.h,
                                  top: 5.v,
                                  bottom: 5.v,
                                ),
                                child: InkWell(
                                  onTap: () {
                                  },
                                  child: Icon(
                                    Icons.local_shipping_sharp,
                                    color: Colors.orange,
                                  ),
                                ),
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "shippments",
                                    style: theme.textTheme.bodyMedium!.copyWith(
                                      color: Colors.black.withOpacity(0.8),
                                      fontSize: 12.v,
                                      fontWeight: FontWeight.w400,
                                    ),
                                  ),
                                  Padding(
                                    padding:
                                        EdgeInsets.fromLTRB(0.h, 5.v, 0.h, 0.v),
                                    child: Text(
                                      state.controlPanelData?.shipments
                                              .toString() ??
                                          "0",
                                      style:
                                          theme.textTheme.bodyMedium!.copyWith(
                                        color: Colors.black.withOpacity(0.8),
                                        fontSize: 12.v,
                                        fontWeight: FontWeight.w400,
                                      ),
                                    ),
                                  ),
                                ],
                              )
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 5.v,
                        ),
                        Padding(
                          padding: EdgeInsets.only(left: 10.h),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Padding(
                                padding: EdgeInsets.only(
                                  right: 10.h,
                                  top: 5.v,
                                  bottom: 5.v,
                                ),
                                child: Icon(
                                  Icons.file_download_done_outlined,
                                  color: Colors.lightGreen,
                                ),
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "Shipments delivered",
                                    style: theme.textTheme.bodyMedium!.copyWith(
                                      color: Colors.black.withOpacity(0.8),
                                      fontSize: 12.v,
                                      fontWeight: FontWeight.w400,
                                    ),
                                  ),
                                  Padding(
                                    padding:
                                        EdgeInsets.fromLTRB(0.h, 5.v, 0.h, 0.v),
                                    child: Text(
                                      state.controlPanelData?.shipmentsDelivered
                                              .toString() ??
                                          "0",
                                      style:
                                          theme.textTheme.bodyMedium!.copyWith(
                                        color: Colors.black.withOpacity(0.8),
                                        fontSize: 12.v,
                                        fontWeight: FontWeight.w400,
                                      ),
                                    ),
                                  ),
                                ],
                              )
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 5.v,
                        ),
                        Padding(
                          padding: EdgeInsets.only(left: 10.h),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Padding(
                                padding: EdgeInsets.only(
                                  right: 10.h,
                                  top: 5.v,
                                  bottom: 5.v,
                                ),
                                child: Icon(
                                  Icons.card_giftcard,
                                  color: Colors.red,
                                ),
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "Consolidated",
                                    style: theme.textTheme.bodyMedium!.copyWith(
                                      color: Colors.black.withOpacity(0.8),
                                      fontSize: 12.v,
                                      fontWeight: FontWeight.w400,
                                    ),
                                  ),
                                  Padding(
                                    padding:
                                        EdgeInsets.fromLTRB(0.h, 5.v, 0.h, 0.v),
                                    child: Text(
                                      state.controlPanelData?.consolidated
                                              .toString() ??
                                          "0",
                                      style:
                                          theme.textTheme.bodyMedium!.copyWith(
                                        color: Colors.black.withOpacity(0.8),
                                        fontSize: 12.v,
                                        fontWeight: FontWeight.w400,
                                      ),
                                    ),
                                  ),
                                ],
                              )
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 10.v,
                        ),
                      ],
                    ),
                  ),
                  Container(
                    width: double.infinity,
                    margin: EdgeInsets.only(top: 20.v),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10.v),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: EdgeInsets.fromLTRB(10.h, 20.v, 10.h, 20.v),
                          child: Text(
                            "Pickup Summary",
                            style: theme.textTheme.bodyMedium!.copyWith(
                              color: Colors.black.withOpacity(0.8),
                              fontSize: 14.v,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),
                        Divider(
                          color: appTheme.bgEDF5F8,
                          thickness: 2.v,
                        ),
                        Padding(
                          padding: EdgeInsets.only(left: 10.h),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Padding(
                                padding: EdgeInsets.only(
                                  right: 10.h,
                                  top: 5.v,
                                  bottom: 5.v,
                                ),
                                child: Icon(
                                  Icons.punch_clock,
                                  color: Colors.lightBlue,
                                ),
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "Assigned pickups",
                                    style: theme.textTheme.bodyMedium!.copyWith(
                                      color: Colors.black.withOpacity(0.8),
                                      fontSize: 12.v,
                                      fontWeight: FontWeight.w400,
                                    ),
                                  ),
                                  Padding(
                                    padding:
                                        EdgeInsets.fromLTRB(0.h, 5.v, 0.h, 0.v),
                                    child: Text(
                                      state.controlPanelData?.assignedPickup
                                              .toString() ??
                                          "0",
                                      style:
                                          theme.textTheme.bodyMedium!.copyWith(
                                        color: Colors.black.withOpacity(0.8),
                                        fontSize: 12.v,
                                        fontWeight: FontWeight.w400,
                                      ),
                                    ),
                                  ),
                                ],
                              )
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 5.v,
                        ),
                        Padding(
                          padding: EdgeInsets.only(left: 10.h),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Padding(
                                padding: EdgeInsets.only(
                                  right: 10.h,
                                  top: 5.v,
                                  bottom: 5.v,
                                ),
                                child: Icon(
                                  Icons.cancel_presentation,
                                  color: Colors.orange,
                                ),
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "Rejected Pickups",
                                    style: theme.textTheme.bodyMedium!.copyWith(
                                      color: Colors.black.withOpacity(0.8),
                                      fontSize: 12.v,
                                      fontWeight: FontWeight.w400,
                                    ),
                                  ),
                                  Padding(
                                    padding:
                                        EdgeInsets.fromLTRB(0.h, 5.v, 0.h, 0.v),
                                    child: Text(
                                      state.controlPanelData?.rejectedPickup
                                              .toString() ??
                                          "0",
                                      style:
                                          theme.textTheme.bodyMedium!.copyWith(
                                        color: Colors.black.withOpacity(0.8),
                                        fontSize: 12.v,
                                        fontWeight: FontWeight.w400,
                                      ),
                                    ),
                                  ),
                                ],
                              )
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 5.v,
                        ),
                        Padding(
                          padding: EdgeInsets.only(left: 10.h),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Padding(
                                padding: EdgeInsets.only(
                                  right: 10.h,
                                  top: 5.v,
                                  bottom: 5.v,
                                ),
                                child: Icon(
                                  Icons.cancel_outlined,
                                  color: Colors.red,
                                ),
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "Pickups cancelled",
                                    style: theme.textTheme.bodyMedium!.copyWith(
                                      color: Colors.black.withOpacity(0.8),
                                      fontSize: 12.v,
                                      fontWeight: FontWeight.w400,
                                    ),
                                  ),
                                  Padding(
                                    padding:
                                        EdgeInsets.fromLTRB(0.h, 5.v, 0.h, 0.v),
                                    child: Text(
                                      state.controlPanelData?.pickupCanceled
                                              .toString() ??
                                          "0",
                                      style:
                                          theme.textTheme.bodyMedium!.copyWith(
                                        color: Colors.black.withOpacity(0.8),
                                        fontSize: 12.v,
                                        fontWeight: FontWeight.w400,
                                      ),
                                    ),
                                  ),
                                ],
                              )
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 5.v,
                        ),
                        Padding(
                          padding: EdgeInsets.only(left: 10.h),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Padding(
                                padding: EdgeInsets.only(
                                  right: 10.h,
                                  top: 5.v,
                                  bottom: 5.v,
                                ),
                                child: Icon(
                                  Icons.file_download_done_outlined,
                                  color: Colors.lightGreen,
                                ),
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "Delivered pickups",
                                    style: theme.textTheme.bodyMedium!.copyWith(
                                      color: Colors.black.withOpacity(0.8),
                                      fontSize: 12.v,
                                      fontWeight: FontWeight.w400,
                                    ),
                                  ),
                                  Padding(
                                    padding:
                                        EdgeInsets.fromLTRB(0.h, 5.v, 0.h, 0.v),
                                    child: Text(
                                      state.controlPanelData?.pickupDelivered
                                              .toString() ??
                                          "0",
                                      style:
                                          theme.textTheme.bodyMedium!.copyWith(
                                        color: Colors.black.withOpacity(0.8),
                                        fontSize: 12.v,
                                        fontWeight: FontWeight.w400,
                                      ),
                                    ),
                                  ),
                                ],
                              )
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 10.v,
                        ),
                      ],
                    ),
                  ),
                  Container(
                    width: double.infinity,
                    margin: EdgeInsets.only(top: 20.v),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10.v),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: EdgeInsets.fromLTRB(10.h, 20.v, 10.h, 20.v),
                          child: Text(
                            "Sales Summary",
                            style: theme.textTheme.bodyMedium!.copyWith(
                              color: Colors.black.withOpacity(0.8),
                              fontSize: 14.v,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),
                        Divider(
                          color: appTheme.bgEDF5F8,
                          thickness: 2.v,
                        ),
                        Padding(
                          padding: EdgeInsets.only(top: 20.v, left: 10.h),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Total shipments",
                                style: theme.textTheme.bodyMedium!.copyWith(
                                  color: Colors.black.withOpacity(0.8),
                                  fontSize: 12.v,
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                              Padding(
                                padding:
                                    EdgeInsets.fromLTRB(0.h, 5.v, 0.h, 0.v),
                                child: Text(
                                  state.controlPanelData?.totalShipment
                                          .toString() ??
                                      "0",
                                  style: theme.textTheme.bodyMedium!.copyWith(
                                    color: Colors.black.withOpacity(0.8),
                                    fontSize: 14.v,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: 0.h),
                          child: LinearPercentIndicator(
                            width: 370.h,
                            lineHeight: 5.v,
                            percent:
                                state.controlPanelData?.totalShipmentProgress ??
                                    0.0,
                            progressColor: Colors.red,
                            animation: true,
                            animationDuration: 1000,
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(top: 20.v, left: 10.h),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Total pickups",
                                style: theme.textTheme.bodyMedium!.copyWith(
                                  color: Colors.black.withOpacity(0.8),
                                  fontSize: 12.v,
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                              Padding(
                                padding:
                                    EdgeInsets.fromLTRB(0.h, 5.v, 0.h, 0.v),
                                child: Text(
                                  state.controlPanelData?.totalPickups
                                          .toString() ??
                                      "0",
                                  style: theme.textTheme.bodyMedium!.copyWith(
                                    color: Colors.black.withOpacity(0.8),
                                    fontSize: 14.v,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: 0.h),
                          child: LinearPercentIndicator(
                            width: 370.h,
                            lineHeight: 5.v,
                            percent:
                                state.controlPanelData?.totalPickupsProgress ??
                                    0.0,
                            progressColor: Colors.blue,
                            animation: true,
                            animationDuration: 1000,
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(top: 20.v, left: 10.h),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Consolidated total",
                                style: theme.textTheme.bodyMedium!.copyWith(
                                  color: Colors.black.withOpacity(0.8),
                                  fontSize: 12.v,
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                              Padding(
                                padding:
                                    EdgeInsets.fromLTRB(0.h, 5.v, 0.h, 0.v),
                                child: Text(
                                  state.controlPanelData?.consolidatedTotal
                                          .toString() ??
                                      "0",
                                  style: theme.textTheme.bodyMedium!.copyWith(
                                    color: Colors.black.withOpacity(0.8),
                                    fontSize: 14.v,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: 0.h),
                          child: LinearPercentIndicator(
                            width: 370.h,
                            lineHeight: 5.v,
                            percent: state.controlPanelData
                                    ?.consolidatedTotalProgress ??
                                0.0,
                            progressColor: Colors.yellow,
                            animation: true,
                            animationDuration: 1000,
                          ),
                        ),
                        SizedBox(
                          height: 10.v,
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 100.v,
                  ),
                ],
              ),
            ),
          ),
          // Add your widget content here
        ),
      );
    });
  }
}
