import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:totalx_machine_task/presentation/cubit/employee_cubit.dart';
import 'package:totalx_machine_task/presentation/screens/home/widgets/custom_list_tile.dart';

class CustomEmployeeList extends StatelessWidget {
  const CustomEmployeeList({
    super.key,
    required this.state,
    required TextEditingController name,
  }) : _name = name;
  final EmployeeState state;
  final TextEditingController _name;
  @override
  Widget build(BuildContext context) {
    return SliverList(
      delegate: SliverChildBuilderDelegate(
        (context, index) {
          if (index < state.employees.length) {
            return CustomListTile(employee: state.employees[index]);
          }
          if (_name.text.isEmpty && !state.isLoading) {
            context.read<EmployeeCubit>().getEmployees('');
          }
          if (state.employees.isEmpty) return const Center(child: Text('NO Users data found'),);
          return const SizedBox();
        },
        childCount: state.employees.length + 1,
      ),
    );
  }
}
