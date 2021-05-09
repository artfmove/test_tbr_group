import 'package:flutter/material.dart';
import 'style.dart';

class PhoneField extends StatefulWidget {
  final Function returnNumber;
  PhoneField(this.returnNumber);
  @override
  _PhoneFieldState createState() => _PhoneFieldState();
}

class _PhoneFieldState extends State<PhoneField> {
  String cleanNumber = '', formattedNumber = '';
  final _phoneController = TextEditingController();

  void clearValue() {
    setState(() {
      _phoneController.clear();
      cleanNumber = '';
      widget.returnNumber('');
    });
  }

  void format(String toFormat) {
    int lastNumberLength = formattedNumber.length;
    cleanNumber = toFormat
        .replaceAll('(', '')
        .replaceAll(')', '')
        .replaceAll('-', '')
        .replaceAll(' ', '');
    widget.returnNumber(cleanNumber);

    int replacedLength = cleanNumber.length;

    if (replacedLength == 0 && lastNumberLength <= formattedNumber.length)
      _phoneController.text = '';

    if (replacedLength >= 1 && replacedLength < 3)
      _phoneController.text = '($cleanNumber';

    if (replacedLength == 3) if (lastNumberLength <= formattedNumber.length)
      _phoneController.text = '(${cleanNumber.substring(0, 3)}';
    else
      _phoneController.text = '(${cleanNumber.substring(0, 3)})';

    if (replacedLength >= 4 && replacedLength <= 5)
      _phoneController.text =
          '(${cleanNumber.substring(0, 3)}) ${cleanNumber.substring(3, replacedLength)}';

    if (replacedLength >= 6) if (replacedLength == 6 &&
        lastNumberLength <= formattedNumber.length)
      _phoneController.text =
          '(${cleanNumber.substring(0, 3)}) ${cleanNumber.substring(3, 6)}${cleanNumber.substring(6, replacedLength)}';
    else
      _phoneController.text =
          '(${cleanNumber.substring(0, 3)}) ${cleanNumber.substring(3, 6)}-${cleanNumber.substring(6, replacedLength)}';

    _phoneController.selection = TextSelection.fromPosition(
      TextPosition(offset: _phoneController.text.length),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: TextFormField(
        autofocus: true,
        controller: _phoneController,
        maxLength: 14,
        onChanged: (v) {
          format(v);
          formattedNumber = v;
          setState(() {});
        },
        keyboardType: TextInputType.phone,
        decoration: Style.phoneField(
            clearValue: clearValue,
            number: cleanNumber,
            phoneController: _phoneController),
      ),
    );
  }
}
