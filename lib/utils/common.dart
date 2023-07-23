import 'package:flutter/material.dart';

import '../../widgets/custom_text.dart';
import '../resources/job_colors.dart';
import '../resources/job_strings.dart';
import 'constants.dart';


void showSnackBar(BuildContext context, {required String message}) {
  final scaffold = ScaffoldMessenger.of(context);
  scaffold.showSnackBar(
    SnackBar(
      content: CustomText(message),
      action: SnackBarAction(
          label: '',
          textColor: Colors.white,
          onPressed: scaffold.hideCurrentSnackBar),
    ),
  );
}

abstract class Utils {
  static int _loaderCount = 0;

  static showLoader(BuildContext context, {bool tapToDismiss = true}) async {
    debugPrint("showLoader");
    if (_loaderCount <= 0) {
      _loaderCount = 1;
      debugPrint("Showing: _loaderCount: $_loaderCount");
      await showDialog(
          routeSettings: const RouteSettings(name: Constants.dialogRouteLoader),
          useRootNavigator: true,
          context: context,
          barrierDismissible: tapToDismiss,
          builder: (context) => const Center(
            child: SizedBox(
              width: 48,
              height: 48,
              child: CircularProgressIndicator(
                  valueColor:
                  AlwaysStoppedAnimation<Color>(JobColors.duelBlack)),
            ),
          ));
      _loaderCount = 0;
    } else {
      _loaderCount++;
      debugPrint("Counting: _loaderCount: $_loaderCount");
    }
  }

  static hideLoader(BuildContext context) async {
    if (_loaderCount <= 0) return;
    await Future.sync(() {
      debugPrint("hideLoader");
      _loaderCount--;
      debugPrint("_loaderCount: $_loaderCount");
      if (_loaderCount <= 0) {
        var rootNavigator = Navigator.of(context, rootNavigator: true);
        if (rootNavigator.canPop()) rootNavigator.pop();
        _loaderCount = 0;
      }
    });
  }

  static showOkAlert(BuildContext context, String message) {
    // set up the button
    Widget okButton = Padding(
      padding: const EdgeInsets.all(8.0),
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          shape:
          RoundedRectangleBorder(borderRadius: BorderRadius.circular(8.0)),
          foregroundColor: JobColors.white,
          backgroundColor: JobColors.appColor, // foreground
        ),
        child: Text(JobStrings.ok.toUpperCase()),
        onPressed: () {
          Navigator.of(context, rootNavigator: true).pop();
        },
      ),
    );

    // set up the AlertDialog
    AlertDialog alert = AlertDialog(
      content: Text(message),
      contentPadding: const EdgeInsets.all(12),
      actionsPadding: const EdgeInsets.symmetric(vertical: 0, horizontal: 16),
      buttonPadding: const EdgeInsets.all(0),
      actions: [
        okButton,
      ],
    );

    return showDialog(
        routeSettings: const RouteSettings(name: Constants.dialogRouteOkAlert),
        context: context,
        builder: (context) {
          return alert;
        });
  }

  static showConfirmAlert(
      BuildContext context,
      String message,
      String confirmText,
      String cancelText,
      VoidCallback onConfirm,
      ) {
    // set up the buttons
    Widget confirmButton = ElevatedButton(
      child: Text(confirmText.toUpperCase()),
      onPressed: () {
        Navigator.of(context, rootNavigator: true).pop();
        onConfirm();
      },
    );

    Widget cancelButton = ElevatedButton(
      child: Text(cancelText.toUpperCase()),
      onPressed: () {
        Navigator.of(context, rootNavigator: true).pop();
      },
    );

    // set up the AlertDialog
    AlertDialog alert = AlertDialog(
      title: const Text(JobStrings.jobFinder),
      content: Text(message),
      actions: [
        cancelButton,
        confirmButton,
      ],
    );

    return showDialog(
        context: context,
        builder: (BuildContext context) {
          return alert;
        });
  }
}
