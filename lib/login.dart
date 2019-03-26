import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'auth.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
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
                child: Text("Login"),
                textColor: Colors.white,
                onPressed: () {
                  if (auth.login(
                      _unameController.text, _pwordController.text)) {
                    Navigator.pushReplacementNamed(context, "main_page");
                  } else {
                    Fluttertoast.showToast(
                        msg: "Wrong Password",
                        toastLength: Toast.LENGTH_SHORT,
                        gravity: ToastGravity.BOTTOM,
                        timeInSecForIos: 1,
                        backgroundColor: Colors.grey[600],
                        textColor: Colors.white,
                        fontSize: 14.0);
                  }
                }),
            FlatButton(
              child: Text("No Account? Sign up hear!"),
              onPressed: () {
                Navigator.pushNamed(context, "signup_page");
              },
            )
          ],
        ),
      )),
    );
  }
}
