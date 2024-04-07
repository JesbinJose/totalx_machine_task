import 'package:flutter/material.dart';
import 'package:totalx_machine_task/data/models/employee_model.dart';

class CustomListTile extends StatelessWidget {
  const CustomListTile({
    super.key,
    required this.employee,
  });
  final Employee employee;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(
        vertical: 4,
        horizontal: 12,
      ),
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.2),
            spreadRadius: 2.0,
            blurRadius: 5.0,
          ),
        ],
      ),
      child: ListTile(
        leading: CircleAvatar(
          backgroundImage: NetworkImage(
            employee.imageUrl,
          ),
        ),
        title: Text(employee.name),
        subtitle: Text('Age ${employee.age}'),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15.0),
        ),
      ),
    );
  }
}
