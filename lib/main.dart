import 'package:flutter/material.dart';
import 'package:flutter_login_demo/Authentication/login.dart';
//import './services/authentication.dart';
//import './pages/root_page.dart';
import 'Components/jobpage.dart';

void main() {
  runApp(new MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
        title: 'Flutter login demo',
        debugShowCheckedModeBanner: false,
        theme: new ThemeData(
          primarySwatch: Colors.blue,
        ),
    );

    home: MyJobPage();


        //home: new RootPage(auth: new Auth()));
  }
}
