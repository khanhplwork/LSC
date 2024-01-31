import 'package:flutter/material.dart';
import 'package:lsc/core/app_export.dart';

void showLoadingDialog() async {
  BuildContext context = NavigatorService.navigatorKey.currentContext!;
  return showDialog<void>(
    context: context,
    barrierDismissible: false, // user must tap button!
    builder: (BuildContext context) {
      return AlertDialog(
          backgroundColor: Colors.transparent,
          shadowColor: Colors.transparent,
          content: SizedBox(
            height: 300.v,
            child: Center(
              child: CircularProgressIndicator(
                color: appTheme.bgEDF5F8,
              ),
            ),
          ));
    },
  );
}
