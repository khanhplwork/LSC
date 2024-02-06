import 'package:flutter/material.dart';
import 'package:lsc/core/app_export.dart';
import 'package:lsc/core/model/pending_order_model/pending_order.dart';
Widget pendingOrderItem(BuildContext context, PendingOrder data) {
  return Container(
    margin: EdgeInsets.only(
        left: 10.h, top: 10.v, right: 10.h, bottom: 10.v),
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
                "${data.orderPrefix}${data.orderNo}",
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

      ],
    ),
  );
}