import 'package:flutter/material.dart';

import '../screens/user/profile.dart';
import '../utils/job_route.dart';

class ReusableAppBar extends StatelessWidget {
  final String title;
  final bool actions;
  final bool? leading;

  const ReusableAppBar({super.key, required this.title, this.actions = false, this.leading = true});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      leading: leading! ? IconButton(
        onPressed: () => Navigator.pushReplacementNamed(context, JobRoute.home),
        icon: const Icon(Icons.arrow_back),
      ) : null,
      title: Text(
        title,
        style: TextStyle(
            color: Theme.of(context).primaryColor,
            fontSize: 25,
            fontWeight: FontWeight.w600),
      ),
      centerTitle: true,
      actions: [
        actions
            ? InkWell(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (_) => JobSeekerProfile()));                },
                child: Container(
                  margin: const EdgeInsets.all(8.0),
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    border: Border.all(width: 1, color: Colors.grey),
                  ),
                  height: 50,
                  width: 50,
                  child: const CircleAvatar(
                    backgroundImage: NetworkImage("https://cdn.pixabay.com/photo/2015/10/05/22/37/blank-profile-picture-973460_1280.png"),
                  ),
                ),
              )
            : const SizedBox()
      ],
      backgroundColor: Colors.white,
    );
  }
}
