import 'package:flutter/material.dart';
import 'package:lsc/core/app_export.dart';
import 'package:lsc/core/model/shipment_model/shipment_data.dart';
Widget recentShipmentWidget (BuildContext context, ShipmentData data){
  return Container(
    padding: EdgeInsets.all(10.h),
    decoration: BoxDecoration(
      color: Colors.white,
      borderRadius: BorderRadius.circular(10.0),
      border: Border.all(
        color: Colors.grey,
        width: 1,
      ),
    ),
    child: Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
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
                data.orderId.toString(),
                textAlign: TextAlign.right,
                style: theme.textTheme.displaySmall!.copyWith(
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
                style: theme.textTheme.displaySmall!.copyWith(
                  color: Colors.black,
                  fontSize: 14.v,
                  fontWeight: FontWeight.w700,
                ),
              ),
              Expanded(
                child: Text(
                  data.addressOrder,
                  textAlign: TextAlign.right,
                  style: theme.textTheme.displaySmall!.copyWith(
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
                style: theme.textTheme.displaySmall!.copyWith(
                  color: Colors.black,
                  fontSize: 14.v,
                  fontWeight: FontWeight.w700,
                ),
              ),
              Expanded(
                child: Text(
                  data.receiverName ?? '',
                  textAlign: TextAlign.right,
                  style: theme.textTheme.displaySmall!.copyWith(
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
                "Order Status: ",
                style: theme.textTheme.displaySmall!.copyWith(
                  color: Colors.black,
                  fontSize: 14.v,
                  fontWeight: FontWeight.w700,
                ),
              ),
              Expanded(
                child: Text(
                  data.modStyle,
                  textAlign: TextAlign.right,
                  style: theme.textTheme.displaySmall!.copyWith(
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
  );
}