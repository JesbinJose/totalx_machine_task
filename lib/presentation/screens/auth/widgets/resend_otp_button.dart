import 'package:flutter/material.dart';
import 'package:totalx_machine_task/auth/auth_service.dart';

class AuthResendOTPTextButton extends StatelessWidget {
  const AuthResendOTPTextButton({
    super.key,
    required ValueNotifier<int> timer,
    required this.auth,
    required this.phoneNumber,
  }) : _timer = timer;

  final ValueNotifier<int> _timer;
  final PhoneNumberAuthService auth;
  final String phoneNumber;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Text('Don\'t Get OTP? '),
        InkWell(
          onTap: () {
            if (_timer.value != 0) {
              _timer.value == 120;
              auth.signInWithPhoneNumber(phoneNumber, context);
            }
          },
          child: Text(
            'Resend',
            style: Theme.of(context).textTheme.labelSmall?.copyWith(
                  decoration: TextDecoration.underline,
                ),
          ),
        ),
      ],
    );
  }
}
