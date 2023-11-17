import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../utils/colors.dart';
import '../utils/constants.dart';

typedef callBackForOtp = void Function(bool isAllFieldsFilled);
class OTPTextField extends StatefulWidget {
  callBackForOtp isVerified;
  OTPTextField({super.key, required this.isVerified});

  @override
  OTPTextFieldState createState() => OTPTextFieldState();
}

class OTPTextFieldState extends State<OTPTextField> {
  late List<TextEditingController> _controllers;


  @override
  void initState() {
        _controllers = List.generate(6, (index) => TextEditingController());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SafeArea(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            _textFieldOTP(first: true, last: false,controller:_controllers[0]),
            _textFieldOTP(first: false, last: false,controller:_controllers[1]),
            _textFieldOTP(first: false, last: false,controller:_controllers[2]),
            _textFieldOTP(first: false, last: false,controller:_controllers[3]),
            _textFieldOTP(first: false, last: false,controller:_controllers[4]),
            _textFieldOTP(first: false, last: true,controller:_controllers[5]),
          ],
        ),
      ),
    );
  }

  bool isAllFieldsFilled() {
    return _controllers.every((controller) => controller.text.length == 1);
  }
  Widget _textFieldOTP({required bool first, last,required TextEditingController controller}) {
    return Expanded(
      child: Container(
        height: 100,
        width: 10,
        padding: const EdgeInsets.all(5.0),
        child: TextField(
          maxLength: 1,
          inputFormatters: <TextInputFormatter>[
            FilteringTextInputFormatter.digitsOnly
          ],
          controller: controller,
          onChanged: (value) {
            if (value.length == 1 && last == false) {
              FocusScope.of(context).nextFocus();
            }
            if (value.isEmpty && first == false) {
              FocusScope.of(context).previousFocus();
            }
            
            if(last==true && value.isNotEmpty){
              FocusScope.of(context).unfocus();
            }
             setState(() {
                widget.isVerified(isAllFieldsFilled());
              });
            
                          
          },
          showCursor: true,
          readOnly: false,
          textAlign: TextAlign.center,
          style:  const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
          keyboardType: TextInputType.number,
          decoration: InputDecoration(
            counterText: '',
            enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(width: 1, color: AppColors.grey12),
                borderRadius: BorderRadius.circular(4)),
            focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(width: 1, color: AppColors.primary),
                borderRadius: BorderRadius.circular(4)),
          ),
        ),

      ),
    );
  }
}
