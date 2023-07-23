import 'dart:io';
import 'package:flutter/material.dart';
import 'package:sample/utils/extensions.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../resources/job_colors.dart';
import '../../resources/job_strings.dart';
import '../../resources/job_styles.dart';
import '../../utils/common.dart';
import '../../utils/job_route.dart';
import '../../widgets/custom_form_button.dart';
import '../../widgets/custom_input_field.dart';
import '../../widgets/page_header.dart';
import '../../widgets/page_heading.dart';

class SignupPage extends StatefulWidget {
  const SignupPage({Key? key}) : super(key: key);

  @override
  State<SignupPage> createState() => _SignupPageState();
}

class _SignupPageState extends State<SignupPage> {
  File? _profileImage;
  TextEditingController name = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController mobile = TextEditingController();
  TextEditingController password = TextEditingController();
  TextEditingController confirmPassword = TextEditingController();
  bool visible = true;
  bool confirmVisible = true;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: JobColors.white,
        body: SingleChildScrollView(
          child: Column(
            children: [
              const PageHeader(),
              Container(
                decoration: BoxDecoration(
                  color: JobColors.white,
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Column(
                  children: [
                    const PageHeading(title: JobStrings.signupTitle),
                    _image(),
                    const SizedBox(height: 16),
                    CustomInputField(
                      label: JobStrings.name,
                      controller: name,
                      hintText: JobStrings.nameHint,
                      validator: (value) {
                        if (value!.isEmpty) {
                          return JobStrings.nameHint;
                        }
                        return null;
                      },
                      onSaved: (value) {
                        name.text = value!;
                      },
                      keyboardType: TextInputType.name,
                    ),
                    const SizedBox(height: 16),
                    CustomInputField(
                      label: JobStrings.email,
                      controller: email,
                      hintText: JobStrings.emailHint,
                      validator: (value) {
                        if (value!.isEmpty) {
                          return JobStrings.emailHint;
                        }
                        if (!email.text.isValidEmail()) {
                          return JobStrings.emailInputError;
                        }
                        return null;
                      },
                      onSaved: (value) {
                        email.text = value!;
                      },
                      keyboardType: TextInputType.emailAddress,
                    ),
                    const SizedBox(height: 16),
                    CustomInputField(
                      label: JobStrings.mobile,
                      controller: mobile,
                      hintText: JobStrings.mobileHint,
                      validator: (value) {
                        if (value!.isEmpty) {
                          return JobStrings.mobileHint;
                        }
                        if (!mobile.text.isValidPhone()) {
                          return JobStrings.mobileInputError;
                        }
                        return null;
                      },
                      onSaved: (value) {
                        mobile.text = value!;
                      },
                      keyboardType: TextInputType.phone,
                    ),
                    const SizedBox(height: 16),
                    CustomInputField(
                      label: JobStrings.password,
                      controller: password,
                      obscure: visible,
                      hintText: JobStrings.passwordHint,
                      validator: (value) {
                        if (value!.isEmpty) {
                          return JobStrings.passwordHint;
                        }
                        if (!password.text.isValidPassword()) {
                          return JobStrings.passwordInputError;
                        }
                        return null;
                      },
                      onSaved: (value) {
                        password.text = value!;
                      },
                      keyboardType: TextInputType.emailAddress,
                      suffixIcon:
                      visible ? Icons.visibility_off : Icons.visibility,
                      suffixIconColor:
                      visible ? JobColors.gray : JobColors.duelBlack,
                      suffixIconOnTap: () {
                        setState(() {
                          visible = !visible;
                        });
                      },
                    ),
                    const SizedBox(height: 16),
                    CustomInputField(
                      label: JobStrings.confirmPassword,
                      controller: confirmPassword,
                      obscure: confirmVisible,
                      hintText: JobStrings.confirmPasswordHint,
                      validator: (value) {
                        if (value!.isEmpty) {
                          return JobStrings.confirmPasswordHint;
                        }
                        if (!password.text.isValidPassword()) {
                          return JobStrings.passwordInputError;
                        }
                        return null;
                      },
                      onSaved: (value) {
                        confirmPassword.text = value!;
                      },
                      keyboardType: TextInputType.emailAddress,
                      suffixIcon: confirmVisible
                          ? Icons.visibility_off
                          : Icons.visibility,
                      suffixIconColor:
                      confirmVisible ? JobColors.gray : JobColors.duelBlack,
                      suffixIconOnTap: () {
                        setState(() {
                          confirmVisible = !confirmVisible;
                        });
                      },
                    ),
                    const SizedBox(height: 35),
                    CustomFormButton(
                      innerText: JobStrings.signup,
                      onPressed: _handleSignupUser,
                    ),
                    const SizedBox(height: 18),
                    SizedBox(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          const Text(
                            JobStrings.alreadyAccount,
                            style: JobStyles.regularText13,
                          ),
                          GestureDetector(
                            onTap: _login,
                            child: const Text(
                              JobStrings.loginTitle,
                              style: TextStyle(
                                fontSize: 15,
                                color: JobColors.gray,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 30),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _image() {
    return SizedBox(
      width: 130,
      height: 130,
      child: CircleAvatar(
        backgroundColor: JobColors.lightText,
        backgroundImage:
        _profileImage != null ? FileImage(_profileImage!) : null,
        child: Stack(
          children: [
            Positioned(
              bottom: 5,
              right: 5,
              child: GestureDetector(
                onTap: () {
                  /* Add image picker here */
                },
                child: Container(
                  height: 50,
                  width: 50,
                  decoration: BoxDecoration(
                    color: JobColors.blue,
                    border: Border.all(
                      color: JobColors.white,
                      width: 3,
                    ),
                    borderRadius: BorderRadius.circular(25),
                  ),
                  child: const Icon(
                    Icons.camera_alt_sharp,
                    color: JobColors.white,
                    size: 25,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _handleSignupUser() async {
    if (password.text != confirmPassword.text) {
      showSnackBar(context, message: 'Passwords do not match!');
    } else {
      Utils.showLoader(context);
      showSnackBar(context, message: 'Submitting data..');

      // Save email and password to shared preferences
      SharedPreferences prefs = await SharedPreferences.getInstance();
      await prefs.setString('email', email.text);
      await prefs.setString('password', password.text);

      // Navigate to login screen after completing the signup process
      Future.delayed(const Duration(seconds: 2), () {
        Navigator.pushReplacementNamed(context, JobRoute.login);
      });
    }
  }

  void _login() {
    Navigator.pushReplacementNamed(context, JobRoute.login);
  }
}
