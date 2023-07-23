import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../resources/job_styles.dart';
import 'edit_profile.dart';

import 'package:shared_preferences/shared_preferences.dart';

class JobSeekerProfile extends StatefulWidget {
  const JobSeekerProfile({Key? key}) : super(key: key);

  @override
  _JobSeekerProfileState createState() => _JobSeekerProfileState();
}

class _JobSeekerProfileState extends State<JobSeekerProfile> {
  String fullName = '';
  String email = '';
  String phoneNumber = '';
  String address = '';
  String city = '';
  String state = '';
  String zipCode = '';
  String degree = '';
  String institution = '';
  String fieldOfStudy = '';
  String graduationYear = '';
  String companyName = '';
  String jobTitle = '';
  String employmentPeriod = '';
  String responsibilities = '';
  String skills = '';
  String professionalSummary = '';
  String certifications = '';
  String languages = '';
  String linkedinProfile = '';
  String portfolio = '';

  @override
  void initState() {
    super.initState();
    _loadProfileData();
  }

  void _loadProfileData() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      fullName = prefs.getString('fullName') ?? '';
      email = prefs.getString('email') ?? '';
      phoneNumber = prefs.getString('phoneNumber') ?? '';
      address = prefs.getString('address') ?? '';
      city = prefs.getString('city') ?? '';
      state = prefs.getString('state') ?? '';
      zipCode = prefs.getString('zipCode') ?? '';
      degree = prefs.getString('degree') ?? '';
      institution = prefs.getString('institution') ?? '';
      fieldOfStudy = prefs.getString('fieldOfStudy') ?? '';
      graduationYear = prefs.getString('graduationYear') ?? '';
      companyName = prefs.getString('companyName') ?? '';
      jobTitle = prefs.getString('jobTitle') ?? '';
      employmentPeriod = prefs.getString('employmentPeriod') ?? '';
      responsibilities = prefs.getString('responsibilities') ?? '';
      skills = prefs.getString('skills') ?? '';
      professionalSummary = prefs.getString('professionalSummary') ?? '';
      certifications = prefs.getString('certifications') ?? '';
      languages = prefs.getString('languages') ?? '';
      linkedinProfile = prefs.getString('linkedinProfile') ?? '';
      portfolio = prefs.getString('portfolio') ?? '';
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Job Seeker Profile'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Center(
                child: Text(
                  'Personal Information',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              const SizedBox(height: 16),
              const Center(
                child: CircleAvatar(
                  radius: 50,
                  backgroundImage: AssetImage('assets/images/image.jpg'),
                ),
              ),
              const SizedBox(height: 16),
              Text('Full Name : $fullName',style:JobStyles.regularText16),
              Text('Email : $email',style:JobStyles.regularText16),
              Text('Phone Number  : $phoneNumber',style:JobStyles.regularText16),
              Text('Address : $address',style:JobStyles.regularText16),
              Text('City  : $city',style:JobStyles.regularText16),
              Text('State : $state',style:JobStyles.regularText16),
              Text('Zip Code   : $zipCode',style:JobStyles.regularText16),
              const SizedBox(height: 16),
              const Text(
                'Education',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text('Highest Degree Attained : $degree',style:JobStyles.regularText16),
              Text('Institution : $institution',style:JobStyles.regularText16),
              Text('Field of Study  : $fieldOfStudy',style:JobStyles.regularText16),
              Text('Graduation Year : $graduationYear',style:JobStyles.regularText16),
              const SizedBox(height: 16),
              const Text(
                'Work Experience',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text('Company Name  : $companyName',style:JobStyles.regularText16),
              Text('Job Title : $jobTitle',style:JobStyles.regularText16),
              Text('Employment Period : $employmentPeriod',style:JobStyles.regularText16),
              Text('Responsibilities  : $responsibilities',style:JobStyles.regularText16),
              const SizedBox(height: 16),
              const Text(
                'Skills',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text('Skills: $skills',style:JobStyles.regularText16),
              const SizedBox(height: 16),
              const Text(
                'Professional Summary',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text('Professional Summary  : $professionalSummary',style:JobStyles.regularText16),
              const SizedBox(height: 16),
              const Text(
                'Additional Information',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text('Certifications   : $certifications',style:JobStyles.regularText16),
              Text('Languages : $languages',style:JobStyles.regularText16),
              Text('LinkedIn Profile   : $linkedinProfile',style:JobStyles.regularText16),
              Text('Portfolio/Website : $portfolio',style:JobStyles.regularText16),
              const SizedBox(height: 16),
              ElevatedButton(
                onPressed: () async {
                  SharedPreferences prefs =
                  await SharedPreferences.getInstance();
                  await prefs.setString('fullName', fullName);
                  await prefs.setString('email', email);
                  await prefs.setString('phoneNumber', phoneNumber);
                  await prefs.setString('address', address);
                  await prefs.setString('city', city);
                  await prefs.setString('state', state);
                  await prefs.setString('zipCode', zipCode);
                  await prefs.setString('degree', degree);
                  await prefs.setString('institution', institution);
                  await prefs.setString('fieldOfStudy', fieldOfStudy);
                  await prefs.setString('graduationYear', graduationYear);
                  await prefs.setString('companyName', companyName);
                  await prefs.setString('jobTitle', jobTitle);
                  await prefs.setString('employmentPeriod', employmentPeriod);
                  await prefs.setString('responsibilities', responsibilities);
                  await prefs.setString('skills', skills);
                  await prefs.setString('professionalSummary', professionalSummary);
                  await prefs.setString('certifications', certifications);
                  await prefs.setString('languages', languages);
                  await prefs.setString('linkedinProfile', linkedinProfile);
                  await prefs.setString('portfolio', portfolio);

                  // Save the rest of the data to shared preferences

                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (_) => JobSeekerProfileEdit(),
                    ),
                  );
                },
                child: const Text('Edit Profile'),
              ),
            ],
          ),
        ),
      ),
    );
  }


}
