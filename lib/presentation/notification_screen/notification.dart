import 'package:flutter/material.dart';
import 'package:lsc/core/app_export.dart';

class NotificationScreen extends StatelessWidget {
  static Widget builder(BuildContext context) => NotificationScreen();
  @override
  Widget build(BuildContext context) {
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
        title: Text('Notification',
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
          padding: EdgeInsets.all(10.h),
          color: appTheme.bgEDF5F8,
          width: double.infinity,
          height: double.infinity,
          child: SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  width: 390.h,
                  margin: EdgeInsets.fromLTRB(0, 20.v, 0, 0),
                  padding: EdgeInsets.all(10.h),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10.v),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.5),
                        spreadRadius: 0,
                        blurRadius: 2,
                        offset: Offset(0, 1), // changes position of shadow
                      ),
                    ],
                  ),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Expanded(
                        child: Column(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Text(
                                  "Order ID: ",
                                  style: theme.textTheme.displaySmall!.copyWith(
                                    color: Colors.black,
                                    fontSize: 14.v,
                                    fontWeight: FontWeight.w700,
                                  ),
                                ),
                                Expanded(
                                  child: Text(
                                    "OD123456789",
                                    textAlign: TextAlign.right,
                                    style:
                                        theme.textTheme.displaySmall!.copyWith(
                                      color: Colors.black,
                                      fontSize: 14.v,
                                      fontWeight: FontWeight.w400,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            Padding(
                              padding: EdgeInsets.only(top: 5.v),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Text(
                                    "Delivery address: ",
                                    style:
                                        theme.textTheme.displaySmall!.copyWith(
                                      color: Colors.black,
                                      fontSize: 14.v,
                                      fontWeight: FontWeight.w700,
                                    ),
                                  ),
                                  Expanded(
                                    child: Text(
                                      "abcxyz",
                                      textAlign: TextAlign.right,
                                      style: theme.textTheme.displaySmall!
                                          .copyWith(
                                        color: Colors.black,
                                        fontSize: 14.v,
                                        fontWeight: FontWeight.w400,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.only(top: 5.v),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Text(
                                    "Receiver: ",
                                    style:
                                        theme.textTheme.displaySmall!.copyWith(
                                      color: Colors.black,
                                      fontSize: 14.v,
                                      fontWeight: FontWeight.w700,
                                    ),
                                  ),
                                  Expanded(
                                    child: Text(
                                      "abcxyz",
                                      textAlign: TextAlign.right,
                                      style: theme.textTheme.displaySmall!
                                          .copyWith(
                                        color: Colors.black,
                                        fontSize: 14.v,
                                        fontWeight: FontWeight.w400,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.only(top: 5.v),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Text(
                                    "At: ",
                                    style:
                                        theme.textTheme.displaySmall!.copyWith(
                                      color: Colors.black,
                                      fontSize: 14.v,
                                      fontWeight: FontWeight.w700,
                                    ),
                                  ),
                                  Expanded(
                                    child: Text(
                                      "21 June 2023 10:00 AM",
                                      textAlign: TextAlign.right,
                                      style: theme.textTheme.displaySmall!
                                          .copyWith(
                                        color: Colors.black,
                                        fontSize: 14.v,
                                        fontWeight: FontWeight.w400,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(width: 20.h),
                      Icon(
                        Icons.arrow_forward_ios,
                        color: Colors.black,
                        size: 15.v,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
