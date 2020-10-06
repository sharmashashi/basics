import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Registration extends StatefulWidget {
  @override
  _RegistrationState createState() => _RegistrationState();
}

class _RegistrationState extends State<Registration> {
  bool checked = false;
  int btnVal = 0;
  Color proceedBtnColor = Colors.grey;
  TextEditingController mncontroller = TextEditingController();
  TextEditingController fncontroller = TextEditingController();

  Widget loadingWidget = Container();
  Widget greeting() {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Registration',
            style: TextStyle(
                color: Colors.grey, fontSize: 25, fontWeight: FontWeight.w600),
          ),
          Text(
            'your mobile number will be your esewa id',
            style: TextStyle(
              color: Colors.grey,
            ),
          ),
        ],
      ),
    );
  }

  Widget inputFieldBuilder(String label,
      {@required TextEditingController controller, @required isObscure}) {
    return Padding(
      padding: EdgeInsets.only(top: 15, left: 10),
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
            obscureText: isObscure,
          )
        ],
      ),
    );
  }

  Widget gender() {
    return Padding(
      padding: EdgeInsets.only(top: 20),
      child: Column(
        children: [
          Text(
            "Gender",
            style: TextStyle(
                color: Colors.black, fontWeight: FontWeight.bold, fontSize: 16),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: DropdownButton(
                value: btnVal,
                items: [
                  DropdownMenuItem(
                    value: 0,
                    child: Text('Male'),
                  ),
                  DropdownMenuItem(
                    child: Text('Female'),
                    value: 1,
                  ),
                  DropdownMenuItem(
                    child: Text('Other'),
                    value: 2,
                  )
                ],
                onChanged: (value) {
                  setState(() {
                    btnVal = value;
                  });
                  print(value);
                }),
          )
        ],
      ),
    );
  }

  Widget privacypolicy() {
    return Row(
      children: [
        Checkbox(
          value: checked,
          onChanged: (isChecked) {
            print(isChecked);
            setState(() {
              checked = isChecked;
              if (checked == true)
                proceedBtnColor = Colors.green;
              else
                proceedBtnColor = Colors.grey;
            });
          },
        ),
        Text("I accept privacy policy and TC")
      ],
    );
  }

  Widget proceedButton(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: 20),
      child: Center(
        child: MaterialButton(
          minWidth: MediaQuery.of(context).size.width * 0.8,
          padding: EdgeInsets.symmetric(vertical: 10, horizontal: 30),
          onPressed: () async {
            if (checked == true) {
              setState(() {
                loadingWidget = Center(child: CircularProgressIndicator());
              });

              SharedPreferences pref = await SharedPreferences.getInstance();
              await Future.delayed(Duration(seconds: 2));
              await pref.setString("id", mncontroller.text);

              await pref.setString("password", fncontroller.text);
              await pref.setInt("gender", btnVal);
              setState(() {
                loadingWidget = Container();
              });
              Navigator.pop(context);
            } else {
              showDialog(
                  barrierDismissible: false,
                  context: context,
                  builder: (context) {
                    return AlertDialog(
                      actions: [
                        MaterialButton(
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          color: Colors.blue,
                          child: Text("Ok"),
                        )
                      ],
                      content:
                          Text("Please accept Privacy policy and TC first"),
                    );
                  });
            }
          },
          color: proceedBtnColor,
          child: Text(
            "Proceed",
            style: TextStyle(
                color: Colors.white, fontSize: 18, fontWeight: FontWeight.bold),
          ),
        ),
      ),
    );
  }

  Widget goback(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 20.0),
      child: Center(
        child: GestureDetector(
          onTap: () {
            Navigator.pop(context);
          },
          child: Text("Go Back",
              style: TextStyle(
                  color: Colors.green,
                  fontSize: 16,
                  fontWeight: FontWeight.bold)),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // padding: EdgeInsets.only(left: 20),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(height: 150),
            greeting(),
            inputFieldBuilder("Mobile Number",
                controller: mncontroller, isObscure: false),
            inputFieldBuilder("Passsword",
                controller: fncontroller, isObscure: true),
            gender(),
            privacypolicy(),
            proceedButton(context),
            goback(context),
            loadingWidget,
          ],
        ),
      ),
    );
  }
}
