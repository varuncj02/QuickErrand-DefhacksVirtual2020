import 'package:flutter/material.dart';

class Accepted extends StatelessWidget {
  static const routeName = '/Accepted';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text("Job Accepted")),
        body: Container(
            margin: EdgeInsets.symmetric(vertical: 250),
            alignment: Alignment.center,
            child: Column(children: [
              Icon(
                Icons.done,
                size: 100,
              ),
              Text("You have Accepted this Job")
            ])));
  }
}
