import 'package:flutter/material.dart';
import 'package:totalx_machine_task/auth/auth_service.dart';
import 'package:totalx_machine_task/presentation/screens/auth/widgets/auth_otp_timer.dart';
import 'package:totalx_machine_task/presentation/screens/auth/widgets/auth_show_image.dart';
import 'package:totalx_machine_task/presentation/screens/auth/widgets/custom_otp_field.dart';
import 'package:totalx_machine_task/presentation/screens/auth/widgets/custom_text_button.dart';
import 'package:totalx_machine_task/presentation/screens/auth/widgets/resend_otp_button.dart';
import 'package:totalx_machine_task/presentation/screens/home/home.dart';
import 'package:totalx_machine_task/presentation/widgets/const_space.dart';
import 'package:totalx_machine_task/presentation/widgets/custom_text_title.dart';
import 'package:otp_text_field/otp_field.dart';

class OTPScreen extends StatelessWidget {
  OTPScreen({super.key, required this.auth, required this.phoneNumber});
  final PhoneNumberAuthService auth;
  final String phoneNumber;
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final _otpController = OtpFieldController();
  final ValueNotifier<int> _timer = ValueNotifier(120);
  final ValueNotifier<String> otp = ValueNotifier('');

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
              const CustomAssetsImageWidget(imagePath: 'assets/otp.png'),
              const MyTextTitle(
                title: 'OTP Verification',
              ),
              k20Height,
              Text(
                'Enter the verification code we just sent to your number +91 *******${phoneNumber.substring(phoneNumber.length - 2)}.',
              ),
              k20Height,
              CustomOTPField(otpController: _otpController, otp: otp),
              k10Height,
              CustomOtpTimer(timer: _timer),
              k20Height,
              AuthResendOTPTextButton(
                timer: _timer,
                auth: auth,
                phoneNumber: phoneNumber,
              ),
              k30Height,
              CustomButton(
                onPressed: () {
                  _verfyOTP(otp.value, context);
                },
                child: 'Verify',
              ),
              flex(4),
            ],
          ),
        ),
      ),
    );
  }

  void _verfyOTP(String otp, BuildContext context) async {
    if (_timer.value == 0) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Otp is Expired'),
        ),
      );
    }
    if (otp.length == 6) {
      await auth.verifyOTP(smsCode: otp).then(
        (value) {
          if (auth.isLoggedIn()) {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                builder: (context) =>  HomeScreen(),
              ),
            );
          }
        },
      );
    }
  }
}
