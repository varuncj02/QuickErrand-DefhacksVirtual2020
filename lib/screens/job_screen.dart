import 'package:flutter/material.dart';
import '../models/job.dart';
import '../dummydata.dart';

class JobScreen extends StatefulWidget {
  static const routeName = '/JobScreen';
  @override
  _JobScreenState createState() => _JobScreenState();
}

class _JobScreenState extends State<JobScreen> {
  List<Job> jobData = DUMMY_JOBS;

  @override
  Widget build(BuildContext context) {
    final jobId = ModalRoute.of(context).settings.arguments as String;
    final selectedJob = DUMMY_JOBS.firstWhere((job) => job.jobID == jobId);

    return Scaffold(
      appBar: AppBar(title: Text("Job Details")),
      body: Column(children: [
        Text(selectedJob.jobTitle,
            textAlign: TextAlign.center,
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 25
            )),
            Text('${"Posted by " + selectedJob.userName}',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 16
            ))
      ]),
    );
  }
}
