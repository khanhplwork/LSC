import 'package:flutter/material.dart';
import 'package:lsc/core/app_export.dart';
import 'package:lsc/core/model/shipment_model/shipment_data.dart';
import 'package:lsc/core/utils/string_extension.dart';

Widget recentShipmentWidget(BuildContext context, ShipmentData data) {
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
              "Tracking: ",
              style: theme.textTheme.displaySmall!.copyWith(
                color: Colors.black,
                fontSize: 14.v,
                fontWeight: FontWeight.w700,
              ),
            ),
            Expanded(
              child: Text(
                data.orderPrefix + data.orderNo,
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
              Spacer(),
              if (data.isConsolidate == 1)
                Container(
                  padding: EdgeInsets.all(5.h),
                  margin: EdgeInsets.only(right: 5.h),
                  decoration: BoxDecoration(
                    color: data.statusStyleConsolidate.color.toColor(),
                    borderRadius: BorderRadius.circular(5.0),
                  ),
                  child: Text(
                    data.statusStyleConsolidate.modStyle,
                    textAlign: TextAlign.right,
                    style: theme.textTheme.displaySmall!.copyWith(
                      color: Colors.white,
                      fontSize: 12.v,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ),
              if (data.isPickup == 1)
                Container(
                  padding: EdgeInsets.all(5.h),
                  margin: EdgeInsets.only(right: 5.h),
                  decoration: BoxDecoration(
                    color: data.statusStylePickup.color.toColor(),
                    borderRadius: BorderRadius.circular(5.0),
                  ),
                  child: Text(
                    data.statusStylePickup.modStyle,
                    textAlign: TextAlign.right,
                    style: theme.textTheme.displaySmall!.copyWith(
                      color: Colors.white,
                      fontSize: 12.v,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ),
              Container(
                padding: EdgeInsets.all(5.h),
                decoration: BoxDecoration(
                  color: data.color.toColor(),
                  borderRadius: BorderRadius.circular(5.0),
                ),
                child: Text(
                  data.modStyle,
                  textAlign: TextAlign.right,
                  style: theme.textTheme.displaySmall!.copyWith(
                    color: Colors.white,
                    fontSize: 12.v,
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
