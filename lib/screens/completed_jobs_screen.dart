import 'package:flutter/material.dart';
import 'package:helloworld/models/job.dart';
import 'package:helloworld/widgets/completed_job_item.dart';
import 'package:helloworld/widgets/job_item.dart';

class CompletedJobs extends StatelessWidget {

final List<Job> completedJobs;

  CompletedJobs(this.completedJobs);  

  static const routeName = '/JobsList';

  @override
  Widget build(BuildContext context) {
    if (completedJobs.isEmpty) {
      return Center(
        child: Text('You have not completed any yet - start doing some!'),
      );
    } else {
      return ListView.builder(
        itemBuilder: (ctx, index) {
          return CompletedJobItem(
              jobID: completedJobs[index].jobID,
              jobTitle: completedJobs[index].jobTitle,
              jobDescription: completedJobs[index].jobDescription,
              jobSkills: completedJobs[index].jobSkills,
              jobLocation: completedJobs[index].jobLocation,
              jobTime: completedJobs[index].jobTime,
              jobType: completedJobs[index].jobType,
              price: completedJobs[index].price,
             
            );
        },
        itemCount: completedJobs.length,
      );
    }
  }
}