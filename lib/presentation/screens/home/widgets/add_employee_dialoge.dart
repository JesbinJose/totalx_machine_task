import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:totalx_machine_task/presentation/screens/home/widgets/add_employee_dialoge_actions.dart';
import 'package:totalx_machine_task/presentation/screens/home/widgets/pick_image_button.dart';

class AddEmployeeDialog extends StatelessWidget {
  AddEmployeeDialog({
    super.key,
  });
  final ValueNotifier<Uint8List?> _image = ValueNotifier(null);
  final TextEditingController _nameContoller = TextEditingController();
  final TextEditingController _ageContoller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return SimpleDialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      title: const Text("Add a New User"),
      children: [
        PickImageButton(image: _image),
        const Text('  Name'),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: SizedBox(
            height: 40,
            child: TextField(
              controller: _nameContoller,
              textAlignVertical: TextAlignVertical.top,
              decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: const BorderSide(color: Colors.black),
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
            ),
          ),
        ),
        const Text('  Age'),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: SizedBox(
            height: 40,
            child: TextField(
              keyboardType: TextInputType.number,
              textAlignVertical: TextAlignVertical.top,
              inputFormatters: [FilteringTextInputFormatter.digitsOnly],
              controller: _ageContoller,
              decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: const BorderSide(color: Colors.black),
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
            ),
          ),
        ),
        AddEmployeeDialogeActions(
          image: _image,
          nameContoller: _nameContoller,
          ageContoller: _ageContoller,
        ),
      ],
    );
  }
}
