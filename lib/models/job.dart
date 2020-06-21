import 'package:flutter/material.dart';

enum Type {
  Delivery,
  Pickup,
  Repair,
  Labor,
  Misc,
}

enum Skills {
  PickupDrop,
  Lawnmowing,
  Dogwalking,
  Plumbing,
  Electrical,
  Woordwork,
}

class Job {
  final String jobID;
  final String jobTitle;
  final String jobDescription;
  final double price;
  final Type jobType;
  //final String jobType;
  final Skills jobSkills;
  //final String jobSkills;
  final String jobLocation;
  final String jobTime;
  final String userName;

  const Job({
    @required this.jobID,
    @required this.jobTitle,
    @required this.jobDescription,
    @required this.price,
    @required this.jobType,
    @required this.jobSkills,
    @required this.jobLocation,
    @required this.jobTime,
    @required this.userName
  });
}
