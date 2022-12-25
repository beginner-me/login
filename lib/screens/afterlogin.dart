import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';


final _auth = FirebaseAuth.instance;

class AfterLogin extends StatefulWidget {
  const AfterLogin({Key? key}) : super(key: key);

  @override
  State<AfterLogin> createState() => _AfterLoginState();
}

class _AfterLoginState extends State<AfterLogin> {
  int currIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Home page',
          style: TextStyle(fontStyle: FontStyle.italic, fontSize: 25.0),
        ),
        centerTitle: true,
        backgroundColor: Colors.teal,
        //Color(0xff05B068),
        actions: <Widget>[
          IconButton(
            icon: const Icon(Icons.logout_rounded),
            tooltip: 'Logout',
            onPressed: () {
              _auth.signOut();
              Navigator.pushNamed(context, 'login');
            },
          ),
        ],
      ),
      body: Center(
        child: Text(
          "welcome home!",
          style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}