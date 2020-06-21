import 'package:flutter/material.dart';

import './models/job.dart';

const DUMMY_JOBS = const [
  Job(
    jobID: 'j1',
    jobTitle: 'Need my lawn moved',
    jobDescription: "It's a 20x30 sqft backyard. Can provide lawn mover. Approximately 2 hours of work",
    jobLocation: 'DFW',
    jobSkills: Skills.Lawnmowing,
    jobTime: '60',
    jobType: Type.Labor,
    price: 15, 
    userName: 'zxhNm1',
  ),

  Job(
    jobID: 'j2',
    jobTitle: 'Need my dog walked',
    jobDescription: "3yo labrador. Likes pooping on Coit rd. Very jumpy",
    jobLocation: 'Plano',
    jobSkills: Skills.Dogwalking,
    jobTime: '75',
    jobType: Type.Misc,
    price: 10, 
    userName: 'zxhNm1',
  ),

  Job(
    jobID: 'j3',
    jobTitle: 'Need a package to be picked up from UPS on Coit rd.',
    jobDescription: "Package should fit into any car and it's not very heavy. Please handle with care",
    jobLocation: 'Richardson',
    jobSkills: Skills.PickupDrop,
    jobTime: '30',
    jobType: Type.Delivery,
    price: 6, 
    userName: 'zxhNm1',
  ),

  Job(
    jobID: 'j4',
    jobTitle: 'Need my fan to be fixed',
    jobDescription: "Ceiling Fan has stopped working. Don't know the cause",
    jobLocation: 'Allen',
    jobSkills: Skills.Electrical,
    jobTime: '120',
    jobType: Type.Repair,
    price: 15, 
    userName: 'zxhNm1',
  ),

    Job(
    jobID: 'j5',
    jobTitle: 'Fix my fence',
    jobDescription: "Very old fence. Needs some work",
    jobLocation: 'Allen',
    jobSkills: Skills.Woordwork,
    jobTime: '120',
    jobType: Type.Repair,
    price: 20, 
    userName: 'zxhNm1',
  ),

  Job(
    jobID: 'j6',
    jobTitle: 'Need my dog walked',
    jobDescription: "3yo labrador. Likes pooping on Coit rd. Very jumpy",
    jobLocation: 'Richardson',
    jobSkills: Skills.Dogwalking,
    jobTime: '75',
    jobType: Type.Misc,
    price: 10, 
    userName: 'zxhNm1',
  ),


];
