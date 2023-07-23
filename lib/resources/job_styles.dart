import 'package:flutter/material.dart';

import 'job_colors.dart';

class JobStyles {
  static const EdgeInsets loginScreenEdgeInsets =
      EdgeInsets.only(top: 50, bottom: 10, right: 15, left: 15);

  static const TextStyle regularText13 = TextStyle(
      color: JobColors.gray, fontSize: 13, fontWeight: FontWeight.bold);

  static const TextStyle regularText12 = TextStyle(
      color: JobColors.gray, fontSize: 12, fontWeight: FontWeight.bold);

  static const TextStyle regularText16 =
      TextStyle(fontWeight: FontWeight.w500, fontSize: 16.0);

  static const TextStyle title = TextStyle(
      color: JobColors.appColor, fontSize: 25, fontWeight: FontWeight.w600);

  static const TextStyle titleText =TextStyle(fontSize: 18, fontWeight: FontWeight.bold);

  static OutlineInputBorder outLineBorder = OutlineInputBorder(
    borderSide: const BorderSide(width: 1, color: JobColors.gray),
    borderRadius: BorderRadius.circular(12.0),
  );
}
