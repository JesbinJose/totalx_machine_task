import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:totalx_machine_task/auth/auth_service.dart';
import 'package:totalx_machine_task/presentation/screens/auth/widgets/auth_show_image.dart';
import 'package:totalx_machine_task/presentation/widgets/const_space.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({super.key});
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _phoneNumberController = TextEditingController();
  final PhoneNumberAuthService _auth = PhoneNumberAuthService();

  @override
  Widget build(BuildContext context) {
    final TextTheme textTheme = Theme.of(context).textTheme;
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
              Text(
                'Enter Phone Number',
                style: textTheme.titleMedium,
              ),
              k20Height,
              TextFormField(
                autovalidateMode: AutovalidateMode.onUserInteraction,
                decoration: InputDecoration(
                  hintText: "Enter Phone Number",
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                ),
                validator: (value) {
                  if (value?.length != 10) return 'Please a valid phone number';
                  return null;
                },
              ),
              k20Height,
              RichText(
                text: TextSpan(
                  children: [
                    TextSpan(
                      text: "By Continuing, I agree to TotalX's ",
                      style: textTheme.displaySmall,
                    ),
                    TextSpan(
                      text: "Terms and condition",
                      style: textTheme.labelSmall,
                    ),
                    TextSpan(
                      text: " & ",
                      style: textTheme.displaySmall,
                    ),
                    TextSpan(
                      text: "privacy policy",
                      style: textTheme.labelSmall,
                    ),
                  ],
                ),
              ),
              k30Height,
              ElevatedButton(
                onPressed: () {
                  if (_formKey.currentState?.validate() ?? false) {
                    _sendOTP(
                      context,
                      _phoneNumberController.text,
                    );
                  }
                },
                child: SizedBox(
                  width: MediaQuery.sizeOf(context).width * .75,
                  height: 44,
                  child: const Center(
                    child: Text("Login"),
                  ),
                ),
              ),
              flex(4),
            ],
          ),
        ),
      ),
    );
  }

  void _sendOTP(BuildContext context, String phoneNumber) async {
    await _auth
        .signInWithPhoneNumber("+91$phoneNumber", context)
        .then((value) {
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
