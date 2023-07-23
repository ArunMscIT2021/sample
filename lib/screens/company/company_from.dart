import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:sample/resources/job_res.dart';
import 'package:sample/utils/extensions.dart';
import '../../widgets/custom_form_button.dart';
import '../../widgets/custom_input_field.dart';
import '../../widgets/custom_text.dart';
import '../home/home_screen.dart';
import '../sub_screen/job_finding.dart';

class CompanyForm extends StatefulWidget {
  final Map<String, dynamic> comp;
  final Function(Map<String, dynamic>) onSubmit;

  const CompanyForm({
    Key? key,
    required this.comp,
    required this.onSubmit,
  }) : super(key: key);

  @override
  State<CompanyForm> createState() => _CompanyFormState();
}

class _CompanyFormState extends State<CompanyForm> {
  // late final NotificationService notificationService;

  static const AndroidNotificationChannel channel = AndroidNotificationChannel(
      'high_importance_channel', // id
      'High Importance Notifications', // title
      description:
          'This channel is used for important notifications.', // description
      importance: Importance.high,
      playSound: true);
  final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
      FlutterLocalNotificationsPlugin();
  late TextEditingController _titleController;
  late TextEditingController _descriptionController;
  late TextEditingController _addressController;
  late TextEditingController _jobTypeController;
  late TextEditingController _companyProfileController;
  late TextEditingController _requirementsController;
  late TextEditingController _contactNameController;
  late TextEditingController _emailController;
  late TextEditingController _mobileController;

  @override
  initState() {
    super.initState();
    // notificationService = NotificationService();
show();
    _titleController = TextEditingController(text: widget.comp['title']);
    _descriptionController =
        TextEditingController(text: widget.comp['description']);
    _addressController = TextEditingController(text: widget.comp['address']);
    _jobTypeController = TextEditingController(text: widget.comp['jobType']);
    _companyProfileController =
        TextEditingController(text: widget.comp['companyProfile']);
    _requirementsController =
        TextEditingController(text: widget.comp['requirements']);
    _contactNameController =
        TextEditingController(text: widget.comp['contactName']);
    _emailController = TextEditingController(text: widget.comp['email']);
    _mobileController = TextEditingController(text: widget.comp['mobile']);
  }

  @override
  void dispose() {
    _titleController.dispose();
    _descriptionController.dispose();
    _addressController.dispose();
    _jobTypeController.dispose();
    _companyProfileController.dispose();
    _requirementsController.dispose();
    _contactNameController.dispose();
    _emailController.dispose();
    _mobileController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: EdgeInsets.only(
        bottom: MediaQuery.of(context).viewInsets.bottom,
      ),
      child: Container(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              widget.comp['id'] != null ? 'Edit Company' : 'Add Company',
              style: const TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 10),
            CustomInputField(
              label: 'Title',
              hintText: 'Enter job title',
              validator: (value) {
                if (value!.isEmpty) {
                  return 'Please enter a job title';
                }
                return null;
              },
              keyboardType: TextInputType.text,
              controller: _titleController,
            ),
            const SizedBox(height: 10),
            CustomInputField(
              label: 'Description',
              hintText: 'Enter job description',
              validator: (value) {
                if (value!.isEmpty) {
                  return 'Please enter a job description';
                }
                return null;
              },
              keyboardType: TextInputType.text,
              controller: _descriptionController,
            ),
            const SizedBox(height: 10),
            CustomInputField(
              label: 'Address',
              hintText: 'Enter job address',
              validator: (value) {
                if (value!.isEmpty) {
                  return 'Please enter a job address';
                }
                return null;
              },
              keyboardType: TextInputType.text,
              controller: _addressController,
            ),
            const SizedBox(height: 10),
            CustomInputField(
              label: 'Job Type',
              hintText: 'Enter job type',
              validator: (value) {
                if (value!.isEmpty) {
                  return 'Please enter a job type';
                }
                return null;
              },
              keyboardType: TextInputType.text,
              controller: _jobTypeController,
            ),
            const SizedBox(height: 10),
            CustomInputField(
              label: 'Company Profile',
              hintText: 'Enter company profile',
              validator: (value) {
                if (value!.isEmpty) {
                  return 'Please enter a company profile';
                }
                return null;
              },
              keyboardType: TextInputType.text,
              controller: _companyProfileController,
            ),
            const SizedBox(height: 10),
            CustomInputField(
              label: 'Requirements',
              hintText: 'Enter job requirements',
              validator: (value) {
                if (value!.isEmpty) {
                  return 'Please enter job requirements';
                }
                return null;
              },
              keyboardType: TextInputType.text,
              controller: _requirementsController,
            ),
            const SizedBox(height: 10),
            const CustomText(
              'Contact Information',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 10),
            CustomInputField(
              label: 'Contact Name',
              hintText: 'Enter contact name',
              validator: (value) {
                if (value!.isEmpty) {
                  return 'Please enter a contact name';
                }
                return null;
              },
              keyboardType: TextInputType.text,
              controller: _contactNameController,
            ),
            const SizedBox(height: 10),
            CustomInputField(
              label: 'Email',
              hintText: 'Enter email address',
              validator: (value) {
                if (value!.isEmpty) {
                  return 'Please enter an email address';
                }
                return null;
              },
              keyboardType: TextInputType.emailAddress,
              controller: _emailController,
            ),
            const SizedBox(height: 10),
            CustomInputField(
              label: 'Mobile',
              hintText: 'Enter mobile number',
              validator: (value) {
                if (value!.isEmpty) {
                  return 'Please enter a mobile number';
                }
                return null;
              },
              keyboardType: TextInputType.phone,
              controller: _mobileController,
            ),
            const SizedBox(height: 20),
            CustomFormButton(
              onPressed: () async {
                final comp = {
                  'title': _titleController.text,
                  'description': _descriptionController.text,
                  'address': _addressController.text,
                  'jobType': _jobTypeController.text,
                  'companyProfile': _companyProfileController.text,
                  'requirements': _requirementsController.text,
                  'contactName': _contactNameController.text,
                  'email': _emailController.text,
                  'mobile': _mobileController.text,
                };

                context.showCustomDialog(
                  "Added Company details",
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      const SizedBox(height: 20),
                      Text(comp['title'].toString(),
                          style: JobStyles.regularText16),
                      const SizedBox(height: 20),
                      const Text("Please look up the job! Your favorite job!",
                          style: JobStyles.regularText16),
                      const SizedBox(height: 20),
                    ],
                  ),
                );
                showNotification();

                widget.onSubmit(comp);
              },
              innerText: widget.comp['id'] != null ? 'Update' : 'Add',
            ),
          ],
        ),
      ),
    );
  }

  void showNotification() {
    flutterLocalNotificationsPlugin.show(
        0,
        "Testing Notification",
        "This notification comes all the time of opening app",
        NotificationDetails(
            android: AndroidNotificationDetails(channel.id, channel.name,
                channelDescription: channel.description,
                importance: Importance.high,
                color: Colors.blue,
                priority: Priority.high,
                playSound: true,
                icon: '@mipmap/ic_launcher')));
  }
  show()async{
    await flutterLocalNotificationsPlugin
        .resolvePlatformSpecificImplementation<
        AndroidFlutterLocalNotificationsPlugin>()
        ?.createNotificationChannel(channel);
  }
}
