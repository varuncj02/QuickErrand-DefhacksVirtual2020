import 'package:flutter/material.dart';

class JobScreen extends StatefulWidget {
  static const routeName = '/JobScreen';
  @override
  _JobScreenState createState() => _JobScreenState();
}

class _JobScreenState extends State<JobScreen> {

  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Job Details")),
      body: Center(child: Text("Job details will be listed here")),
      
    );
  }
}