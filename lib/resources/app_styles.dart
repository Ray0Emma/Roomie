import 'package:flutter/material.dart';
import 'package:roomie/resources/app_colors.dart';

var enabledBorder = OutlineInputBorder(
  borderRadius: BorderRadius.circular(50),
  borderSide: const BorderSide(color: AppColors.PRIMARY_COLOR, width: 1.5),
);
var errorBorder = OutlineInputBorder(
  borderRadius: BorderRadius.circular(50),
  borderSide: const BorderSide(color: AppColors.RED_COLOR, width: 1.5),
);

var focusedBorder = OutlineInputBorder(
  borderRadius: BorderRadius.circular(50),
  borderSide: const BorderSide(color: AppColors.PRIMARY_COLOR, width: 1.5),
);
var enabledBorderAbout = OutlineInputBorder(
  borderRadius: BorderRadius.circular(30),
  borderSide: const BorderSide(color: AppColors.PRIMARY_COLOR, width: 1.5),
);
var errorBorderAbout = OutlineInputBorder(
  borderRadius: BorderRadius.circular(30),
  borderSide: const BorderSide(color: AppColors.RED_COLOR, width: 1.5),
);

var focusedBorderAbout = OutlineInputBorder(
  borderRadius: BorderRadius.circular(30),
  borderSide: const BorderSide(color: AppColors.PRIMARY_COLOR, width: 1.5),
);
