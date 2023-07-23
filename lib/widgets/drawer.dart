import 'dart:io';

import 'package:flutter/material.dart';
import 'package:sample/widgets/text_icon.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:url_launcher/url_launcher.dart';
import '../resources/job_colors.dart';
import '../screens/app_about/app_about.dart';
import '../screens/login/login_page.dart';
import '../screens/register/signup_page.dart';
import '../screens/sub_screen/book_marks.dart';
import '../screens/sub_screen/feedback_screen.dart';
import '../screens/privacy/privacy.dart';
import '../screens/user/profile.dart';

class HomeDrawer extends StatefulWidget {
  const HomeDrawer({Key? key}) : super(key: key);

  @override
  State<HomeDrawer> createState() => _HomeDrawerState();
}

class _HomeDrawerState extends State<HomeDrawer> {
  String fullName = '';
  String email = '';

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _loadProfileData();
  }

  void _loadProfileData() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      fullName = prefs.getString('fullName') ?? '';
      email = prefs.getString('email') ?? '';
      // Load the rest of the SharedPreferences data
    });
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: JobColors.white,
      child: Column(
        children: <Widget>[
          Expanded(
            child: Padding(
              padding: const EdgeInsets.only(left: 20, right: 20),
              child: Column(
                children: <Widget>[
                  SizedBox(
                    height: 150.0,
                    child: DrawerHeader(
                      margin: EdgeInsets.zero,
                      padding: EdgeInsets.zero,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: <Widget>[
                          CircleImage(height: 50, width: 50),
                          SizedBox(width: 15),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                fullName,
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 14,
                                ),
                              ),
                              SizedBox(height: 5),
                              Text(
                                email,
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 14,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                  TextIcon(
                      label: "Account Information",
                      icon: Icons.person_outline,
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (_) => JobSeekerProfile()));
                      }),
                  // TextIcon(
                  //     label: "Search jobs",
                  //     icon: Icons.search,
                  //     onTap: () {
                  //
                  //     }),
                  TextIcon(
                      label: "Save Jobs",
                      icon: Icons.bookmark_border,
                      onTap: () {
                        Navigator.push(context,
                            MaterialPageRoute(builder: (_) => BookMarks()));
                      }),
                  TextIcon(
                      label: "Terms and Conditions",
                      icon: Icons.security_outlined,
                      onTap: () {
                        Navigator.push(context,
                            MaterialPageRoute(builder: (_) => Terms()));
                      }),
                  TextIcon(
                    label: "Chat for help",
                    icon: Icons.mark_unread_chat_alt_outlined,
                    onTap:() => _launchWhatsapp(context),
                  ),
                  TextIcon(
                      label: "Feedback",
                      icon: Icons.feedback_outlined,
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (_) => FeedbackScreen()));
                      }),
                  TextIcon(
                      label: "About us",
                      icon: Icons.info_outline_rounded,
                      onTap: () {
                        Navigator.push(context,
                            MaterialPageRoute(builder: (_) => AboutScreen()));
                      }),
                ],
              ),
            ),
          ),
          Align(
              alignment: FractionalOffset.bottomCenter,
              child: Column(
                children: <Widget>[
                  const Divider(),
                  email.isEmpty
                      ? Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            _customButton(
                                onTap: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (_) => LoginPage()));
                                },
                                label: "LOGIN",
                                color: JobColors.green),
                            _customButton(
                                onTap: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (_) => SignupPage()));
                                },
                                label: "register".toUpperCase(),
                                color: JobColors.pink)
                          ],
                        )
                      : _customButton(
                          onTap: () {
                            exit(0);
                          },
                          label: "Logout".toUpperCase(),
                          color: JobColors.pink),
                  const Padding(
                    padding: EdgeInsets.only(left: 12.0),
                    child: ListTile(
                      title: Text(
                        'Version 1.0.0',
                        style: TextStyle(color: JobColors.gray),
                      ),
                    ),
                  ),
                ],
              )),
        ],
      ),
    );
  }

  Widget _customButton(
      {required onTap, required String label, required Color color}) {
    return ElevatedButton(
      onPressed: onTap,
      style: ElevatedButton.styleFrom(
        backgroundColor: color,
        minimumSize: const Size(80, 35),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16),
        ),
      ),
      child: Text(
        label,
        style: const TextStyle(color: JobColors.white),
      ),
    );
  }

  void _launchWhatsapp(context) async {
    String whatsAppUrl = "";

    String phoneNumber = '9500263355';
    String description = "Hello...";

    if (Platform.isIOS) {
      whatsAppUrl =
      'whatsapp://wa.me/$phoneNumber/?text=${Uri.parse(description)}';
    } else {
      whatsAppUrl =
      'https://wa.me/+$phoneNumber?text=${Uri.parse(description)}';
    }

    if (await canLaunch(whatsAppUrl)) {
      await launch(whatsAppUrl);
    } else {
      final snackBar = SnackBar(
        content: Text("Install WhatsApp First Please"),
      );
      ScaffoldMessenger.of(context).showSnackBar(snackBar);
    }
  }
}

class CircleImage extends StatelessWidget {
  final double? width;
  final double? height;
  final String? image;

  const CircleImage({Key? key, this.width, this.height, this.image})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    var emptyDP =
        "https://cdn.pixabay.com/photo/2015/10/05/22/37/blank-profile-picture-973460_1280.png";
    return Container(
      width: width ?? 100,
      height: height ?? 100,
      decoration: BoxDecoration(
          image: DecorationImage(
            image: NetworkImage(image ?? emptyDP),
            fit: BoxFit.cover,
          ),
          borderRadius: const BorderRadius.all(
            Radius.circular(30),
          )),
    );
  }
}
