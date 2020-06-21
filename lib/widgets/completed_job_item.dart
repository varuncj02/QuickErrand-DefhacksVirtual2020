import 'package:flutter/material.dart';
import 'package:helloworld/screens/completed_job_details.dart';
import '../dummydata.dart';
import '../models/job.dart';
import '../screens/job_screen.dart';

class CompletedJobItem extends StatelessWidget {
  static const routeName = '/JobItem';
  final String jobID;
  final String jobTitle;
  final String jobDescription;
  final double price;
  final Type jobType;
  final Skills jobSkills;
  final String jobLocation;
  final String jobTime;

  CompletedJobItem({
    @required this.jobID,
    @required this.jobTitle,
    @required this.jobDescription,
    @required this.price,
    @required this.jobType,
    @required this.jobSkills,
    @required this.jobLocation,
    @required this.jobTime,
    //@required this.userName
  });

  void selectJob(BuildContext context) {
    Navigator.of(context).pushNamed(
      CompletedJobsDetail.routeName,
      arguments: jobID,
    );
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => selectJob(context),
      child: Card(
          color: Colors.blueAccent,
          child: Column(children: [
            Container(
              child: Text(jobTitle,
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 22), textAlign: TextAlign.center,),
              padding: EdgeInsets.all(20),
            ),
            // Container(
            //   child: Text(jobDescription),
            //   padding: EdgeInsets.all(20),
            // ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  child: Row(children: [
                    Icon(Icons.timer),
                    Text("${jobTime + " minutes"}"),
                  ]),
                  padding: EdgeInsets.all(10),
                ),
                Container(
                    child: Row(children: [
                      Icon(Icons.location_on),
                      Text(jobLocation),
                    ]),
                    padding: EdgeInsets.all(10)),
                Container(
                    child: Row(children: [
                      Icon(Icons.attach_money),
                      Text("${price.toString() + " per hour"}"),
                    ]),
                    padding: EdgeInsets.all(10)),
              ],
            ),
          ])),
    );
  }
}
