
import 'package:flutter/material.dart';

class CustomAuthTermsText extends StatelessWidget {
  const CustomAuthTermsText({
    super.key,
  });


  @override
  Widget build(BuildContext context) {
  final TextTheme textTheme =  Theme.of(context).textTheme;
    return RichText(
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
    );
  }
}
