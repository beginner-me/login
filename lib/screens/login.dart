// import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

class MyLogin extends StatefulWidget {
  const MyLogin({Key? key}) : super(key: key);

  @override
  State<MyLogin> createState() => _MyLoginState();
}

final _auth = FirebaseAuth.instance;

class _MyLoginState extends State<MyLogin> {
    String message = " ";
    var emailController = TextEditingController();
    var passwordController = TextEditingController();
    @override
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
                title: Text('Login'),
              ),
              body: Center(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[

                    Container(

                      padding: const EdgeInsets.fromLTRB(20, 20, 20, 0),
                      child: TextField(
                        controller: emailController,
                        decoration: InputDecoration(
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(90.0),
                          ),
                          labelText: 'Email',
                        ),
                      ),
                    ),
                    Container(
                      padding: const EdgeInsets.fromLTRB(20, 20, 20, 0),
                      child: TextField(
                        controller: passwordController,
                        obscureText: true,
                        decoration: InputDecoration(
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(90.0),
                          ),
                          labelText: 'Password',
                        ),
                      ),
                    ),
                    Container(
                        height: 80,
                        padding: const EdgeInsets.all(20),
                        child: TextButton(
                          style: TextButton.styleFrom(
                            textStyle: const TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.w700
                            ),
                          ),
                          child: const Text('Login'),
                          onPressed: () async {
                            setState(() {
                              message = " ";
                            });
                            try{
                              final user = await _auth.signInWithEmailAndPassword(
                                  email: emailController.text.trim(),
                                  password: passwordController.text.trim());
                              if(user!=null)
                                {
                                  Navigator.pushNamed(context, 'home_screen');
                                }
                            }
                            catch(e)
                            {
                              print(e);
                              setState(() {
                                message = e.toString();
                              });
                            }
                          },
                        )),
                    // TextButton(
                    //   onPressed: (){
                    //     Navigator.pushNamed(context, 'register');
                    //   },
                    //   child: Text(
                    //     //'Register',
                    //     style: TextStyle(color: Colors.grey[600]),
                    //   ),
                    // ),
                  ],
                ),
              )));
    }
  }






