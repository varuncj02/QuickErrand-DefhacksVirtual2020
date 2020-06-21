import 'package:flutter/material.dart';
import 'package:helloworld/screens/accepted.dart';
import 'package:helloworld/screens/completed_job_details.dart';
import 'package:helloworld/screens/job_screen.dart';
import 'package:helloworld/screens/tabs_screen.dart';
import './screens/job_list_screen.dart';
import './dummydata.dart';
import './models/job.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  List<Job> jobData = DUMMY_JOBS;

  List<Job> acceptedJobs = [];

   void _acceptJob(String jobId) {
    final existingIndex =
        acceptedJobs.indexWhere((job) => job.jobID == jobId);
    if (existingIndex >= 0) {
      setState(() {
        acceptedJobs.removeAt(existingIndex);
      });
    } else {
      setState(() {
        acceptedJobs.add(
          DUMMY_JOBS.firstWhere((job) => job.jobID == jobId),
        );
      });
    }
  }

   bool _isAccepted(String id) {
    return acceptedJobs.any((job) => job.jobID == id);
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: TabsScreen(acceptedJobs), // default is '/'
      routes: {
        JobsList.routeName: (ctx) => JobsList(),
        JobScreen.routeName: (ctx) =>
            JobScreen(_acceptJob),
            Accepted.routeName: (ctx) =>
            Accepted(),
            CompletedJobsDetail.routeName: (ctx) => CompletedJobsDetail(),
      },
      onGenerateRoute: (settings) {
        print(settings.arguments);
      },
      onUnknownRoute: (settings) {
        return MaterialPageRoute(
          builder: (ctx) => JobsList(),
        );
      },
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center()
    );
  }
  }