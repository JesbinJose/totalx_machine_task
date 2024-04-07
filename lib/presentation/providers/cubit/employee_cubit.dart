import 'dart:typed_data';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:totalx_machine_task/data/models/employee_model.dart';
import 'package:totalx_machine_task/domain/usecases/add_employee.dart';
import 'package:totalx_machine_task/domain/usecases/get_employee.dart';

part 'employee_state.dart';

class EmployeeCubit extends Cubit<EmployeeState> {
  EmployeeCubit() : super(EmployeeInitial());
  void getEmployees(String query) async {
    final String lastId = state.employees.last.refId;
    late List<Employee> newEmployees;
    if (query.isEmpty) {
      newEmployees = await GetEmployee.getEmployees(lastId);
    } else {
      newEmployees = await GetEmployee.getEmployeeByName(lastId, query);
    }
    emit(EmployeeUpdated(employees: [...state.employees, ...newEmployees]));
  }

  void addEmployee(Uint8List image, String name, int age) async {
    final Employee employee = await AddEmployee.addEmployee(image, name, age);
    emit(EmployeeUpdated(employees: [...state.employees,employee]));
  }
}
