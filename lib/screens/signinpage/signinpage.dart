import 'package:firebase_auth/firebase_auth.dart';
import 'package:firstproject/screens/note/NoteDemo.dart';
import 'package:firstproject/screens/signinpage/signuppage.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SigninPage extends StatelessWidget {
  TextEditingController emailController = TextEditingController();
  TextEditingController pwdController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      appBar: AppBar(
        title: Text("signin"),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            TextField(
                controller: emailController,
                decoration: InputDecoration(hintText: "Email")),
            TextField(
                controller: pwdController,
                obscureText: true,
                decoration: InputDecoration(hintText: "Password")),
            MaterialButton(
              color: Colors.blue,
              onPressed: () async {
                bool signin = await _signin();
              },
              child: Text("Sign In"),
            ),
            MaterialButton(
              color: Colors.green,
              onPressed: () {
                Get.to(SignupPage());
              },
              child: Text("Sign up"),
            )
          ],
        ),
      ),
    );
  }

  Future<bool> _signin() async {
    bool retValue = false;
    FirebaseAuth ins = FirebaseAuth.instance;
    try {
      await ins.signInWithEmailAndPassword(
          email: emailController.text, password: pwdController.text);

      retValue = true;
    } catch (e) {
      print(e);
    }
    return retValue;
  }
}
