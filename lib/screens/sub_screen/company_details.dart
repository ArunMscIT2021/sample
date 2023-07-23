import 'package:flutter/material.dart';
import 'package:sample/resources/job_res.dart';

import '../../widgets/custom_text.dart';
import '../company/company_data.dart';

class CompanyDetailsScreen extends StatelessWidget {
  final int companyId;

  const CompanyDetailsScreen({required this.companyId, Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Company Details'),
      ),
      body: FutureBuilder<List<Map<String, dynamic>>>(
        future: CompanyData.getItem(companyId),
        builder: (context, snapshot) {
          if (snapshot.hasData && snapshot.data!.isNotEmpty) {
            final company = snapshot.data![0];
            return Padding(
              padding: const EdgeInsets.all(15.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "COMPANY",
                    style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
            SizedBox(height: 15,),
            Padding(
              padding: const EdgeInsets.only(left: 10.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'COMPANY NAME : ${company['title']}',
                    style: JobStyles.regularText16,
                  ),
                  SizedBox(height: 15),

                  Text(
                    'DESCRIPTION : ${company['description']}',
                    style: JobStyles.regularText16,
                  ),
                  SizedBox(height: 15),

                  Text(
                    'COMPANY ADDRESS : ${company['address']}',
                    style: JobStyles.regularText16,
                  ),
                  SizedBox(height: 15),

                  Text(
                    'JOB TYPE: ${company['jobType']}',
                    style: JobStyles.regularText16,
                  ),
                  SizedBox(height: 15),

                  Text(
                    'COMPANY PROFILE: ${company['companyProfile']}',
                    style: JobStyles.regularText16,
                  ),
                  SizedBox(height: 15),

                  Text(
                    'REQUIREMENT: ${company['requirements']}',
                    style: JobStyles.regularText16,
                  ),

                ],
              ),
            ),
                  SizedBox(height: 50),

                  const CustomText(
                    'Contact Information',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),

               Padding(
                 padding: const EdgeInsets.only(left: 10.0),
                 child: Column(
                   mainAxisAlignment: MainAxisAlignment.spaceAround,
                   crossAxisAlignment: CrossAxisAlignment.start,
                   children: [
                     SizedBox(height: 15),

                     Text(
                       'CONTACT NAME : ${company['contactName']}',
                       style: JobStyles.regularText16,
                     ),
                     SizedBox(height: 15),

                     Text(
                       'EMAIL: ${company['email']}',
                       style: JobStyles.regularText16,
                     ),
                     SizedBox(height: 15),

                     Text(
                       'MOBILE: ${company['mobile']}',
                       style: JobStyles.regularText16,
                     ),
                     SizedBox(height: 15),
                   ],
                 ),
               )

                ],
              ),
            );
          } else if (snapshot.hasError) {
            return const Text('Error retrieving company details');
          } else {
            return const CircularProgressIndicator();
          }
        },
      ),
    );
  }
}
