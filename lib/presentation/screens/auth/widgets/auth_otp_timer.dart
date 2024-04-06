
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomOtpTimer extends StatelessWidget {
  const CustomOtpTimer({
    super.key,
    required ValueNotifier<int> timer,
  }) : _timer = timer;

  final ValueNotifier<int> _timer;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: ValueListenableBuilder(
        valueListenable: _timer,
        builder: (context, value, child) {
          if (value > 0) {
            Future.delayed(const Duration(seconds: 1))
                .then((_) => _timer.value = value-1);
          }
          return Text(
            value != 0 ? '$value Sec' : 'OTP Timed out',
            style: TextStyle(
              color: Colors.red,
              fontFamily: GoogleFonts.montserrat().fontFamily,
              fontWeight: FontWeight.w600,
              fontSize: 11,
            ),
          );
        },
      ),
    );
  }
}
