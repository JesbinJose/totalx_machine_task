
import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:totalx_machine_task/domain/usecases/pick_image.dart';
import 'package:totalx_machine_task/presentation/screens/home/widgets/no_image_button.dart';

class PickImageButton extends StatelessWidget {
  const PickImageButton({
    super.key,
    required ValueNotifier<Uint8List?> image,
  }) : _image = image;

  final ValueNotifier<Uint8List?> _image;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () async => _image.value = await PickImage().camera(),
      child: ValueListenableBuilder(
        valueListenable: _image,
        builder: (context, value, child) {
          if (value == null) {
            return const CustomNoImageButton();
          }
          return CircleAvatar(
            radius: 40,
            backgroundImage: MemoryImage(
              value,
            ),
          );
        },
      ),
    );
  }
}
