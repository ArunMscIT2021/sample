import 'package:flutter/material.dart';

import '../resources/job_colors.dart';


class ExploreWidget extends StatelessWidget {
  final String job;
  final String jobTheme;
  final String jobDescription;
  final VoidCallback onTap;

  const ExploreWidget(
      {Key? key,
        required this.job,
        required this.jobDescription,
        required this.jobTheme,
        required this.onTap})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        margin: const EdgeInsets.only(left: 15, right: 15, top: 8, bottom: 8),
        decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(color: JobColors.gray, spreadRadius: 0, blurRadius: 1),
          ],
          color: JobColors.white,
          borderRadius: BorderRadius.circular(8.0),
        ),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(" job title :  $job"),
              const SizedBox(height: 10),
              const Text("Theme :"),
              const SizedBox(height: 5),
              Text(jobTheme),
              const SizedBox(height: 10),
              const Text("Description :"),
              const SizedBox(height: 5),
              Text(jobDescription),
            ],
          ),
        ),
      ),
    );
  }
}
