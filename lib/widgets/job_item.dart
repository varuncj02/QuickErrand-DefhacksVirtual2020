import 'package:flutter/material.dart';
import '../dummydata.dart';
import '../models/job.dart';
import '../screens/job_screen.dart';

class JobItem extends StatelessWidget {

  static const routeName = '/JobItem';
  final String jobID;
  final String jobTitle;
  final String jobDescription;
  final double price;
  final Type jobType;
  final Skills jobSkills;
  final String jobLocation;
  final String jobTime;

  JobItem({
    @required this.jobID,
    @required this.jobTitle,
    @required this.jobDescription,
    @required this.price,
    @required this.jobType,
    @required this.jobSkills,
    @required this.jobLocation,
    @required this.jobTime,
  });

  void selectJob(BuildContext context) {
    Navigator.of(context)
        .pushNamed(
      JobScreen.routeName,
      arguments: jobID,
    );
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
        onTap: () => selectJob(context),
          child: Card(
        color: Colors.blue,
          child: Column(children: [
        Container(
          child: Text(jobTitle, style: TextStyle(fontWeight: FontWeight.bold, fontSize: 22)),
          padding: EdgeInsets.all(20),
        ),
        // Container(
        //   child: Text(jobDescription),
        //   padding: EdgeInsets.all(20),
        // ),
        Container(child: Row(children: [Icon(Icons.timer), Text(jobTime),]), padding: EdgeInsets.all(10),),
        Container(child: Row(children: [Icon(Icons.map), Text(jobLocation),]), padding: EdgeInsets.all(10)),
        Container(child: Row(children: [Text("Dollar"), Text(price.toString()),]), padding: EdgeInsets.all(10)),

      ])),
    );
  }
}
