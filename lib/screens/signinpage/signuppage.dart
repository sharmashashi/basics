import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SignupPage extends StatelessWidget {
  TextEditingController emailController = TextEditingController();
  TextEditingController pwdController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      appBar: AppBar(
        leading: BackButton(),
        title: Text("Signup"),
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
                FirebaseAuth ins = FirebaseAuth.instance;
                try {
                
                  UserCredential creds =
                      await ins.createUserWithEmailAndPassword(
                          email: emailController.text,
                          password: pwdController.text);
                  String signinEmail = creds.user.email;
                  await creds.user.sendEmailVerification();
                  Get.back();
                } catch (e) {
                  print(e);
                }
              },
              child: Text("Sign up"),
            )
          ],
        ),
      ),
    );
  }
}
