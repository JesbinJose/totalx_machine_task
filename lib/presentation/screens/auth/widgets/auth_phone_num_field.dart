
import 'package:flutter/material.dart';

class CustomPhoneNumberTextField extends StatelessWidget {
  const CustomPhoneNumberTextField({
    super.key,
    required TextEditingController phoneNumberController,
  }) : _phoneNumberController = phoneNumberController;

  final TextEditingController _phoneNumberController;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: _phoneNumberController,
      autovalidateMode: AutovalidateMode.onUserInteraction,
      decoration: InputDecoration(
        hintText: "Enter Phone Number *",
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10.0),
        ),
      ),
      validator: (value) {
        if (value?.length != 10) return 'Please a valid phone number';
        return null;
      },
    );
  }
}
