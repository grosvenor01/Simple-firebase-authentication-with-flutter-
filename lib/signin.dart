import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebaseint/main.dart';
import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: SignInPage(),
    );
  }
}

class SignInPage extends StatelessWidget {
  late String email;
  late String password;
  final auth= FirebaseAuth.instance;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Sign In'),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              TextFormField(
                onChanged: (value){email=value;},
                decoration: const InputDecoration(
                  labelText: 'Email',
                  prefixIcon: Icon(Icons.email),
                ),
              ),
              SizedBox(height: 16.0),
              TextFormField(
                onChanged: (value){
                  password=value;
                },
                obscureText: true, // Hide the password
                decoration: InputDecoration(
                  labelText: 'Password',
                  prefixIcon: Icon(Icons.lock),
                ),
              ),
              SizedBox(height: 32.0),
              ElevatedButton(
                onPressed: () async{
                  try {
                  var user=await auth.signInWithEmailAndPassword(email: email, password: password);
                  Navigator.push(context,MaterialPageRoute(builder: (context) => HomePage()));
                  }
                  catch(e){
                    print(e);                  }// Handle sign-in button press
                  // You can add authentication logic here
                },
                child: Text('Sign In'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}