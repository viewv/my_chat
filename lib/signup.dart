import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'auth.dart';

class SignUp extends StatefulWidget {
  @override
  _SignUpState createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  final auth = new Auth();

  TextEditingController _unameController = new TextEditingController();
  TextEditingController _pwordController = new TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
          child: Theme(
        data: Theme.of(context).copyWith(
            hintColor: Colors.grey[200],
            inputDecorationTheme: InputDecorationTheme(
                labelStyle: TextStyle(color: Colors.grey),
                hintStyle: TextStyle(color: Colors.grey, fontSize: 15.0))),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Image(
              image: AssetImage("assets/images/avatar.png"),
              width: 60,
            ),
            Padding(
              padding: EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  TextField(
                    keyboardType: TextInputType.emailAddress,
                    controller: _unameController,
                    decoration: InputDecoration(
                        prefixIcon: Icon(Icons.person),
                        labelText: "username",
                        hintText: "username/email",
                        // icon: Icon(Icons.person),
                        //prefixIcon: Icon(Icons.person),
                        border: InputBorder.none),
                  ),
                  TextField(
                    controller: _pwordController,
                    obscureText: true,
                    textInputAction: TextInputAction.done,
                    decoration: InputDecoration(
                        labelText: "password",
                        hintText: "your password",
                        prefixIcon: Icon(Icons.lock),
                        border: InputBorder.none),
                  ),
                ],
              ),
            ),
            RaisedButton(
                color: Colors.blue[400],
                highlightColor: Colors.blue[500],
                colorBrightness: Brightness.dark,
                splashColor: Colors.white,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20.0)),
                // icon: Icon(Icons.new_releases),
                child: Text("Sign Up"),
                textColor: Colors.white,
                onPressed: () {
                  if (auth.signup(
                      _unameController.text, _pwordController.text)) {
                    Navigator.pop(context);
                    Fluttertoast.showToast(
                        msg: "Return And Log in",
                        toastLength: Toast.LENGTH_SHORT,
                        gravity: ToastGravity.BOTTOM,
                        timeInSecForIos: 1,
                        backgroundColor: Colors.grey[600],
                        textColor: Colors.white,
                        fontSize: 14.0);
                  } else {
                    Fluttertoast.showToast(
                        msg: "Unknown Wrong",
                        toastLength: Toast.LENGTH_SHORT,
                        gravity: ToastGravity.BOTTOM,
                        timeInSecForIos: 1,
                        backgroundColor: Colors.grey[600],
                        textColor: Colors.white,
                        fontSize: 14.0);
                  }
                }),
          ],
        ),
      )),
    );
  }
}
