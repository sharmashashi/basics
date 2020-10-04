import 'package:firstproject/screens/homepage.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatelessWidget {
  Image logoBuilder() {
    return Image.asset(
      "assets/eSewa-Nepal.png",
      width: 200,
    );
  }

  Widget greeting() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Welcome,',
          style: TextStyle(
              color: Colors.grey, fontSize: 25, fontWeight: FontWeight.w600),
        ),
        Text(
          'Sign in to continue',
          style: TextStyle(
            color: Colors.grey,
          ),
        ),
      ],
    );
  }

  Widget inputFieldBuilder(String label) {
    return Padding(
      padding: EdgeInsets.only(top: 15),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            label,
            style: TextStyle(
                color: Colors.black, fontWeight: FontWeight.bold, fontSize: 16),
          ),
          TextField()
        ],
      ),
    );
  }

  Widget loginButton(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: 30),
      child: Center(
        child: MaterialButton(
          minWidth: 300,
          child: Text(
            "Login",
            style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
          ),
          color: Colors.green,
          onPressed: () {
            print("before ");
            // Navigator.pushNamed(context, "/homepage");
            Navigator.of(context)
                .push(MaterialPageRoute(builder: (context) => HomePage()));
            print("pressed");
          },
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(padding: EdgeInsets.only(top: 50), child: logoBuilder()),
          Padding(padding: EdgeInsets.only(top: 20), child: greeting()),
          inputFieldBuilder("Esewa ID(Mobile/Email"),
          inputFieldBuilder("Password/MPIN"),
          loginButton(context)
        ],
      ),
    );
  }
}
