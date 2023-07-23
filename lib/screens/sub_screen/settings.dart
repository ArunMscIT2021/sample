import 'package:flutter/material.dart';
import 'package:sample/widgets/custom_form_button.dart';
import '../../widgets/custom_card.dart';
import '../../widgets/reusable_app_bar.dart';
import '../app_about/app_about.dart';
import '../company/company.dart';
import '../privacy/privacy.dart';
import '../user/profile.dart';

class Settings extends StatelessWidget {
  const Settings({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const PreferredSize(
        preferredSize: Size.fromHeight(80.0),
        child: ReusableAppBar(title: 'Settings'),
      ),
      body: Container(
        padding: const EdgeInsets.all(15),
        child: ListView(
          scrollDirection: Axis.vertical,
          children: [
            CustomCard(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (_) => const JobSeekerProfile(),
                    ),
                  );
                },
                leadingIcon: Icons.account_circle_rounded,
                title: 'Account Setting',
                subTitle: 'information and Password'),
            const SizedBox(height: 20),
            CustomCard(
                onTap: () {},
                leadingIcon: Icons.contactless_rounded,
                title: 'Appearance',
                subTitle: 'Check your activity'),
            const SizedBox(height: 20),
            CustomCard(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (_) => PrivacySettingsScreen()));
                },
                leadingIcon: Icons.privacy_tip_sharp,
                title: 'Privacy Setting',
                subTitle: 'Information about privacy'),
            const SizedBox(height: 20),
            CustomCard(
                onTap: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (_) => AboutScreen()));
                },
                leadingIcon: Icons.info,
                title: 'About',
                subTitle: 'about our application'),
            const SizedBox(height: 190),
            Padding(
              padding: EdgeInsets.all(20.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CustomFormButton(
                      innerText: "HR",
                      onPressed: () {
                        Navigator.push(context,
                            MaterialPageRoute(builder: (_) => const Company()));
                      }),
                  SizedBox(height: 20),
                  Text("@2023 Job finder "),
                  SizedBox(height: 15),
                  Text("Accessibility atJob finder Privacy Center Cookies"),
                  SizedBox(height: 15),
                  Text("Privacy    Terms")
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
