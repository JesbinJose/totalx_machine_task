import 'package:flutter/material.dart';

class ShowLoactionText extends StatelessWidget {
  const ShowLoactionText({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Row(
      children: [
        Icon(
          Icons.location_on_sharp,
          size: 15,
        ),
        Text(
          ' Nilambur',
        ),
      ],
    );
  }
}
