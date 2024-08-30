import 'package:alifir/forget.dart';
import 'package:alifir/signup.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();

  signIn() async {
    await FirebaseAuth.instance
        .signInWithEmailAndPassword(email: email.text, password: password.text);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Login'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            TextField(
              controller: email,
              decoration: InputDecoration(
                hintText: 'Enter your email', // Changed hintText
              ),
            ),
            TextField(
              controller: password,
              decoration: InputDecoration(
                hintText: 'Enter your password', // Changed hintText
              ),
            ),
            SizedBox(height: 20),
            ElevatedButton(onPressed: (() => signIn()), child: Text('Login')),
            SizedBox(height: 20),
            ElevatedButton(
                onPressed: (() => Get.to(Signup())),
                child: Text('Create Account')),
            SizedBox(height: 20),
            ElevatedButton(
                onPressed: (() => Get.to(Forget())),
                child: Text('Forget password?')),
          ],
        ),
      ),
    );
  }
}
