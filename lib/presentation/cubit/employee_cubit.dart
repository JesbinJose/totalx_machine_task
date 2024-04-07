import 'dart:typed_data';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:totalx_machine_task/data/models/age_enum.dart';
import 'package:totalx_machine_task/data/models/employee_model.dart';
import 'package:totalx_machine_task/domain/usecases/add_employee.dart';
import 'package:totalx_machine_task/domain/usecases/get_employee.dart';

part 'employee_state.dart';

class EmployeeCubit extends Cubit<EmployeeState> {
  EmployeeCubit() : super(EmployeeInitial());
  Future<void> getEmployees(String query) async {
    final String? lastId =
        state.employees.isEmpty ? null : state.employees.last.refId;
    late List<Employee> newEmployees;
    if (query.isEmpty) {
      newEmployees = await GetEmployee.getEmployees(lastId);
    } else {
      newEmployees = await GetEmployee.getEmployeeByName(lastId, query);
    }
    for (var employee in state.employees) {
      if (newEmployees.every((element) => element.refId != employee.refId)) {
        newEmployees.add(employee);
      }
    }
    emit(EmployeeUpdated(employees: newEmployees));
  }

  Future<void> searchEmployees(String query) async {
    emit(
      EmployeeUpdated(
        employees: await GetEmployee.getEmployeeByName(null, query),
      ),
    );
  }

  Future<void> searchEmployeesbyAge(Selection age) async {
    List<Employee> employees = [];
    if (age == Selection.all) {
      employees = await GetEmployee.getEmployeeByAge(null, age);
    } else {
      for (Employee e in await GetEmployee.getEmployeeByAge(null, age)) {
        if (e.age < 60 && age == Selection.younger) {
          employees.add(e);
        } else if (e.age > 60 && age == Selection.elder) {
          employees.add(e);
        }
      }
    }
    emit(
      EmployeeUpdated(
        employees: employees,
        isLoading: false,
      ),
    );
  }

  Future<void> addEmployee(Uint8List? image, String name, int age) async {
    await AddEmployee.addEmployee(image, name, age);
    emit(EmployeeUpdated(
      employees: [...state.employees],
    ));
  }
}
