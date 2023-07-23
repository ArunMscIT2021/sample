import 'dart:async';
import 'package:flutter/material.dart';

import '../../resources/job_colors.dart';
import '../../widgets/drawer.dart';
import '../login/login_page.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Timer(
        const Duration(seconds: 3),
            () =>
            Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (cxt) => const LoginPage())));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image.asset(
              "assets/images/job.jpg",
              width: 200,
              height: 200,
            ),


            SizedBox(height: 20),

            Text(
              " JOB FINDER",
              style: TextStyle(
                  color: JobColors.appColor,
                  fontSize: 20,
                  fontWeight: FontWeight.bold),
            ),
            Text(
              " finding your perfect job",
              style: TextStyle(
                  color: JobColors.appColor,
                  fontSize: 15,
                  fontStyle: FontStyle.italic),
            ),
          ],
        ),
      ),
    );
  }
}
