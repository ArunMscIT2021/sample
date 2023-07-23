import 'package:flutter/material.dart';
import 'package:sample/resources/job_res.dart';

import '../resources/job_colors.dart';

extension StringEmailValidation on String {
  bool isValidEmail() {
    final emailRegex = RegExp(
      r'''^[a-zA-Z0-9+_.-]+@[a-zA-Z0-9.-]+\.[a-z]+$''',
    );
    return emailRegex.hasMatch(this);
  }
}

extension StringPasswordValidation on String {
  bool isValidPassword() {
    final passwordRegex = RegExp(
      r'''^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#$&*~{}]).{8,}$''',
    );
    return passwordRegex.hasMatch(this);
  }
}

extension StringPhoneNumberValidation on String {
  bool isValidPhone() {
    final phoneRegex =
    RegExp(r'''^(\+?\d{1,4}[\s-])?(?!0+\s+,?$)\d{10}\s*,?$''');
    return phoneRegex.hasMatch(this);
  }
}

extension ContextExtension on BuildContext {
  void showCustomDialog(String title, Widget child) {
    // set up the Dialog
    showDialog(
      context: this,
      builder: (BuildContext context) {
        return Dialog(
          child: Container(
            width: 400,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5.0),
                color: JobColors.white),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      margin: const EdgeInsets.all(20.0),
                      child: Text(
                        title,
                        style: JobStyles.titleText,
                      ),
                    ),
                    // Dialog content
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: IconButton(
                        icon: const Icon(Icons.close),
                        onPressed: () => Navigator.of(context).pop(),
                      ),
                    ),
                  ],
                ),
                const Divider(thickness: 3, height: 0.0),
                child,
              ],
            ),
          ),
        );
      },
    );
  }
}
