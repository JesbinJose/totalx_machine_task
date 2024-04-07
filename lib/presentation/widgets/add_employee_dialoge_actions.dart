import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:totalx_machine_task/domain/usecases/add_employee.dart';
import 'package:totalx_machine_task/presentation/providers/cubit/employee_cubit.dart';
import 'package:totalx_machine_task/presentation/widgets/const_space.dart';

class AddEmployeeDialogeActions extends StatelessWidget {
  const AddEmployeeDialogeActions({
    super.key,
    required ValueNotifier<Uint8List?> image,
    required TextEditingController nameContoller,
    required TextEditingController ageContoller,
  }) : _image = image, _nameContoller = nameContoller, _ageContoller = ageContoller;

  final ValueNotifier<Uint8List?> _image;
  final TextEditingController _nameContoller;
  final TextEditingController _ageContoller;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        InkWell(
          onTap: () => Navigator.pop(context),
          child: Container(
            width: 80,
            height: 30,
            decoration: BoxDecoration(
              color: const Color(0xFFCCCCCC),
              borderRadius: BorderRadius.circular(10),
            ),
            child: const Center(
              child: Text(
                'Cancel',
                style: TextStyle(
                  color: Color(0xFF000000),
                ),
              ),
            ),
          ),
        ),
        k10Width,
        InkWell(
          onTap: () async {
            await AddEmployee.addEmployee(_image.value, _nameContoller.text,
                    int.parse(_ageContoller.text))
                .then((value) {
              Navigator.pop(context);
              context.read<EmployeeCubit>().getEmployees('');
            });
          },
          child: Container(
            width: 80,
            height: 30,
            decoration: BoxDecoration(
              color: const Color(0xFF1782FF),
              borderRadius: BorderRadius.circular(10),
            ),
            child: const Center(
              child: Text(
                'Save',
                style: TextStyle(color: Colors.white),
              ),
            ),
          ),
        ),
        k10Width,
      ],
    );
  }
}
