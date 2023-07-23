import 'package:flutter/material.dart';
import 'package:sample/resources/job_colors.dart';
import 'package:sample/screens/forgot_password/forget_password_screen.dart';
import 'package:sample/screens/home/home_screen.dart';
import 'package:sample/screens/login/login_page.dart';
import 'package:sample/screens/register/signup_page.dart';
import 'package:sample/screens/splash/splash_screen.dart';
import 'package:sample/utils/job_route.dart';

void main() {
  runApp(const MyApp());

}

// Future<void> main() async {
//   WidgetsFlutterBinding.ensureInitialized();
//   runApp(const MyApp());
// }

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Job Finder',
      theme: ThemeData(
        primaryColor: JobColors.appColor,
        splashColor: Colors.transparent,
        highlightColor: Colors.transparent,
        hoverColor: Colors.transparent,
        colorScheme: ColorScheme.fromSeed(seedColor: JobColors.duelBlack),
        useMaterial3: true,
      ),
      initialRoute: JobRoute.splash,
      onGenerateRoute: (settings) {
        switch (settings.name) {
          case JobRoute.splash:
            return MaterialPageRoute(
                builder: (context) => const SplashScreen());
          case JobRoute.login:
            return MaterialPageRoute(builder: (context) => const LoginPage());
          case JobRoute.register:
            return MaterialPageRoute(builder: (context) => const SignupPage());
          case JobRoute.forgotPassword:
            return MaterialPageRoute(
                builder: (context) => const ForgetPasswordPage());
          case JobRoute.home:
            return MaterialPageRoute(builder: (context) => const HomeScreen());
          default:
          // Handle unknown routes or return a default page
            return null;
        }
      },
    );
  }
}

