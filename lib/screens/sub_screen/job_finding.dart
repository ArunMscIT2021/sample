import 'package:flutter/material.dart';
import 'package:sample/resources/job_res.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../utils/common.dart';
import '../../widgets/drawer.dart';
import '../../widgets/job_scrollview.dart';
import '../../widgets/reusable_app_bar.dart';
import '../company/company_data.dart';
import 'company_details.dart';

class JobFinding extends StatefulWidget {
  const JobFinding({Key? key}) : super(key: key);

  @override
  State<JobFinding> createState() => _JobFindingState();
}

class _JobFindingState extends State<JobFinding> {
  List<Map<String, dynamic>> company = [];
  bool _isLoading = true;
  String fullName = '';

  @override
  void initState() {
    super.initState();
    _refreshCompany();
    _loadProfileData();
  }

  void _loadProfileData() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      fullName = prefs.getString('fullName') ?? '';
    });
  }

  void _refreshCompany() async {
    company = await CompanyData.getItems();
    setState(() {
      _isLoading = false;
    });
  }

  void _deleteItem(int id) async {
    await CompanyData.deleteItem(id);
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text('Successfully deleted a comp!'),
      ),
    );
    _refreshCompany();
  }

  int selectedCategoryIndex = 0;

  void handleCategorySelected(int index) {
    setState(() {
      selectedCategoryIndex = index;
    });
  }

  List<String> jobCategories = [
    "All",
    "Design",
    "Software",
    "Business",
    "Real"
  ];
  String searchQuery = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: const PreferredSize(
        preferredSize: Size.fromHeight(80.0),
        child: ReusableAppBar(
          title: JobStrings.jobFinder,
          actions: true,
          leading: false,
        ),
      ),
      drawer: const HomeDrawer(),
      body: Container(
        padding: const EdgeInsets.only(left: 16.0, right: 16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              fullName,
              style: JobStyles.title,
            ),
            const Text(
              JobStrings.appSlogan,
              style: JobStyles.regularText16,
            ),
            const SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Expanded(
                  child: SizedBox(
                    height: 60,
                    child: TextFormField(
                      decoration: InputDecoration(
                        border: const OutlineInputBorder(),
                        labelText: JobStrings.job,
                        hintText: JobStrings.searchJob,
                        suffixIcon: IconButton(
                          icon: Icon(searchQuery.isNotEmpty
                              ? Icons.arrow_forward
                              : Icons.search),
                          onPressed: () {},
                        ),
                      ),
                      onChanged: (value) {
                        setState(() {
                          searchQuery = value.toLowerCase();
                        });
                      },
                    ),
                  ),
                ),
                const SizedBox(width: 10),
                InkWell(
                  onTap: _showFilterBottomSheet,
                  child: const Icon(Icons.filter_alt, size: 35),
                ),
              ],
            ),
            const SizedBox(height: 10),
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      JobStrings.jobCategories,
                      style: JobStyles.regularText16,
                    ),
                    const SizedBox(height: 10),
                    SizedBox(
                        height: 35,
                        child: ListView(
                          scrollDirection: Axis.horizontal,
                          children: List.generate(
                            jobCategories.length,
                            (index) {
                              String category = jobCategories[index];
                              bool isSelected = selectedCategoryIndex == index;

                              return JobCategories(
                                text: category,
                                isSelected: isSelected,
                                onSelected: (isSelected) {
                                  if (isSelected) {
                                    handleCategorySelected(index);
                                  }
                                },
                              );
                            },
                          ),
                        )),
                    const SizedBox(height: 20),
                    company.isNotEmpty
                        ? const Text(
                            JobStrings.recommendedJobs,
                            style: JobStyles.regularText16,
                          )
                        : const SizedBox(),
                    const SizedBox(height: 10),
                    SizedBox(
                      height: 250,
                      child: JobScrollView(
                        itemCount: company.length,
                        itemBuilder: (context, index) {
                          final comp = company[index];
                          return GestureDetector(
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (_) => CompanyDetailsScreen(
                                            companyId: comp['id'],
                                          )));
                            },
                            child: JobRecommended(
                              jobTitle: comp['title'],
                              company: comp['description'],
                              address: comp['address'],
                              jobType: comp['jobType'],
                              jobTime: comp['createdAt'].toString(),
                            ),
                          );
                        },
                      ),
                    ),
                    const SizedBox(height: 20),
                    company.isNotEmpty
                        ? const Text(
                            JobStrings.recentJob,
                            style: JobStyles.regularText16,
                          )
                        : const SizedBox(),
                    const SizedBox(height: 10),
                    SizedBox(
                      height: 800,
                      child: ListView.builder(
                        physics: const NeverScrollableScrollPhysics(),
                        scrollDirection: Axis.vertical,
                        padding: const EdgeInsets.all(0.0),
                        itemCount: company.length,
                        itemBuilder: (context, index) {
                          final comp = company[index];
                          return GestureDetector(
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (_) => CompanyDetailsScreen(
                                            companyId: comp['id'],
                                          )));
                            },
                            child: RecentJob(
                              jobTitle: comp['title'],
                              company: comp['description'],
                              address: comp['address'],
                              jobType: comp['jobType'],
                              jobTime: comp['createdAt'].toString(),
                              save: () {
                                Utils.showLoader(context); // Show loader
                                Future.delayed(const Duration(seconds: 2), () {
                                  Navigator.pop(context);
                                  showSnackBar(context,
                                      message: 'Data saved in bookmarks....');
                                });
                              },
                              delete: () {
                                int id = comp['id'];
                                _deleteItem(id);
                              },
                            ), // The widget that represents the job card view or recommended job
                          );
                        },
                      ),
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  void _showFilterBottomSheet() {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (context) => Container(
        padding: const EdgeInsets.only(left: 20, right: 20, top: 50),
        height: MediaQuery.of(context).size.height * 0.75,
        decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(25.0),
            topRight: Radius.circular(25.0),
          ),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            TextFormField(
              decoration: const InputDecoration(
                labelText: 'Filter Job Title',
                border: OutlineInputBorder(),
              ),
              onChanged: (value) {
                // Implement logic to filter job titles based on 'value'
                // and update the filtered job list on the new screen.
              },
            ),
            const SizedBox(height: 20),
            TextFormField(
              decoration: const InputDecoration(
                labelText: 'Filter Address',
                border: OutlineInputBorder(),
              ),
              onChanged: (value) {
                // Implement logic to filter addresses based on 'value'
                // and update the filtered job list on the new screen.
              },
            ),
            const SizedBox(height: 30),
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: const Text('Apply Filter'),
            )
          ],
        ),
      ),
    );
  }
}
