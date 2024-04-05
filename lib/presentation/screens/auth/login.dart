import 'package:flutter/material.dart';
import 'package:totalx_machine_task/auth/auth_service.dart';
import 'package:totalx_machine_task/presentation/screens/auth/widgets/auth_phone_num_field.dart';
import 'package:totalx_machine_task/presentation/screens/auth/widgets/auth_show_image.dart';
import 'package:totalx_machine_task/presentation/screens/auth/widgets/custom_terms_text.dart';
import 'package:totalx_machine_task/presentation/screens/auth/widgets/custom_text_button.dart';
import 'package:totalx_machine_task/presentation/widgets/const_space.dart';
import 'package:totalx_machine_task/presentation/widgets/custom_text_title.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({super.key});
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _phoneNumberController = TextEditingController();
  final PhoneNumberAuthService _auth = PhoneNumberAuthService();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Form(
        key: _formKey,
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              flex(1),
              const CustomAssetsImageWidget(imagePath: 'assets/phone.png'),
              const MyTextTitle(
                title: 'Enter Phone Number',
              ),
              k20Height,
              CustomPhoneNumberTextField(
                phoneNumberController: _phoneNumberController,
              ),
              k20Height,
              const CustomAuthTermsText(),
              k30Height,
              CustomButton(
                onPressed: () {
                  if (_formKey.currentState?.validate() ?? false) {
                    _sendOTP(
                      context,
                      _phoneNumberController.text,
                    );
                  }
                },
                child: 'Get OTP',
              ),
              flex(4),
            ],
          ),
        ),
      ),
    );
  }

  void _sendOTP(BuildContext context, String phoneNumber) async {
    // Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => ,))
    await _auth.signInWithPhoneNumber("+91$phoneNumber", context).then((value) {
      if (value) {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) => Scaffold(),
          ),
        );
      }
    });
  }
}
