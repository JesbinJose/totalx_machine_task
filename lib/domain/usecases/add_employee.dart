import 'dart:typed_data';

import 'package:totalx_machine_task/data/datasources/firbase_employee_datasourse.dart';
import 'package:totalx_machine_task/data/models/employee_model.dart';

class AddEmployee {
  static Future<Employee> addEmployee(
      Uint8List? image, String name, int age) async {
    String imageUrl =
        'profile.png?alt=media&token=f6ad7c03-a00b-4b4d-89d4-04d54ccc187b';
    if (image != null) imageUrl = await EmployeeDataSource().uploadImage(image);
    final Employee newEmployee = Employee(
      refId: '',
      name: name,
      age: age,
      imageUrl: imageUrl,
    );
    final refId = await EmployeeDataSource().addEmployee(newEmployee.toMap());
    return newEmployee.copyWith(refId: refId);
  }
}
