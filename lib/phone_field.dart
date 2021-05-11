import 'package:flutter/material.dart';
import 'style.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';

class PhoneField extends StatefulWidget {
  final Function returnNumber;
  final List<String> mask;
  PhoneField(this.returnNumber, this.mask);
  @override
  _PhoneFieldState createState() => _PhoneFieldState();
}

class _PhoneFieldState extends State<PhoneField> {
  MaskTextInputFormatter maskFormatter;
  String cleanNumber = '';
  final _phoneController = TextEditingController();

  void clearValue() {
    setState(() {
      _phoneController.clear();
      cleanNumber = '';
      widget.returnNumber('');
    });
  }

  @override
  void initState() {
    maskFormatter = new MaskTextInputFormatter(
        mask: widget.mask[0], filter: {"#": RegExp(r'[0-9]')});
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: TextFormField(
        autofocus: true,
        onChanged: (v) => setState(
          () {
            cleanNumber = v;
            widget.returnNumber(v);
          },
        ),
        inputFormatters: [maskFormatter],
        controller: _phoneController,
        keyboardType: TextInputType.phone,
        decoration: Style.phoneField(
            clearValue: clearValue,
            number: cleanNumber,
            phoneController: _phoneController,
            hintMask: widget.mask[1]),
      ),
    );
  }
}
