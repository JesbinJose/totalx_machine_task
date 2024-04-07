part of 'employee_cubit.dart';

sealed class EmployeeState {
  List<Employee> employees;

  EmployeeState({required this.employees});
}

final class EmployeeInitial extends EmployeeState {
  EmployeeInitial() : super(employees: []);
}

final class EmployeeUpdated extends EmployeeState {
  EmployeeUpdated({required super.employees});
}
