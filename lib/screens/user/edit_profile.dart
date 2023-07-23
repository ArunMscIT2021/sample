import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'profile.dart';

class JobSeekerProfileEdit extends StatefulWidget {
  const JobSeekerProfileEdit({super.key});

  @override
  State<JobSeekerProfileEdit> createState() => _JobSeekerProfileEditState();
}

class _JobSeekerProfileEditState extends State<JobSeekerProfileEdit> {
  TextEditingController fullNameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController phoneNumberController = TextEditingController();
  TextEditingController addressController = TextEditingController();
  TextEditingController cityController = TextEditingController();
  TextEditingController stateController = TextEditingController();
  TextEditingController zipCodeController = TextEditingController();
  TextEditingController degreeController = TextEditingController();
  TextEditingController institutionController = TextEditingController();
  TextEditingController fieldOfStudyController = TextEditingController();
  TextEditingController graduationYearController = TextEditingController();
  TextEditingController companyNameController = TextEditingController();
  TextEditingController jobTitleController = TextEditingController();
  TextEditingController employmentPeriodController = TextEditingController();
  TextEditingController responsibilitiesController = TextEditingController();
  TextEditingController skillsController = TextEditingController();
  TextEditingController professionalSummaryController = TextEditingController();
  TextEditingController certificationsController = TextEditingController();
  TextEditingController languagesController = TextEditingController();
  TextEditingController linkedinProfileController = TextEditingController();
  TextEditingController portfolioController = TextEditingController();

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
              TextFormField(
                controller: fullNameController,
                decoration: const InputDecoration(labelText: 'Full Name'),
              ),
              TextFormField(
                controller: emailController,
                decoration: const InputDecoration(labelText: 'Email'),
              ),
              TextFormField(
                controller: phoneNumberController,
                decoration: const InputDecoration(labelText: 'Phone Number'),
              ),
              TextFormField(
                controller: addressController,
                decoration: const InputDecoration(labelText: 'Address'),
              ),
              TextFormField(
                controller: cityController,
                decoration: const InputDecoration(labelText: 'City'),
              ),
              TextFormField(
                controller: stateController,
                decoration: const InputDecoration(labelText: 'State'),
              ),
              TextFormField(
                controller: zipCodeController,
                decoration: const InputDecoration(labelText: 'Zip Code'),
              ),
              const SizedBox(height: 16),
              const Text(
                'Education',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              TextFormField(
                controller: degreeController,
                decoration:
                    const InputDecoration(labelText: 'Highest Degree Attained'),
              ),
              TextFormField(
                controller: institutionController,
                decoration: const InputDecoration(labelText: 'Institution'),
              ),
              TextFormField(
                controller: fieldOfStudyController,
                decoration: const InputDecoration(labelText: 'Field of Study'),
              ),
              TextFormField(
                controller: graduationYearController,
                decoration: const InputDecoration(labelText: 'Graduation Year'),
              ),
              const SizedBox(height: 16),
              const Text(
                'Work Experience',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              TextFormField(
                controller: companyNameController,
                decoration: const InputDecoration(labelText: 'Company Name'),
              ),
              TextFormField(
                controller: jobTitleController,
                decoration: const InputDecoration(labelText: 'Job Title'),
              ),
              TextFormField(
                controller: employmentPeriodController,
                decoration:
                    const InputDecoration(labelText: 'Employment Period'),
              ),
              TextFormField(
                controller: responsibilitiesController,
                decoration:
                    const InputDecoration(labelText: 'Responsibilities'),
              ),
              const SizedBox(height: 16),
              const Text(
                'Skills',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              TextFormField(
                controller: skillsController,
                decoration: const InputDecoration(labelText: 'Skills'),
              ),
              const SizedBox(height: 16),
              const Text(
                'Professional Summary',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              TextFormField(
                controller: professionalSummaryController,
                decoration:
                    const InputDecoration(labelText: 'Professional Summary'),
                maxLines: 5,
              ),
              const SizedBox(height: 16),
              const Text(
                'Additional Information',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              TextFormField(
                controller: certificationsController,
                decoration: const InputDecoration(labelText: 'Certifications'),
              ),
              TextFormField(
                controller: languagesController,
                decoration: const InputDecoration(labelText: 'Languages'),
              ),
              TextFormField(
                controller: linkedinProfileController,
                decoration:
                    const InputDecoration(labelText: 'LinkedIn Profile'),
              ),
              TextFormField(
                controller: portfolioController,
                decoration:
                    const InputDecoration(labelText: 'Portfolio/Website'),
              ),
              const SizedBox(height: 16),
              ElevatedButton(
                onPressed: () async {
                  SharedPreferences prefs =
                      await SharedPreferences.getInstance();
                  await prefs.setString('fullName', fullNameController.text);
                  await prefs.setString('email', emailController.text);
                  await prefs.setString(
                      'phoneNumber', phoneNumberController.text);
                  await prefs.setString('address', addressController.text);
                  await prefs.setString('city', cityController.text);
                  await prefs.setString('state', stateController.text);
                  await prefs.setString('zipCode', zipCodeController.text);
                  await prefs.setString('degree', degreeController.text);
                  await prefs.setString(
                      'institution', institutionController.text);
                  await prefs.setString(
                      'fieldOfStudy', fieldOfStudyController.text);
                  await prefs.setString(
                      'graduationYear', graduationYearController.text);
                  await prefs.setString(
                      'companyName', companyNameController.text);
                  await prefs.setString('jobTitle', jobTitleController.text);
                  await prefs.setString(
                      'responsibilities', responsibilitiesController.text);
                  await prefs.setString('skills', skillsController.text);
                  await prefs.setString('professionalSummary',
                      professionalSummaryController.text);
                  await prefs.setString(
                      'certifications', certificationsController.text);
                  await prefs.setString('languages', languagesController.text);
                  await prefs.setString(
                      'linkedinProfile', linkedinProfileController.text);
                  await prefs.setString('portfolio', portfolioController.text);

                  // Save the rest of the data to shared preferences

                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (_) => JobSeekerProfile(),
                    ),
                  );
                },
                child: const Text('Save/Update Profile'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
