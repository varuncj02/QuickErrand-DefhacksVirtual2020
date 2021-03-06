import 'package:flutter/material.dart';
import 'package:helloworld/screens/accepted.dart';
import '../models/job.dart';
import '../dummydata.dart';

import '../screens/completed_jobs_screen.dart';

class JobScreen extends StatefulWidget {

 
  static const routeName = '/JobScreen';

    final Function addAccepted;

   JobScreen(this.addAccepted);

  @override
  _JobScreenState createState() => _JobScreenState();
}

class _JobScreenState extends State<JobScreen> {
  List<Job> jobData = DUMMY_JOBS;
 

  void acceptJob(String jobID) {
    Navigator.of(context).pushReplacementNamed(Accepted.routeName);
    widget.addAccepted(jobID);
  }

  @override
  Widget build(BuildContext context) {
    final jobId = ModalRoute.of(context).settings.arguments as String;
    final selectedJob = DUMMY_JOBS.firstWhere((job) => job.jobID == jobId);

    return Scaffold(
        appBar: AppBar(title: Text("Job Details")),
        body: Column(crossAxisAlignment: CrossAxisAlignment.start,
            //mainAxisSize: MainAxisSize.max,
            children: [
              Container(
                padding: EdgeInsets.symmetric(horizontal: 21, vertical: 10),
                child: Text(selectedJob.jobTitle,
                    textAlign: TextAlign.center,
                    style:
                        TextStyle(fontWeight: FontWeight.bold, fontSize: 25)),
              ),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 20),
                child: Text('${"Posted by " + selectedJob.userName}',
                    textAlign: TextAlign.left,
                    style:
                        TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
              ),
              Divider(
                //color: Colors.blueAccent,
                //color: Colors.cyan,
                color: Color.fromRGBO(244, 154, 193, 100),

              ),
              Container(
                  child: Text("Job Description"),
                  margin: EdgeInsets.only(left: 20, top: 20)),
              Container(
                margin: EdgeInsets.symmetric(horizontal: 20),
                decoration: BoxDecoration(
                    border: Border.all(
                      //color: Colors.blueAccent,
                      //color: Colors.cyan,
                      color: Color.fromRGBO(244, 154, 193, 100),
                    ),
                    borderRadius: BorderRadius.circular(10.0)),
                padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                child: Text(
                  selectedJob.jobDescription,
                  style: TextStyle(fontSize: 19),
                ),
              ),
              Container(
                margin: EdgeInsets.only(top: 20, right: 20),
                child: Row(children: [
                  Icon(Icons.timer),
                  Text("${selectedJob.jobTime + " minutes"}"),
                ]),
                padding: EdgeInsets.all(10),
              ),
              Container(
                  padding: EdgeInsets.all(10),
                  child: Row(children: [
                    Icon(Icons.location_on),
                    Text(selectedJob.jobLocation),
                  ])),
              Container(
                  padding: EdgeInsets.all(10),
                  child: Row(children: [
                    Icon(Icons.attach_money),
                    Text("${" " + selectedJob.price.toString() + " per hour"}"),
                  ])),
              Container(
                  margin: EdgeInsets.symmetric(vertical: 10),
                  alignment: Alignment.center,
                  child: Container(
                    width: 300,
                    child: RaisedButton(
                      child: Text("Accept job"),
                      onPressed: () => showDialog(
                          context: context,
                          child: AlertDialog(
                              title: Text(
                                  "Are you sure you want to accept this job?"),
                              actions: <Widget>[
                                FlatButton(
                                  child: Text("Yes"),
                                  onPressed: () => acceptJob(selectedJob.jobID),
                                ),
                                FlatButton(
                                  child: Text("No"),
                                  onPressed: () {Navigator.of(context).pop();} ,
                                )
                              ])),
                      //color: Colors.blueAccent,
                      color: Colors.cyan,
                    ),
                  )),
            ]));
  }
}
