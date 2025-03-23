import 'package:flutter/material.dart';
import 'colors.dart';

class AppTextStyles {
  static const String fontFamily = 'Euclid Circular A';

  static const TextStyle greeting = TextStyle(
    fontSize: 22.0,
    fontWeight: FontWeight.w500,
    color: AppColors.lightBeigeColor,
    fontFamily: fontFamily,
    letterSpacing: -0.5,
    height: 1.6,
  );

  static const TextStyle headline = TextStyle(
    fontSize: 35.0,
    fontWeight: FontWeight.w500,
    color: AppColors.darkColor,
    fontFamily: fontFamily,
    letterSpacing: -0.5,
    height: 1.4,
  );

  static const TextStyle buttonLabel = TextStyle(
    fontSize: 16.0,
    fontWeight: FontWeight.w500,
    color: AppColors.white,
    fontFamily: fontFamily,
  );

  static const TextStyle countLabel = TextStyle(
    fontSize: 18.0,
    fontWeight: FontWeight.w500,
    color: AppColors.grey,
    fontFamily: fontFamily,
  );

  static const TextStyle count = TextStyle(
    fontSize: 40.0,
    fontWeight: FontWeight.bold,
    color: AppColors.white,
    fontFamily: fontFamily,
  );

  static const TextStyle countBeige = TextStyle(
    fontSize: 40.0,
    fontWeight: FontWeight.bold,
    color: AppColors.lightBeigeColor,
    fontFamily: fontFamily,
  );

  static const TextStyle address = TextStyle(
    fontSize: 16.0,
    fontWeight: FontWeight.w500,
    color: AppColors.darkColor,
    fontFamily: fontFamily,
  );

  static const TextStyle locationBar = TextStyle(
    fontSize: 15.0,
    fontWeight: FontWeight.w500,
    color: AppColors.lightBeigeColor,
    fontFamily: fontFamily,
  );

  static const TextStyle searchBar = TextStyle(
    fontSize: 15.0,
    fontWeight: FontWeight.w500,
    color: AppColors.darkColor,
    fontFamily: fontFamily,
  );

  static const TextStyle listButton = TextStyle(
    fontSize: 14.0,
    fontWeight: FontWeight.w500,
    color: AppColors.darkColor,
    fontFamily: fontFamily,
  );
}
