import 'package:flutter/material.dart';
import 'package:responsive_builder/responsive_builder.dart';

import '../../app/colors.dart';
import '../../app/configs.dart';
import 'scaling.dart';

class ScreenUiHelper {
  double? width;
  double? height;

  late double blockSizeHorizontal;
  late double blockSizeVertical;

  ScalingHelper? scalingHelper;

  TextStyle? headline;
  TextStyle? title;
  TextStyle? body;
  TextStyle? buttonStyle;

  double? headlineSize;
  double? titleSize;
  double? bodySize;

  Color? surfaceColor;
  Color? backgroundColor;
  Color? primaryColor;
  Color? textPrimaryColor;
  Color? textSecondaryColor;
  Color? dividerColor;

  TextStyle? headlineTextStyle;
  late TextStyle titleTextStyle;
  TextStyle? bodyTextStyle;
  TextStyle? buttonTextStyle;

  late SizedBox verticalSpaceLow;
  late SizedBox verticalSpaceMedium;
  late SizedBox verticalSpaceHigh;

  SizedBox? horizontalSpaceLow;
  SizedBox? horizontalSpaceMedium;
  SizedBox? horizontalSpaceHigh;

  ScreenUiHelper.fromContext(BuildContext context) {
    final mediaQuery = MediaQuery.of(context);

    surfaceColor = Theme.of(context).brightness == Brightness.dark
        ? darkColor.surfaceColor
        : lightColor.surfaceColor;
    backgroundColor = Theme.of(context).brightness == Brightness.dark
        ? darkColor.backgroundColor
        : lightColor.backgroundColor;
    primaryColor = Theme.of(context).brightness == Brightness.dark
        ? darkColor.primaryColor
        : lightColor.primaryColor;
    textPrimaryColor = Theme.of(context).brightness == Brightness.dark
        ? darkColor.textPrimaryColor
        : lightColor.textPrimaryColor;
    textSecondaryColor = Theme.of(context).brightness == Brightness.dark
        ? darkColor.textSecondaryColor
        : lightColor.textSecondaryColor;
    dividerColor = Theme.of(context).brightness == Brightness.dark
        ? darkColor.dividerColor
        : lightColor.dividerColor;

    final double screenWidth = mediaQuery.size.width;
    final double screenHeight = mediaQuery.size.height;
    width = screenWidth;
    height = screenHeight;

    scalingHelper = ScalingHelper(context, width: screenWidth);

    headlineSize = getDeviceType(mediaQuery.size) == DeviceScreenType.desktop
        ? 24
        : getDeviceType(mediaQuery.size) == DeviceScreenType.tablet
            ? 24
            : 20;
    titleSize = getDeviceType(mediaQuery.size) == DeviceScreenType.desktop
        ? 20
        : getDeviceType(mediaQuery.size) == DeviceScreenType.tablet
            ? 18
            : 16;
    bodySize = getDeviceType(mediaQuery.size) == DeviceScreenType.desktop
        ? 14
        : getDeviceType(mediaQuery.size) == DeviceScreenType.tablet
            ? 14
            : 12;

    headline = TextStyle(
        fontWeight: FontWeight.bold,
        color: textPrimaryColor,
        fontSize: headlineSize,
        decoration: TextDecoration.none,
        fontFamily: SystemProperties.titleFont);

    title = TextStyle(
        fontWeight: FontWeight.w600,
        fontSize: titleSize,
        color: textPrimaryColor,
        decoration: TextDecoration.none,
        fontFamily: SystemProperties.titleFont);
    buttonStyle = TextStyle(
        fontFamily: SystemProperties.titleFont,
        decoration: TextDecoration.none,
        fontWeight: FontWeight.bold,
        color: textPrimaryColor,
        fontSize: bodySize);

    body = TextStyle(
        color: textSecondaryColor,
        fontWeight: FontWeight.w400,
        fontSize: bodySize,
        decoration: TextDecoration.none,
        fontFamily: SystemProperties.fontName);

    headlineTextStyle = TextStyle(
        fontWeight: FontWeight.bold,
        fontSize: headlineSize,
        decoration: TextDecoration.none,
        fontFamily: SystemProperties.titleFont);

    titleTextStyle = TextStyle(
        fontWeight: FontWeight.w600,
        fontSize: titleSize,
        decoration: TextDecoration.none,
        fontFamily: SystemProperties.titleFont);
    buttonTextStyle = TextStyle(
        fontFamily: SystemProperties.titleFont,
        decoration: TextDecoration.none,
        fontWeight: FontWeight.bold,
        fontSize: bodySize);

    bodyTextStyle = TextStyle(
        fontWeight: FontWeight.w400,
        fontSize: bodySize,
        decoration: TextDecoration.none,
        fontFamily: SystemProperties.fontName);

    blockSizeHorizontal = screenWidth / 100;
    blockSizeVertical = screenHeight / 100;

    verticalSpaceLow = SizedBox(
      height: blockSizeVertical * 1.5,
    );
    verticalSpaceMedium = SizedBox(
      height: blockSizeVertical * 4,
    );
    verticalSpaceHigh = SizedBox(
      height: blockSizeVertical * 6,
    );

    horizontalSpaceLow = SizedBox(
      width: blockSizeHorizontal * 1.5,
    );
    horizontalSpaceMedium = SizedBox(
      width: blockSizeHorizontal * 7,
    );
    horizontalSpaceHigh = SizedBox(
      width: blockSizeHorizontal * 11,
    );
  }
}
