import 'package:flutter/material.dart';
import 'phone_field.dart';

class AuthenticationScreen extends StatefulWidget {
  @override
  _AuthenticationScreenState createState() => _AuthenticationScreenState();
}

class _AuthenticationScreenState extends State<AuthenticationScreen> {
  String phoneNumber = '';

  void getPhoneNumber(String returnedNumber) {
    if (phoneNumber == returnedNumber) return;
    phoneNumber = returnedNumber;

    if (phoneNumber.length == 10 ||
        phoneNumber.length == 9 ||
        phoneNumber.length == 0) setState(() {});
  }

  void successDialog() {
    showDialog(
        context: context,
        builder: (ctx) => AlertDialog(
              title: Text('Successful registration'),
              content: Text(
                  'You number is (${phoneNumber.substring(0, 3)}) ${phoneNumber.substring(3, 6)}-${phoneNumber.substring(6, 10)}'),
              actions: [
                TextButton(
                    onPressed: () => Navigator.pop(ctx),
                    child: Text('Ok, go to app'))
              ],
            ));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              'Get Started',
              style: TextStyle(fontSize: 26, fontWeight: FontWeight.bold),
            ),
            PhoneField(getPhoneNumber),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: phoneNumber.length == 10
            ? Theme.of(context).floatingActionButtonTheme.backgroundColor
            : Colors.grey[300],
        elevation: 0.0,
        child: Icon(Icons.arrow_forward),
        onPressed: phoneNumber.length == 10
            ? () {
                successDialog();
              }
            : null,
      ),
    );
  }
}
