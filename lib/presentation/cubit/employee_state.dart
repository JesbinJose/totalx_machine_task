part of 'employee_cubit.dart';

sealed class EmployeeState {
  final List<Employee> employees;
  final bool isLoading;
  EmployeeState({
    required this.employees,
    this.isLoading = false,
  });
}

final class EmployeeInitial extends EmployeeState {
  EmployeeInitial() : super(employees: []);
}

final class EmployeeUpdated extends EmployeeState {
  EmployeeUpdated({required super.employees,super.isLoading});
}
