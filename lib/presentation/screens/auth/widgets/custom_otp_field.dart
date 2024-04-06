
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:otp_text_field/otp_field.dart';
import 'package:otp_text_field/otp_field_style.dart';
import 'package:otp_text_field/style.dart';

class CustomOTPField extends StatelessWidget {
  const CustomOTPField({
    super.key,
    required OtpFieldController otpController,
    required this.otp,
  }) : _otpController = otpController;

  final OtpFieldController _otpController;
  final ValueNotifier<String> otp;

  @override
  Widget build(BuildContext context) {
    return OTPTextField(
      controller: _otpController,
      length: 6,
      width: MediaQuery.sizeOf(context).width * .9,
      otpFieldStyle: OtpFieldStyle(focusBorderColor: Colors.black),
      fieldStyle: FieldStyle.box,
      onChanged: (value) => otp.value = value,
      fieldWidth: 45,
      textFieldAlignment: MainAxisAlignment.center,
      spaceBetween: 12,
      style: const TextStyle(
        fontSize: 20,
        fontWeight: FontWeight.bold,
        color: Color(0xFFFF5454),
      ),
      inputFormatter: [FilteringTextInputFormatter.digitsOnly],
    );
  }
}
