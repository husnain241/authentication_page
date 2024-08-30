import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

class Forget extends StatefulWidget {
  const Forget({super.key});

  @override
  State<Forget> createState() => _ForgetState();
}

class _ForgetState extends State<Forget> {
  TextEditingController email = TextEditingController();

  reset() async {
    await FirebaseAuth.instance.sendPasswordResetEmail(email: email.text);
  }

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('forget'),
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
            ElevatedButton(
                onPressed: (() => reset()), child: Text('send email'))
          ],
        ),
      ),
    );
  }
}
