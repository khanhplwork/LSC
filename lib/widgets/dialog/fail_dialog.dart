import 'package:flutter/material.dart';
import 'package:lsc/core/app_export.dart';

void showFailDialog(String msg) async {
  BuildContext context = NavigatorService.navigatorKey.currentContext!;
  return showDialog<void>(
    context: context,
    barrierDismissible: false, // user must tap button!
    builder: (BuildContext context) {
      return AlertDialog(
        content: SingleChildScrollView(
          child: ListBody(
            children: <Widget>[
              Row(
                children: [
                  Text(
                    msg,
                    style: theme.textTheme.bodyMedium,
                  ),
                  SizedBox(
                    width: 10.h,
                  ),
                  Icon(
                    Icons.warning_outlined,
                    size: 20.fSize,
                    color: Colors.red,
                  )
                ],
              ),
              Text(
                "Please try again!",
                style: theme.textTheme.bodyMedium,
              ),
            ],
          ),
        ),
        actions: <Widget>[
          TextButton(
            child: Text(
              'Confirm',
              style: theme.textTheme.bodyMedium!.copyWith(
                  fontWeight: FontWeight.bold, color: appTheme.indigoA700),
            ),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
        ],
      );
    },
  );
}
