import 'package:flutter/material.dart';
import '../widgets/job_item.dart';
import '../models/job.dart';
import '../dummydata.dart';

class JobsList extends StatelessWidget {
  List<Job> data = DUMMY_JOBS;

  static const routeName = '/JobsList';

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: DUMMY_JOBS.length,
      itemBuilder: (BuildContext ctx, int index) {
        return Column(
          children: [
            JobItem(
              jobID: data[index].jobID,
              jobTitle: data[index].jobTitle,
              jobDescription: data[index].jobDescription,
              jobSkills: data[index].jobSkills,
              jobLocation: data[index].jobLocation,
              jobTime: data[index].jobTime,
              jobType: data[index].jobType,
              price: data[index].price,
              
            ),
            Divider(),
          ],
        );
      },
    );
  }
}
