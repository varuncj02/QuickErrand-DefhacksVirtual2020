import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class Login extends StatefulWidget {
  @override 
  _LoginState createState() => _LoginState();
} 

class _LoginState extends State<Login> {
  final _formKey = GlobalKey<FormState>();
  String _name;
  String _password;

  @override 
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(
        title: Text("Login Page"),
      ),
      body: Container(
        padding: EdgeInsets.all(20.0),
        child: Form(
          key: _formKey,
        child: Column(
          children: <Widget>[
            SizedBox(height: 20.0),
            Text(
              'Login Info',
               style: TextStyle(fontSize: 20), 
            ),
            SizedBox(height: 20.0),
            TextFormField(
              onSaved: (value) => _name = value,
              keyboardType: TextInputType.text,
              decoration: InputDecoration(labelText: "Name")
            ),
            TextFormField(
              onSaved: (value) => _password = value,
              obscureText: true,
              decoration: InputDecoration(labelText: "Password")
            ),
            SizedBox(height: 20.0),
            RaisedButton(child: Text("Login"), 
              onPressed: () {
                final form = _formKey.currentState;
                form.save();

                if(form.validate()){
                  print("$_name $_password"); // Just to test if valid or invalid works or not
                }
              })
          ],
        ),
      ),
      ),
    );
  }
}