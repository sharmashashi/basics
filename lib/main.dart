import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firstproject/screens/note/NoteDemo.dart';
import 'package:firstproject/screens/signinpage/signinpage.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(
      GetMaterialApp(debugShowCheckedModeBanner: false, home: AuthChecker()));
}

class AuthChecker extends StatefulWidget {
  @override
  _AuthCheckerState createState() => _AuthCheckerState();
}

class _AuthCheckerState extends State<AuthChecker> {
  @override
  void initState() {
    super.initState();
    _listenStateChanged();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(child: CircularProgressIndicator()),
    );
  }

  _listenStateChanged() {
    Stream<User> authState = FirebaseAuth.instance.authStateChanges();
    authState.listen((user) async {
      if (user == null) {
        print("user has not signed in or just signed out");
        Get.to(SigninPage());
      } else {
        
        // await Future.delayed(Duration(seconds: 1));
        Get.to(NoteDemo());
      }
    });
  }
}
