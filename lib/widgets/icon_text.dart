import 'package:flutter/cupertino.dart';
import '../resources/job_colors.dart';
import '../resources/job_styles.dart';

class IconText extends StatelessWidget {
  final IconData icon;
  final String text;

  const IconText({
    Key? key,
    required this.icon,
    required this.text,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(
          icon,
          size: 24,
          color: JobColors.appColor,
        ),
        const SizedBox(width: 5.0),
        Text(text, style: JobStyles.regularText12)
      ],
    );
  }
}
