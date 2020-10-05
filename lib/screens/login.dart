import 'package:firstproject/screens/homepage.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginPage extends StatelessWidget {
  TextEditingController idController = TextEditingController();
  TextEditingController pdController = TextEditingController();

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

  Widget inputFieldBuilder(String label,
      {@required TextEditingController controller}) {
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
          TextField(
            controller: controller,
            obscureText: label == "Password/MPIN" ? true : false,
          )
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
          onPressed: () async {
            String id = idController.text;
            String pwd = pdController.text;

            if (idController.text != '' && pdController.text != '') {
              await saveDataToLocal(id: id, pwd: pwd);

              // Navigator.pushNamed(context, "/homepage");
              Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => HomePage("from login")));
            } else {
              showDialog(
                barrierDismissible: true,
                  context: context,
                  builder: (context) {
                    return AlertDialog(
                      
                      content: Text('please fill both fields'),
                    );
                  });
            }
          },
        ),
      ),
    );
  }

  Future<bool> saveDataToLocal(
      {@required String id, @required String pwd}) async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    bool savedId = await pref.setString("id", id);
    bool savedpwd = await pref.setString("password", pwd);
    return true;
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
          inputFieldBuilder("Esewa ID(Mobile/Email", controller: idController),
          inputFieldBuilder("Password/MPIN", controller: pdController),
          loginButton(context)
        ],
      ),
    );
  }
}
