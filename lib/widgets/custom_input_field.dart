import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../resources/job_colors.dart';
import '../resources/job_styles.dart';

class CustomInputField extends StatefulWidget {
  final String label;
  final TextEditingController? controller;
  final IconData? suffixIcon;
  final IconData? prefixIcon;
  final TextInputType keyboardType;
  final String hintText;
  final ValueChanged<String>? onChanged;
  final FormFieldValidator<String> validator;
  final List<TextInputFormatter>? inputFormatters;
  final FormFieldSetter<String>? onSaved;
  final GestureTapCallback? suffixIconOnTap;
  final bool? obscure;
  final FocusNode? focusNode;
  final Color? suffixIconColor;
  final String? subTitle;

  const CustomInputField({
    Key? key,
    required this.controller,
    required this.hintText,
    required this.validator,
    required this.keyboardType,
    required this.label,
    this.suffixIcon,
    this.onSaved,
    this.focusNode,
    this.inputFormatters,
    this.onChanged,
    this.prefixIcon,
    this.suffixIconOnTap,
    this.obscure = false,
    this.suffixIconColor,
    this.subTitle,
  }) : super(key: key);

  @override
  State<CustomInputField> createState() => CustomInputFieldState();
}

class CustomInputFieldState extends State<CustomInputField> {
  bool focused = false;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Container(
      width: size.width * 0.9,
      padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 3),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  widget.label,
                  style: JobStyles.titleText,
                ),
              ),
              Text(
                widget.subTitle ?? "",
                style: const TextStyle(
                    fontWeight: FontWeight.w400,
                    fontSize: 14,
                    color: JobColors.duelBlack),
              )
            ],
          ),
          const SizedBox(height: 8),
          TextFormField(
            autovalidateMode: AutovalidateMode.onUserInteraction,
            autofocus: false,
            onChanged: widget.onChanged,
            onSaved: widget.onSaved,
            focusNode: widget.focusNode,
            cursorColor: JobColors.pink,
            controller: widget.controller,
            obscureText: widget.obscure!,
            validator: widget.validator,
            inputFormatters: widget.inputFormatters,
            keyboardType: widget.keyboardType,
            decoration: InputDecoration(
                enabledBorder: JobStyles.outLineBorder,
                focusedBorder: JobStyles.outLineBorder,
                border: JobStyles.outLineBorder,
                hintText: widget.hintText,
                prefixIcon:
                    widget.prefixIcon != null ? Icon(widget.prefixIcon) : null,
                suffixIcon: widget.suffixIcon != null
                    ? IconButton(
                        onPressed: widget.suffixIconOnTap,
                        icon: Icon(widget.suffixIcon,
                            color: widget.suffixIconColor),
                      )
                    : null),
          ),
        ],
      ),
    );
  }
}
