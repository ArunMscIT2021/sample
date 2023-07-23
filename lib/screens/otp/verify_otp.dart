import 'package:flutter/material.dart';
import '../../resources/job_colors.dart';
import '../../resources/job_strings.dart';
import '../../utils/constants.dart';
import '../../utils/enum.dart';
import '../../widgets/custom_form_button.dart';
import '../../widgets/custom_text.dart';
import '../../widgets/otp_input.dart';

class VerifyOtp extends StatefulWidget {
  final Function onVerifyOtpPressed;
  final Function onResendOtpPressed;
  final Function onChangeNumberPressed;
  final String mobile;

  const VerifyOtp(
      {Key? key,
      required this.onVerifyOtpPressed,
      required this.onResendOtpPressed,
      required this.onChangeNumberPressed,
      required this.mobile})
      : super(key: key);

  @override
  State<VerifyOtp> createState() => _VerifyOtpState();
}

class _VerifyOtpState extends State<VerifyOtp> {
  String otp = '';

  final TextEditingController otpInput1 = TextEditingController();
  final TextEditingController otpInput2 = TextEditingController();
  final TextEditingController otpInput3 = TextEditingController();
  final TextEditingController otpInput4 = TextEditingController();
  final TextEditingController otpInput5 = TextEditingController();
  final TextEditingController otpInput6 = TextEditingController();

  void onOtpChanged(countryCode) {}

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        CustomText('Enter the OTP sent to ${widget.mobile}',
            style: const TextStyle(color: JobColors.lightText)),
        const SizedBox(height: 30),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            OtpInput(
                controller: otpInput1,
                index: 0,
                otpLength: Constants.otpLength),
            OtpInput(
                controller: otpInput2,
                index: 1,
                otpLength: Constants.otpLength),
            OtpInput(
                controller: otpInput3,
                index: 2,
                otpLength: Constants.otpLength),
            OtpInput(
                controller: otpInput4,
                index: 3,
                otpLength: Constants.otpLength),
            OtpInput(
                controller: otpInput5,
                index: 4,
                otpLength: Constants.otpLength),
            OtpInput(
                controller: otpInput6, index: 5, otpLength: Constants.otpLength)
          ],
        ),
        const SizedBox(height: 50),
        CustomFormButton(
          innerText: JobStrings.verifyOtp,
          onPressed: () {
            String otp = otpInput1.text +
                otpInput2.text +
                otpInput3.text +
                otpInput4.text +
                otpInput5.text +
                otpInput6.text;
            widget.onVerifyOtpPressed(otp, context);
          },
        ),
        const SizedBox(height: 30),
        Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          const CustomText(JobStrings.dontReceiveOtp,
              size: CustomTextSize.small),
          Container(
              margin: const EdgeInsets.only(top: 12),
              alignment: Alignment.centerLeft,
              child: Row(children: [
                Container(
                    margin: const EdgeInsets.only(right: 8),
                    child: InkWell(
                      child: const CustomText(JobStrings.resend,
                          style: TextStyle(
                              color: JobColors.gray,
                              decoration: TextDecoration.underline)),
                      onTap: () => widget.onResendOtpPressed(),
                    )),
                Container(
                    margin: const EdgeInsets.only(right: 8),
                    child: const CustomText('|',
                        style: TextStyle(color: Colors.black12))),
                GestureDetector(
                    child: const CustomText(JobStrings.changeNumber,
                        style: TextStyle(
                            color: JobColors.gray,
                            decoration: TextDecoration.underline)),
                    onTap: () => widget.onChangeNumberPressed())
              ]))
        ])
      ],
    );
  }
}
