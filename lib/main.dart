
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

import 'screens/login.dart';
import 'screens/register.dart';
import 'screens/afterlogin.dart';

main() async{

  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
      options: FirebaseOptions(
        apiKey: "AIzaSyAjwrt9h-XzfxAETWwQFJ54ve8XYvGiPCQ",
        appId: "1:155268839911:android:f34b7353e996c1a3c3e542",
        messagingSenderId: '155268839911',
        projectId: "sravani-9fbb5"


      ),
  );


  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: MyLogin(),
    routes: {
      'register': (context)=>MyRegister(),
      'login': (context)=>MyLogin(),
      'home_screen': (context) =>AfterLogin()
    },

  ));
}
