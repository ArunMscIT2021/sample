import 'package:flutter/material.dart';
import '../resources/job_colors.dart';
import '../resources/job_styles.dart';
import 'icon_text.dart';

class JobScrollView extends StatelessWidget {
  final int itemCount;
  final NullableIndexedWidgetBuilder itemBuilder;

  const JobScrollView(
      {Key? key, required this.itemCount, required this.itemBuilder})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      scrollDirection: Axis.horizontal,
      padding: const EdgeInsets.all(0.0),
      itemCount: itemCount,
      itemBuilder: itemBuilder,
    );
  }
}

class JobCategories extends StatefulWidget {
  final String text;
  final bool isSelected;
  final ValueChanged<bool> onSelected;

  const JobCategories({
    Key? key,
    required this.text,
    required this.isSelected,
    required this.onSelected,
  }) : super(key: key);

  @override
  _JobCategoriesState createState() => _JobCategoriesState();
}

class _JobCategoriesState extends State<JobCategories> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        if (!widget.isSelected) {
          widget.onSelected(true);
        }
      },
      child: Container(
        width: 80,
        padding: const EdgeInsets.only(left: 8.0, right: 8.0),
        margin: const EdgeInsets.all(3.0),
        alignment: Alignment.center,
        decoration: BoxDecoration(
          border: Border.all(width: 1, color: JobColors.gray),
          color: widget.isSelected ? JobColors.appColor : JobColors.white,
          borderRadius: BorderRadius.circular(16),
        ),
        child: Text(
          widget.text,
          style: TextStyle(
            color: widget.isSelected ? JobColors.white : JobColors.duelBlack,
          ),
        ),
      ),
    );
  }
}

class JobRecommended extends StatelessWidget {
  final String? jobTitle;
  final String? company;
  final String? address;
  final String? jobType;
  final String jobTime;

  const JobRecommended({
    Key? key,
    required this.jobTitle,
    required this.company,
    required this.address,
    required this.jobType,
    required this.jobTime,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(8.0),
      margin: const EdgeInsets.all(3.0),
      alignment: Alignment.center,
      decoration: BoxDecoration(
        boxShadow: const [
          BoxShadow(
            color: JobColors.gray,
            spreadRadius: 0,
            blurRadius: 1,
            offset: Offset(1.5, 1.5),
          ),
        ],
        color: JobColors.white,
        borderRadius: BorderRadius.circular(8.0),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 20.0),
            child: SizedBox(
              height: 100,
              width: 200,
              child: Image.asset("assets/images/settings.png"),
            ),
          ),
          const SizedBox(height: 8),
          Text(
            jobTitle!,
            style: JobStyles.regularText16,
          ),
          const SizedBox(height: 8),
          Text(company!, style: JobStyles.regularText13),
          const SizedBox(height: 8),
          Text(address!, style: JobStyles.regularText13),
          const Divider(
            color: JobColors.gray,
            height: 5,
            thickness: 3,
            indent: 25,
            endIndent: 25,
          ),
          Row(
            children: [
              IconText(icon: Icons.access_time, text: jobTime),
              const SizedBox(width: 10),
              IconText(icon: Icons.work_history_outlined, text: jobType!),
            ],
          )
        ],
      ),
    );
  }
}

class RecentJob extends StatelessWidget {
  final String? jobTitle;
  final String? company;
  final String? address;
  final String? jobType;
  final String jobTime;
  final VoidCallback? save;
  final VoidCallback? delete;

  const RecentJob(
      {Key? key,
      this.jobTitle,
      this.company,
      this.address,
      this.jobType,
      this.save,
      this.delete,
      required this.jobTime})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        height: 150,
        padding: const EdgeInsets.all(5.0),
        margin: const EdgeInsets.all(3.0),
        alignment: Alignment.center,
        decoration: BoxDecoration(
          boxShadow: const [
            BoxShadow(
              color: JobColors.gray,
              spreadRadius: 0,
              blurRadius: 1,
              offset: Offset(1.5, 1.5),
            ),
          ],
          color: JobColors.white,
          borderRadius: BorderRadius.circular(8.0),
        ),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                SizedBox(
                  height: 100,
                  width: 120,
                  child: Image.asset(
                    "assets/images/profile.png",
                    fit: BoxFit.cover,
                  ),
                ),
                const SizedBox(width: 10),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Text(
                      jobTitle!,
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 16.0,
                      ),
                    ),
                    SizedBox(height: 8),
                    Text(
                      company!,
                      style: TextStyle(
                        fontWeight: FontWeight.w500,
                        fontSize: 16.0,
                      ),
                    ),
                    SizedBox(height: 8),
                    Text(
                      address!,
                      style: TextStyle(
                          fontWeight: FontWeight.w500, fontSize: 16.0),
                    ),
                    SizedBox(height: 10),
                  ],
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    IconButton(
                      onPressed: save,
                      icon: const Icon(Icons.bookmark),
                    ),
                    const SizedBox(height: 5),
                    IconButton(
                      onPressed: delete,
                      icon: const Icon(Icons.block_outlined),
                    )
                  ],
                )
              ],
            ),
            const SizedBox(height: 15),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                IconText(icon: Icons.access_time, text: jobTime),
                IconText(icon: Icons.work_history_outlined, text: jobType!),
              ],
            )
          ],
        ));
  }
}
