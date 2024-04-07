import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:totalx_machine_task/data/datasources/firbase_employee_datasourse.dart';
import 'package:totalx_machine_task/data/models/age_enum.dart';
import 'package:totalx_machine_task/data/models/employee_model.dart';

class GetEmployee {
  static Future<List<Employee>> getEmployees(String? id) async {
    final DocumentSnapshot? lastDoc = id != null
        ? await FirebaseFirestore.instance.collection('employees').doc(id).get()
        : null;

    final List<DocumentSnapshot> docs =
        await EmployeeDataSource().getEmployee(lastDoc);

    List<Employee> employees = List.generate(
      docs.length,
      (index) => Employee.fromFirestore(
        docs[index],
      ),
    );

    return employees;
  }

  static Future<List<Employee>> getEmployeeByName(
    String? id,
    String name,
  ) async {
    final DocumentSnapshot? lastDoc = id != null
        ? await FirebaseFirestore.instance.collection('employees').doc(id).get()
        : null;

    final List<DocumentSnapshot> docs =
        await EmployeeDataSource().getEmployeeByName(
      lastDoc,
      name,
    );

    List<Employee> employees = List.generate(
      docs.length,
      (index) => Employee.fromFirestore(
        docs[index],
      ),
    );
    
    return employees;
  }
  static Future<List<Employee>> getEmployeeByAge(
    String? id,
    Selection age,
  ) async {
    final List<DocumentSnapshot> docs =
        await EmployeeDataSource().getEmployeeByAge(
      null,
      age,
    );

    List<Employee> employees = List.generate(
      docs.length,
      (index) => Employee.fromFirestore(
        docs[index],
      ),
    );
    
    return employees;
  }
}
