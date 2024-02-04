import 'package:flutter/material.dart';
import 'package:lsc/core/app_export.dart';

void showLoadingDialog() async {
  BuildContext context = NavigatorService.navigatorKey.currentContext!;
  return showDialog<void>(
    context: context,
    barrierDismissible: false, // user must tap button!
    builder: (BuildContext context) {
      return Material(
        type: MaterialType.transparency,
        child: Container(
          decoration: BoxDecoration(
            color: Colors.grey.withOpacity(0.5),
          ),
          height: MediaQuery.of(context).size.height,
          child: Center(
            child: CircularProgressIndicator(
              color: appTheme.bgEDF5F8,
            ),
          ),
        ),
      );
    },
  );
}
