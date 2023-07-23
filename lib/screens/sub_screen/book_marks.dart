import 'package:flutter/material.dart';
import '../../resources/job_colors.dart';
import '../../resources/job_styles.dart';
import '../../widgets/reusable_app_bar.dart';
import '../../widgets/icon_text.dart';

class BookMarks extends StatefulWidget {
  const BookMarks({Key? key}) : super(key: key);

  @override
  State<BookMarks> createState() => _BookMarksState();
}

class _BookMarksState extends State<BookMarks> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const PreferredSize(
        preferredSize: Size.fromHeight(80.0),
        child: ReusableAppBar(title: 'Book mark'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: SizedBox(
          child: ListView.builder(
            scrollDirection: Axis.vertical,
            padding: const EdgeInsets.all(0.0),
            itemCount: 14,
            itemBuilder: (context, index) {
              return Container(
                height: 150,
                padding: const EdgeInsets.all(5.0),
                margin: const EdgeInsets.all(3.0),
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  boxShadow: [
                    BoxShadow(
                        color: JobColors.gray, spreadRadius: 0, blurRadius: 1),
                  ],
                  color: JobColors.white,
                  borderRadius: BorderRadius.circular(8.0),
                ),
                child: Row(
                  children: [
                    SizedBox(
                      height: 100,
                      width: 120,
                      child: Image.asset("assets/images/profile.png",
                          fit: BoxFit.cover),
                    ),
                    const SizedBox(width: 5),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Text(job[index], style: JobStyles.regularText16),
                        SizedBox(height: 8),
                        Text(comp[index], style: JobStyles.regularText16),
                        SizedBox(height: 8),
                        Text(location[index], style: JobStyles.regularText16),
                        SizedBox(height: 10),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            IconText(
                                icon: Icons.access_time, text: "5 Min ago"),
                            IconText(
                                icon: Icons.work_history_outlined,
                                text: "Full time"),
                          ],
                        )
                      ],
                    )
                  ],
                ),
              );
            },
          ),
        ),
      ),
    );
  }

  List<String> job = [
    "Software Engineer",
    "Data Scientist",
    "Network Administrator",
    "Cybersecurity Analyst",
    "UI/UX Designer",
    "Database Administrator",
    "Cloud Architect",
    "IT Project Manager",
    "DevOps Engineer",
    "IT Support Specialist",
    "Systems Analyst",
    "Full Stack Developer",
    "IT Consultant",
    "AI Engineer",
    "IT Trainer"
  ];

  List<String> location = [
    "Mumbai",
    "Delhi",
    "Bangalore",
    "Hyderabad"
        "Chennai",
    "Kolkata",
    "Ahmedabad",
    "Pune",
    "Jaipur",
    "Lucknow",
    "Surat",
    "Kanpur",
    "Nagpur",
    "Indore",
    "Visakhapatnam",
    "chennai"
  ];

  List<String> comp = [
    "Tata Consultancy Services",
    "Infosys",
    "Wipro",
    "HCL Technologies",
    "Tech Mahindra",
    "Accenture",
    "Cognizant",
    "IBM India",
    "Capgemini",
    "Oracle India",
    "Microsoft India",
    "Amazon India",
    "Flipkart",
    "Reliance Industries",
    "Aditya Birla Group"
  ];
}
