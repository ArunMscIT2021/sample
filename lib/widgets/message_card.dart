
import 'package:flutter/material.dart';

import '../resources/job_colors.dart';

class MessageCard extends StatelessWidget {
  final VoidCallback onTap;
  final String? profile;

  final String userName;
  final String userMessage;
  final String lastTime;
  final String countMgs;

  const MessageCard(
      {Key? key,
        required this.onTap,
        required this.userName,
        required this.userMessage,
        required this.lastTime,
        required this.countMgs,
        this.profile})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Container(
            margin: const EdgeInsets.all(5.0),
            decoration: const BoxDecoration(
              shape: BoxShape.circle,
            ),
            height: 50,
            width: 50,
            child: CircleAvatar(
              backgroundImage:
              AssetImage(profile ?? "assets/images/image.jpg"),
            ),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                userName,
                style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: JobColors.duelBlack),
              ),
              Text(
                userMessage,
                style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.normal,
                    color: JobColors.gray),
              ),
            ],
          ),
          const SizedBox(width: 50),
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text(
                lastTime,
                style: const TextStyle(fontSize: 15, color: JobColors.gray),
              ),
              const SizedBox(height: 10),
              Container(
                  decoration: const BoxDecoration(
                      shape: BoxShape.circle, color: Colors.greenAccent),
                  height: 20,
                  width: 20,
                  child: Center(
                    child: Text(
                      countMgs,
                      style: const TextStyle(color: JobColors.white),
                    ),
                  ))
            ],
          ),
        ],
      ),
    );
  }
}
