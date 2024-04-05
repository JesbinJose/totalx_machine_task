
import 'package:flutter/material.dart';

class CustomAssetsImageWidget extends StatelessWidget {
  const CustomAssetsImageWidget({
    super.key,
    required this.imagePath,
  });
  final String imagePath;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.only(top: 40,bottom: 30),
        child: Image.asset(
          imagePath,
          width: MediaQuery.sizeOf(context).width * 0.35,
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}
