import 'dart:typed_data';

import 'package:cloud_firestore/cloud_firestore.dart';

abstract class EmployeeFirbaseOperations {
  Future<List<DocumentSnapshot>> getEmployee(DocumentSnapshot lastID);
  Future<bool> addEmployee(Map<String, dynamic> employeeData);
  Future<bool> editEmployee(Map<String, dynamic> employeeData, String documentID);
  Future<bool> deleteEmployee(String documentID);
  Future<String> uploadImage(Uint8List image);
}
