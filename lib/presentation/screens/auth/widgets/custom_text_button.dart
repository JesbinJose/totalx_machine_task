import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({
    super.key,
    required this.onPressed,
    required this.child,
  });

  final Function onPressed;
  final String child;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () async {
        onPressed();
      },
      child: SizedBox(
        width: MediaQuery.sizeOf(context).width * .75,
        height: 44,
        child: Center(
          child: Text(child),
        ),
      ),
    );
  }
}
