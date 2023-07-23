import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../resources/job_colors.dart';

class CustomCard extends StatelessWidget {
  final IconData leadingIcon;
  final String title;
  final String subTitle;
  final VoidCallback onTap;

  const CustomCard(
      {Key? key,
      required this.leadingIcon,
      required this.title,
      required this.subTitle,
      required this.onTap})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Card(
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  const SizedBox(width: 5),
                  Icon(leadingIcon, size: 40, color: JobColors.appColor),
                  const SizedBox(width: 20),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        title,
                        style: const TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 16,
                            color: JobColors.appColor),
                      ),
                      Text(
                        subTitle,
                        style: const TextStyle(
                            fontWeight: FontWeight.normal,
                            fontSize: 15,
                            color: JobColors.gray),
                      ),
                    ],
                  ),
                ],
              ),
              const SizedBox(width: 25),
              const Icon(Icons.arrow_forward_ios_outlined)
            ],
          ),
        ),
      ),
    );
  }
}
