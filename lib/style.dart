import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

class Style {
  static InputDecoration phoneField(
      {Function clearValue,
      String number,
      TextEditingController phoneController,
      String hintMask}) {
    return InputDecoration(
      hintStyle: TextStyle(fontSize: 15, color: Colors.grey),
      helperStyle: TextStyle(
        fontSize: 15,
      ),
      focusedBorder: UnderlineInputBorder(
        borderSide: BorderSide(color: Colors.black),
      ),
      hintText: hintMask.replaceAll('#', '9'),
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
