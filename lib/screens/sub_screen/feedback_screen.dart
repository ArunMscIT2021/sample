import 'package:flutter/material.dart';
import 'package:sample/screens/sub_screen/job_finding.dart';

import '../../utils/common.dart';

class FeedbackScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Feedback'),
      ),
      body: Padding(
        padding: EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'We value your feedback!',
              style: TextStyle(
                fontSize: 24.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 20.0),
            Text(
              'Please share your thoughts and suggestions with us. We appreciate your feedback to help us improve our app.',
              style: TextStyle(fontSize: 16.0),
            ),
            SizedBox(height: 20.0),
            Text(
              'Feedback',
              style: TextStyle(
                fontSize: 18.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            TextField(
              maxLines: 5,
              decoration: InputDecoration(
                hintText: 'Enter your feedback here',
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 20.0),
            ElevatedButton(
              onPressed: () {
                Utils.showLoader(context);
                showSnackBar(context, message: 'Successfully send feedback....');

Navigator.push(context, MaterialPageRoute(builder: (_)=> JobFinding()))    ;          },
              child: Text('Submit'),
            ),
          ],
        ),
      ),
    );
  }
}
