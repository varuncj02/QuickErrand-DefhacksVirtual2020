import 'package:flutter/material.dart';
import 'package:helloworld/models/job.dart';
import './completed_jobs_screen.dart';

class Profile extends StatelessWidget {
  final List<Job> completedJobs;

  Profile(@required this.completedJobs);

  static const routeName = '/ProfileScreen';

  @override
  Widget build(BuildContext context) {
    int size = completedJobs.length;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(children: [
          Icon(
            Icons.account_circle,
            size: 100,
          ),
          Text("Guest_User2304",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold))
        ]),
        Column(
          
          children: [
            Container(
                margin: EdgeInsets.all(20),
                child: Text(
                  '${"     Jobs Completed: " + size.toString()}',
                  style: TextStyle(
                    fontSize: 18,
                  ),
                )),
                Container(
                margin: EdgeInsets.all(20),
                child: Text('Your Rating: 4.5',
                  style: TextStyle(
                    fontSize: 18,
                  ),
                ))
          ],
        )
      ],
    );
  }
}
