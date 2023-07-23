import 'package:flutter/material.dart';
import '../../resources/job_colors.dart';
import '../../resources/job_strings.dart';
import '../../utils/common.dart';
import '../../utils/constants.dart';
import '../../utils/job_route.dart';
import '../../widgets/custom_text.dart';
import '../otp/send_otp.dart';
import '../otp/verify_otp.dart';

class ForgetPasswordPage extends StatefulWidget {
  const ForgetPasswordPage({super.key});

  @override
  State<ForgetPasswordPage> createState() => _ForgetPasswordPageState();
}

class _ForgetPasswordPageState extends State<ForgetPasswordPage> {
  bool otpSent = false;
  String mobile = '';

  void onSendOtpPressed(String mobile) {
    this.mobile = mobile;
    if (otpSent = true) {
      showSnackBar(context, message: 'Welcome.. Otp Screen');
      Future.delayed(const Duration(seconds: 1), () {
        setState(() {
          otpSent;
        });
      });
    }
  }

  void onVerifyOtpPressed(String otp, BuildContext context) {
    if (otp.length != Constants.otpLength) {
      showSnackBar(context, message: 'Please enter valid OTP');
    } else {
      Navigator.pushNamed(context, JobRoute.register);
    }
  }

  void onResendOtpPressed() {}

  void onChangeNumberPressed() {
    otpSent = false;
    setState(() {
      otpSent;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
            image: DecorationImage(
                image: AssetImage('assets/images/profile.png'),
                fit: BoxFit.cover)),
        padding: const EdgeInsets.all(16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const CustomText(
              JobStrings.hello,
              style: TextStyle(color: JobColors.appColor),
            ),
            otpSent
                ? VerifyOtp(
                    mobile: mobile,
                    onVerifyOtpPressed: onVerifyOtpPressed,
                    onResendOtpPressed: onResendOtpPressed,
                    onChangeNumberPressed: onChangeNumberPressed,
                  )
                : SendOtp(onSendOtpPressed: onSendOtpPressed)
          ],
        ),
      ),
    );
  }
}
