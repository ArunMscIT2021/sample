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

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController email = TextEditingController();
  final TextEditingController password = TextEditingController();
  bool visible = true;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
        body: Column(
          children: [
            const PageHeader(),
            Expanded(
              child: Container(
                decoration: BoxDecoration(
                  color: JobColors.white,
                  borderRadius: BorderRadius.circular(20),
                ),
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      const PageHeading(title: JobStrings.loginTitle),
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
                      const SizedBox(height: 20),
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
                      Container(
                        width: size.width * 0.80,
                        alignment: Alignment.centerRight,
                        child: GestureDetector(
                          onTap: _forgot,
                          child: const Text(JobStrings.forgot,
                              style: JobStyles.regularText13),
                        ),
                      ),
                      const SizedBox(height: 25),
                      CustomFormButton(
                          innerText: JobStrings.login, onPressed: _home),
                      const SizedBox(height: 18),
                      SizedBox(
                        width: size.width * 0.8,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Text(
                              JobStrings.haveAccount,
                              style: JobStyles.regularText13,
                            ),
                            GestureDetector(
                              onTap: _signup,
                              child: const Text(
                                JobStrings.signupTitle,
                                style: TextStyle(
                                  fontSize: 13,
                                  color: JobColors.gray,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(height: 20),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _forgot() {
    Navigator.pushReplacementNamed(context, JobRoute.forgotPassword);
  }

  void _home() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? savedEmail = prefs.getString('email');
    String? savedPassword = prefs.getString('password');

    if (savedEmail != null &&
        savedPassword != null &&
        email.text == savedEmail &&
        password.text == savedPassword) {
      Utils.showLoader(context);
      showSnackBar(context, message: 'Welcome....');

      // Navigate to home screen after successful login
      Future.delayed(const Duration(seconds: 2), () {
        Navigator.pushReplacementNamed(context, JobRoute.home);
      });
    } else {
      Utils.showOkAlert(context, "Invalid Email or Password");
    }
  }

  void _signup() {
    Navigator.pushReplacementNamed(context, JobRoute.register);
  }
}