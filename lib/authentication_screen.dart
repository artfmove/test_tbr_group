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
    phoneNumber = returnedNumber
        .replaceAll(' ', '')
        .replaceAll('(', '')
        .replaceAll(')', '')
        .replaceAll('-', '')
        .replaceAll('+', '');

    if (phoneNumber.length == 11 ||
        phoneNumber.length == 10 ||
        phoneNumber.length == 0) setState(() {});
  }

  void successDialog() {
    showDialog(
        context: context,
        builder: (ctx) => AlertDialog(
              title: Text('Successful registration'),
              actions: [
                TextButton(
                    onPressed: () => Navigator.pop(ctx), child: Text('Ok'))
              ],
            ));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Text(
              'Get Started',
              style: TextStyle(fontSize: 26, fontWeight: FontWeight.bold),
            ),
            PhoneField(
                getPhoneNumber, ['+# (###) ###-##-##', '+3 (800) 000-00-00']),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: phoneNumber.length == 11
            ? Theme.of(context).floatingActionButtonTheme.backgroundColor
            : Colors.grey[300],
        elevation: 0.0,
        child: Icon(Icons.arrow_forward),
        onPressed: phoneNumber.length == 11
            ? () {
                successDialog();
              }
            : null,
      ),
    );
  }
}
