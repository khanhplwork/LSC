import 'package:flutter/material.dart';
import '../core/app_export.dart';

/// A collection of pre-defined text styles for customizing text appearance,
/// categorized by different font families and weights.
/// Additionally, this class includes extensions on [TextStyle] to easily apply specific font families to text.

class CustomTextStyles {
  // Body text style
  static get bodyMediumGray900 => theme.textTheme.bodyMedium!.copyWith(
        color: appTheme.gray900.withOpacity(0.8),
      );
  static get bodySmallGray900 => theme.textTheme.bodySmall!.copyWith(
        color: appTheme.gray900,
      );
  static get bodySmallcc131212 => theme.textTheme.bodySmall!.copyWith(
        color: Color(0XCC131212),
      );
  static get bodySmallff1317dd => theme.textTheme.bodySmall!.copyWith(
        color: Color(0XFF1317DD),
      );
}

extension on TextStyle {
  TextStyle get sFProRounded {
    return copyWith(
      fontFamily: 'SF Pro Rounded',
    );
  }
}
