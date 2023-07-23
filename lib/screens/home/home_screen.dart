import 'package:flutter/material.dart';
import '../../resources/job_colors.dart';
import '../../widgets/bottom_nav_icon.dart';
import '../sub_screen/book_marks.dart';
import '../sub_screen/explore.dart';
import '../sub_screen/job_finding.dart';
import '../sub_screen/messages.dart';
import '../sub_screen/settings.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int pageIndex = 0;

  final pages = [
    const JobFinding(),
    const Explore(),
    const BookMarks(), // Provide the 'savedJobs' parameter
    const Settings()
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: pages[pageIndex],
      bottomNavigationBar: bottomNavBar(),
    );
  }

  Widget bottomNavBar() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        BottomNavigationIcon(
          onTap: () {
            setState(() {
              pageIndex = 0;
            });
          },
          icon: pageIndex == 0 ? Icons.work_rounded : Icons.home_outlined,
          color: pageIndex == 0 ? JobColors.appColor : JobColors.gray,
        ),
        BottomNavigationIcon(
          onTap: () {
            setState(() {
              pageIndex = 1;
            });
          },
          icon: pageIndex == 1 ? Icons.explore : Icons.explore_outlined,
          color: pageIndex == 1 ? JobColors.appColor : JobColors.gray,
        ),
        BottomNavigationIcon(
          onTap: () {
            setState(() {
              pageIndex = 2;
            });
          },
          icon: pageIndex == 2 ? Icons.bookmark : Icons.bookmark_border,
          color: pageIndex == 2 ? JobColors.appColor : JobColors.gray,
        ),
        BottomNavigationIcon(
          onTap: () {
            setState(() {
              pageIndex = 3;
            });
          },
          icon: pageIndex == 3 ? Icons.settings : Icons.settings_outlined,
          color: pageIndex == 3 ? JobColors.appColor : JobColors.gray,
        ),
      ],
    );
  }
}
