import 'package:flutter/material.dart';

import '../../utils/job_route.dart';
import '../../widgets/explore_widget.dart';
import '../../widgets/reusable_app_bar.dart';

class Explore extends StatefulWidget {
  const Explore({Key? key}) : super(key: key);

  @override
  State<Explore> createState() => _ExploreState();
}

class _ExploreState extends State<Explore> {
  List<String> job = [
    "Flutter developer",
    "Android developer",
    "IOS developer",
    "network eng",
    "web developer",
    "script writer",
    "project manager",
    "data analytic",
    "testing",
    "Api Developer"
  ];

  List<String> theme = [
    " Mobile App Development",
    " Mobile App Development",
    " Mobile App Development",
    "Network Engineering",
    "Web Development",
    "Script Writing",
    "Project Management",
    "Data Analytics",
    "Testing",
    "API Development"
  ];

  List<String> dis = [
    " Developing mobile applications using the Flutter framework.",
    " Designing and developing Android applications in  Android framework.",
    " Developing mobile applications using the IOS framework.",
    "Designing, implementing, and managing computer networks to ensure efficient and secure data transmission.",
    "Creating and maintaining websites using programming languages such as HTML, CSS, and JavaScript, and frameworks like React or Angular.",
    "Crafting compelling scripts for various media formats, including films, TV shows, commercials, and videos.",
    "Planning, organizing, and overseeing projects to ensure they are completed on time, within budget, and meet the desired goals and objectives.",
    "Analyzing and interpreting large sets of data to uncover meaningful insights and trends, and providing recommendations for data-driven decision-making.",
    "Conducting thorough quality assurance and testing processes to identify and resolve software bugs and ensure optimal performance and user experience.",
    "Building and maintaining application programming interfaces (APIs) that enable efficient communication and data exchange between different software systems."
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: const PreferredSize(
          preferredSize: Size.fromHeight(80.0),
          child: ReusableAppBar(title: 'Explore'),
        ),
        body: ListView.builder(
          scrollDirection: Axis.vertical,
          padding: const EdgeInsets.all(0.0),
          itemCount: job.length,
          itemBuilder: (context, index) {
            return ExploreWidget(
                onTap: () {},
                job: job[index],
                jobTheme: " flutter ui sample data this",
                jobDescription: " sample data we added this job description  ");
          },
        ));
  }
}
