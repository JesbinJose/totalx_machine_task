import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CustomNoImageButton extends StatelessWidget {
  const CustomNoImageButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.bottomCenter,
      children: [
        Padding(
          padding: const EdgeInsets.only(bottom: 10),
          child: CircleAvatar(
            radius: 40,
            backgroundColor: Colors.blue[700],
            child: const Icon(
              CupertinoIcons.person_solid,
              color: Colors.white,
              size: 60,
            ),
          ),
        ),
        ClipPath(
          clipper: BottomThirdCircleClipper(),
          child: Container(
            width: 90,
            height: 90,
            decoration: BoxDecoration(
              color: Colors.black.withOpacity(0.4),
              shape: BoxShape.circle,
            ),
          ),
        ),
        const Padding(
          padding: EdgeInsets.only(bottom: 2),
          child: Icon(Icons.camera_alt_outlined),
        )
      ],
    );
  }
}

class BottomThirdCircleClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    final path = Path();
    path.moveTo(size.width / 2, size.height);
    path.arcToPoint(
      Offset(0, size.height),
      clockwise: false,
    );
    path.lineTo(0, (size.height * 2) / 3);
    path.lineTo(size.width * 3, (size.height * 2) / 3);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(oldClipper) => false;
}
