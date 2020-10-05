import 'package:flutter/material.dart';

class Registration extends StatefulWidget {
  @override
  _RegistrationState createState() => _RegistrationState();
}

class _RegistrationState extends State<Registration> {
  bool checked = false;
  int btnVal = 0;
  TextEditingController mncontroller = TextEditingController();
  TextEditingController fncontroller = TextEditingController();
  Widget greeting() {
    return Column(
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
          
          DropdownButton(
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
              })
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
            });
          },
        ),
        Text("I accept privacy policy and TC")
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.only(left: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(height: 50),
            greeting(),
            inputFieldBuilder("Mobile Number", controller: mncontroller),
            inputFieldBuilder("Full Name", controller: fncontroller),
            gender(),
            privacypolicy()
          ],
        ),
      ),
    );
  }
}
