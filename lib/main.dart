import 'package:flutter/material.dart';
import 'package:helloworld/screens/accepted.dart';
import 'package:helloworld/screens/job_screen.dart';
import './screens/job_list_screen.dart';
import './dummydata.dart';
import './models/job.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {

  List<Job> jobData = DUMMY_JOBS;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: JobsList(), // default is '/'
      routes: {
        JobsList.routeName: (ctx) => JobsList(),
        JobScreen.routeName: (ctx) =>
            JobScreen(),
            Accepted.routeName: (ctx) =>
            Accepted(),
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