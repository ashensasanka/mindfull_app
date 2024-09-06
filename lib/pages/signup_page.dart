import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:mindful_momentum/pages/root_page.dart';

import '../user_auth.dart';


class SignUpPage extends StatefulWidget {
  const SignUpPage({super.key});

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  TextEditingController username = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();

  postDetailsToFirestore() async {
    var user = FirebaseAuth.instance.currentUser;
    CollectionReference new_users =
    FirebaseFirestore.instance.collection('users');
    new_users.doc(user?.uid).set(
      {
        'username': username.text,
        'email': email.text,
        'password': password.text,
        'uid':user?.uid,
      },
    );
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(
        builder: (context) => RootPage(),
      ),
    );
  }

  void signUserUp() async {
    // Check if the password length is less than 6 characters
    if (password.text.length < 6) {
      // Show an error message
      wrongEmailMessage("Password must be at least 6 characters long");
      return;
    }

    // Show loading circle
    showDialog(
      context: context,
      builder: (context) {
        return const Center(
          child: CircularProgressIndicator(),
        );
      },
    );

    // Try creating the user
    try {
      // Check if password is confirmed
      FirebaseAuth.instance
          .createUserWithEmailAndPassword(
        email: email.text,
        password: password.text,
      )
          .then((value) => {postDetailsToFirestore()})
          .catchError((e) {});

      // Pop the loading circle
      Navigator.pop(context);
    } on FirebaseAuthException catch (e) {
      // Pop the loading circle
      Navigator.pop(context);
      // Show error message
      wrongEmailMessage("e.code");
    }
  }

  void wrongEmailMessage(String error) {
    if (mounted) {
      showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            backgroundColor: Colors.white,
            title: const Text(
              'Alert!',
              style: TextStyle(
                fontSize: 16,
                color: Colors.black,
              ),
            ),
            content: Text(
              error,
              style: TextStyle(
                fontSize: 14,
                color: Colors.black,
              ),
            ),
            actions: [
              ElevatedButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: Text('Retry'),
              ),
            ],
          );
        },
      );
    }
  }

  void emptyEmailMessage() {
    if (mounted) {
      showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            backgroundColor: Colors.white,
            title: const Text(
              'Alert!',
              style: TextStyle(
                fontSize: 16,
                color: Colors.black,
              ),
            ),
            content: const Text(
              'Please fill Email & Password',
              style: TextStyle(
                fontSize: 14,
                color: Colors.black,
              ),
            ),
            actions: [
              ElevatedButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: Text('Retry'),
              ),
            ],
          );
        },
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        decoration: BoxDecoration(
          gradient: LinearGradient(colors: [
            Color(0xff808080),
            Color(0xff9546C4),
            Color(0xff5e61f4),
          ], begin: Alignment.topCenter, end: Alignment.bottomCenter),
        ),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset('assets/images/logo1.png'),
              Container(
                height: 60,
                width: 350,
                decoration: BoxDecoration(
                  color: Color(0xffcd95db),
                  borderRadius: BorderRadius.all(
                    Radius.circular(20),
                  ),
                ),
                child: Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 10, right: 20),
                      child: Icon(
                        Icons.person,
                        color: Colors.white,
                        size: 35,
                      ),
                    ),
                    Expanded(
                      child: TextField(
                        controller: username,
                        decoration: InputDecoration(
                          border: InputBorder.none,
                          hintText: 'Enter username:',
                          hintStyle: TextStyle(
                            color: Colors.white,
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 20, bottom: 20),
                child: Container(
                  height: 60,
                  width: 350,
                  decoration: BoxDecoration(
                    color: Color(0xffcd95db),
                    borderRadius: BorderRadius.all(
                      Radius.circular(20),
                    ),
                  ),
                  child: Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 10, right: 20),
                        child: Icon(
                          Icons.email,
                          color: Colors.white,
                          size: 35,
                        ),
                      ),
                      Expanded(
                        child: TextField(
                          controller: email,
                          decoration: InputDecoration(
                            border: InputBorder.none,
                            hintText: 'Enter email:',
                            hintStyle: TextStyle(
                              color: Colors.white,
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only( bottom: 20),
                child: Container(
                  height: 60,
                  width: 350,
                  decoration: BoxDecoration(
                    color: Color(0xffcd95db),
                    borderRadius: BorderRadius.all(
                      Radius.circular(20),
                    ),
                  ),
                  child: Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 10, right: 20),
                        child: Icon(
                          Icons.lock,
                          color: Colors.white,
                          size: 35,
                        ),
                      ),
                      Expanded(
                        child: TextField(
                          controller: password,
                          obscureText: true,
                          decoration: InputDecoration(
                            border: InputBorder.none,
                            hintText: 'Enter password:',
                            hintStyle: TextStyle(
                              color: Colors.white,
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              GestureDetector(
                onTap: () {
                  if (username.text.isEmpty || email.text.isEmpty || password.text.isEmpty) {
                    emptyEmailMessage();
                  } else {
                    signUserUp();
                  }
                },
                child: Container(
                  height: 60,
                  width: 350,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.all(
                      Radius.circular(20),
                    ),
                  ),
                  child: Center(
                    child: Text(
                      'Sign-up',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
