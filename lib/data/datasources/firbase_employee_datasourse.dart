import 'dart:typed_data';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:totalx_machine_task/data/repositories/employee_repo.dart';

class EmployeeDataSource implements EmployeeFirbaseOperations {
  CollectionReference firestore =
      FirebaseFirestore.instance.collection('employees');
  @override
  Future<List<DocumentSnapshot>> getEmployee(DocumentSnapshot? lastId) async {
    var ref = firestore.orderBy('name').limit(10);
    if (lastId != null) ref = ref.startAfterDocument(lastId);
    return (await ref.get()).docs;
  }

  @override
  Future<bool> addEmployee(Map<String, dynamic> employeeData) async {
    try {
      firestore.add(employeeData);
      return true;
    } catch (e) {
      return false;
    }
  }

  @override
  Future<String> uploadImage(Uint8List image) async {
    String filename = "${DateTime.now().millisecondsSinceEpoch.toString()}.png";
    Reference storageRef = FirebaseStorage.instance.ref();
    Reference directoryReference = storageRef.child("images");
    Reference imgdirectoryReference = directoryReference.child(filename);

    try {
      final metadata = SettableMetadata(contentType: 'image/png');
      final UploadTask uploadTask =
          imgdirectoryReference.putData(image, metadata);
      final snapshot = await uploadTask.whenComplete(() => null);
      return await snapshot.ref.getDownloadURL();
    } catch (e) {
      return '';
    }
  }

  @override
  Future<bool> deleteEmployee(String documentID) {
    throw UnimplementedError();
  }

  @override
  Future<bool> editEmployee(
      Map<String, dynamic> employeeData, String documentID) {
    throw UnimplementedError();
  }
}
