import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

class Style {
  static InputDecoration phoneField(
      {Function clearValue,
      String number,
      TextEditingController phoneController}) {
    return InputDecoration(
      hintStyle: TextStyle(fontSize: 15, color: Colors.grey),
      helperStyle: TextStyle(
        fontSize: 15,
      ),
      focusedBorder: UnderlineInputBorder(
        borderSide: BorderSide(color: Colors.black),
      ),
      hintText: '(201) 555-0123',
      helperText: 'Enter your phone number',
      counterText: '',
      suffix: number.length > 0
          ? GestureDetector(
              child: Icon(
                CupertinoIcons.xmark_circle_fill,
                color: Colors.grey,
              ),
              onTap: () => clearValue(),
            )
          : null,
    );
  }
}
