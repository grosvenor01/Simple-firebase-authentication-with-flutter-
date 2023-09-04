import 'package:firebaseint/signin.dart';
import 'package:firebaseint/signup.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
void main() async{
  runApp(const MyApp());
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner :  false,
      home : HomePage(),
      routes: {'/signup': (context)=>SignUpPage(),
               '/signin': (context)=>SignInPage(),
               'home':(context) => HomePage(),},
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({super.key});
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          ElevatedButton(
            onPressed: () { 
              Navigator.pushNamed(context, '/signup');
            },
            child: const Text("SignUp"),
            
          ),
          ElevatedButton(
            onPressed: () { 
              Navigator.pushNamed(context, '/signin');
            },
            child: const Text("SignIn")
          ),
        ],
      ),
      
    );
  }
}