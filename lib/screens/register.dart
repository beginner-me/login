import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MyRegister extends StatefulWidget {
  const MyRegister({Key? key}) : super(key: key);

  @override
  State<MyRegister> createState() => _MyRegisterState();
}

class _MyRegisterState extends State<MyRegister> {
  @override
  final _auth = FirebaseAuth.instance;
  var emailController = TextEditingController();
  var passwordController = TextEditingController();
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          // This is the theme of your application.
          //
          // Try running your application with "flutter run". You'll see the
          // application has a blue toolbar. Then, without quitting the app, try
          // changing the primarySwatch below to Colors.green and then invoke
          // "hot reload" (press "r" in the console where you ran "flutter run",
          // or simply save your changes to "hot reload" in a Flutter IDE).
          // Notice that the counter didn't reset back to zero; the application
          // is not restarted.
          primarySwatch: Colors.blue,
        ),
        home: Scaffold(
            appBar: AppBar(
              title: Text('Regsiter'),
            ),
            body: Container(
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: NetworkImage("https://media.istockphoto.com/id/459159997/photo/abstract-blue-background-water-with-sunbeams.jpg?s=612x612&w=0&k=20&c=YbG-5qu42ZA0w5cjirYM4j05uulPG7z6Xxb4JciE6zM="),
                  fit: BoxFit.cover,
                ),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Container(
                    decoration: BoxDecoration(
                      image:DecorationImage(image:NetworkImage("https://media.istockphoto.com/id/459159997/photo/abstract-blue-background-water-with-sunbeams.jpg?s=612x612&w=0&k=20&c=YbG-5qu42ZA0w5cjirYM4j05uulPG7z6Xxb4JciE6zM="),
                        fit : BoxFit.cover,
                      ),
                    ),

                  ),
                  Container(
                    padding: const EdgeInsets.fromLTRB(20, 20, 20,20),
                    child: Icon(Icons.water_drop_outlined,
                      size:50.0,
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.fromLTRB(90,2, 20, 0),
                    child: TextField(
                      controller: emailController,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(90.0),
                        ),
                        labelText: 'EMAIL',
                        hintText: "Enter email",
                      ),
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.fromLTRB(20,2, 90, 0),
                    child: TextField(
                      controller:passwordController,
                      //obscureText: true,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(90.0),
                        ),
                        labelText: 'PASSWORD',
                        hintText:"Enter password",

                      ),
                    ),
                  ),
                  Container(
                      height: 70,
                      padding: const EdgeInsets.all(20),
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          minimumSize: const Size.fromHeight(50),
                          shadowColor: Color.alphaBlend(CupertinoColors.systemBlue, CupertinoColors.black),
                        ),
                        child: const Text('Submit'),
                        onPressed: () async {
                          try{
                            final newUse = await _auth.createUserWithEmailAndPassword(

                                email: emailController.text.trim(),
                                password: passwordController.text.trim());
                            if(newUse  != null)
                              {
                                Navigator.pushNamed(context,'home_screen');
                              }
                          }
                          catch(e)
                          {
                            print(e);
                          }
                        },

                      )),
                  // TextButton(
                  //   onPressed: () {
                  //     Navigator.pushNamed(context, 'login');
                  //   },
                  //   child: Text(
                  //     'Already have an existing account?',
                  //     style: TextStyle(color: Colors.black),
                  //   ),
                  // ),
                ],
              ),
            )));
  }
}


