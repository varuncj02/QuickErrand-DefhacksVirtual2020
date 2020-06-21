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
}

class Job {
  final String jobID;
  final String jobTitle;
  final String jobDescription;
  final double price;
  final Type jobType;
  final Skills jobSkills;
  final String jobLocation;
  final String jobTime;

  const Job({
    @required this.jobID,
    @required this.jobTitle,
    @required this.jobDescription,
    @required this.price,
    @required this.jobType,
    @required this.jobSkills,
    @required this.jobLocation,
    @required this.jobTime,
  });
}
