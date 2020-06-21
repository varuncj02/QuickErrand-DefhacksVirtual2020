

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:helloworld/dummydata.dart';
import 'package:helloworld/screens/tabs_screen.dart';


class LoginPage extends StatefulWidget {


  @override 
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController _userNameFilter = new TextEditingController();

  final String targetName = DUMMY_JOBS[0].userName;

  final TextEditingController _passwordFilter = new TextEditingController();

  String _userName = "";
  String _password = "";
  DifferentPages _page = DifferentPages.login;

  _LoginPageState() {
    _userNameFilter.addListener(_userNameListen);
    _passwordFilter.addListener(_passwordListen);
  }

  void _userNameListen() {
    if(_userNameFilter.text.isEmpty) {
      _userName = "";
    }
    else {
      _userName = _userNameFilter.text;
    }
  }

  void _passwordListen() {
    if(_passwordFilter.text.isEmpty) {
      _password = "";
    }
    else {
      _password = _passwordFilter.text;
    }
  }

  void _pageChange () async {
    setState(() {
      if(_page == DifferentPages.register) {
        _page = DifferentPages.login;
      }
      else {
        _page = DifferentPages.register;
      }
    });
  }

  @override 
  Widget build(BuildContext context){
    return new Scaffold(
      appBar: _buildLoginBar(context),
      body: new Container(
        padding: EdgeInsets.all(15.0),
        child: new Column(
          children: <Widget>[
            _buildField(),
            _buildButton(),
          ],
        ),
      ),
    );
  }

  Widget _buildLoginBar(BuildContext context){
    return new AppBar(
      title: new Text("Login"),
      centerTitle: true,
    );
  }

  Widget _buildField(){
    return new Container(
      child: new Column(
        children: <Widget>[
          new Container(
            child: new TextField(
              controller: _userNameFilter,
              decoration: new InputDecoration(
                labelText: 'UserName'
              ),
            ),
          ),
          new Container(
            child: new TextField(
              controller: _passwordFilter,
              decoration: new InputDecoration(
                labelText: 'Password'
              ),
              obscureText: true,
            ),
          ),
        ],
      )
    );
  }

  Widget _buildButton() {
    if(_page == DifferentPages.login) {
      return new Container(
        child: new Column(
          children: <Widget>[
            new RaisedButton(
              child: new Text('Login'),
              onPressed: (){
                /*print(_userName);
                print(targetName);
                print(_userName.trim() == targetName.trim());*/
                if(_userName.trim() == targetName.trim()) {
                _loginPressed(context);
                }
              }, // Todo: Code for the Navigation too the other screens needs to be added
            ),
            new FlatButton(
              child: new Text('No Account Register'),
              onPressed: (){
                _pageChange();
              }
            ),
          ],
        ),
      );
    }
    else {
      return new Container(
        child: new Column(
          children: <Widget>[
            new RaisedButton(
              child: new Text('Account Creation'),
              onPressed: (){
                  _createAccountPressed();
                
              }, // Todo: Code for the Navigation to account creation - Least Priority Task
            ),
            new FlatButton(
              child: new Text('Login'),
              onPressed: (){
                _pageChange();
              }
            ),
          ],
        ),
      );
    }
  }
}

//Navigation to the home page to be added
void _loginPressed (BuildContext context) {
  Navigator.of(context).pushNamed(TabsScreen.routeName);
}

// Navigation to create the user here 
void _createAccountPressed() {

}

enum DifferentPages {
  login, register
}