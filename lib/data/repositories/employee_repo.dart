import 'dart:typed_data';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:totalx_machine_task/data/models/age_enum.dart';

abstract class EmployeeFirbaseOperations {
  Future<List<DocumentSnapshot>> getEmployee(DocumentSnapshot lastID);
  Future<List<DocumentSnapshot>> getEmployeeByName(DocumentSnapshot lastID, String name);
  Future<List<DocumentSnapshot>> getEmployeeByAge(DocumentSnapshot lastID,Selection age);
  Future<String?> addEmployee(Map<String, dynamic> employeeData);
  Future<bool> editEmployee(Map<String, dynamic> employeeData, String documentID);
  Future<bool> deleteEmployee(String documentID);
  Future<String> uploadImage(Uint8List image);
}
