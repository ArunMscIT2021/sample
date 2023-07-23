import 'package:flutter/material.dart';
import '../../resources/job_colors.dart';
import '../../resources/job_strings.dart';
import '../../widgets/custom_form_button.dart';
import '../../widgets/custom_text.dart';

List<String> countryCodes = [
  '+91',
  '+1',
];

class SendOtp extends StatefulWidget {
  final Function onSendOtpPressed;

  const SendOtp({Key? key, required this.onSendOtpPressed}) : super(key: key);

  @override
  State<SendOtp> createState() => _SendOtpState();
}

class _SendOtpState extends State<SendOtp> {
  final TextEditingController mobileController = TextEditingController();
  String countryCode = '+91';
  String mobile = '';

  void onCountryCodeChanged(countryCode) {
    this.countryCode = countryCode;
    setState(() {
      countryCode;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            Container(
              margin: const EdgeInsets.only(top: 8),
              child: const CustomText(
                JobStrings.sendOtpScreen,
                style: TextStyle(color: JobColors.lightText),
              ),
            ),
          ],
        ),
        Container(
          height: 55,
            margin: const EdgeInsets.only(top: 25,left: 20,right: 20),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                color: JobColors.lightText),
            clipBehavior: Clip.hardEdge,
            child: Row(
              children: [
                Container(
                    height: 55,
                    decoration: const BoxDecoration(
                      color: JobColors.lightGray,
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(12),
                        bottomLeft: Radius.circular(12),
                        topRight: Radius.circular(0),
                        bottomRight: Radius.circular(0),
                      ),
                    ),
                    padding: const EdgeInsets.only(left: 8, right: 8),
                    child: Center(
                      child: DropdownButton(
                          value: countryCode,
                          style: const TextStyle(color: JobColors.white),
                          dropdownColor: JobColors.lightGray,
                          icon: const Icon(Icons.keyboard_arrow_down),
                          underline: const SizedBox(),
                          iconEnabledColor: JobColors.white,
                          items: countryCodes
                              .map((item) => DropdownMenuItem(
                                  value: item, child: CustomText(item)))
                              .toList(),
                          onChanged: onCountryCodeChanged),
                    )),
                Expanded(
                    child: TextFormField(
                  keyboardType: TextInputType.number,
                  onChanged: (value) => {mobile = value},
                      controller:mobileController,
                  autofocus: true,
                  decoration: const InputDecoration(
                      filled: true,
                      fillColor: JobColors.lightText,
                      contentPadding: EdgeInsets.all(12),
                      hintText: JobStrings.mobileHint,
                      hintStyle: TextStyle(color: JobColors.white),
                      isDense: true,
                      border: OutlineInputBorder(borderSide: BorderSide.none)),
                  style: const TextStyle(color: JobColors.white),
                ))
              ],
            )),
        const SizedBox(height: 30),
        CustomFormButton(
          innerText: JobStrings.sendOtp,
          onPressed: () => widget.onSendOtpPressed(mobile),
        ),
      ],
    );
  }
}
