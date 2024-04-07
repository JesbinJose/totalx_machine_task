import 'dart:typed_data';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:totalx_machine_task/data/models/age_enum.dart';
import 'package:totalx_machine_task/data/repositories/employee_repo.dart';

class EmployeeDataSource implements EmployeeFirbaseOperations {
  CollectionReference firestore =
      FirebaseFirestore.instance.collection('employees');
  @override
  Future<List<DocumentSnapshot>> getEmployee(DocumentSnapshot? lastId) async {
    var ref = firestore.orderBy('image_url').limit(10);
    if (lastId != null) ref = ref.startAfterDocument(lastId);
    return (await ref.get()).docs;
  }

  @override
  Future<List<DocumentSnapshot>> getEmployeeByName(
      DocumentSnapshot? lastID, String name) async {
    var ref = firestore
        .where('name', isGreaterThanOrEqualTo: name)
        .where('name', isLessThan: '$name\uf8ff');
    if (lastID != null) ref = ref.startAfterDocument(lastID);
    return (await ref.get()).docs;
  }

  @override
  Future<String?> addEmployee(Map<String, dynamic> employeeData) async {
    try {
      final DocumentReference ref = await firestore.add(employeeData);
      return ref.id;
    } catch (e) {
      return null;
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

  @override
  Future<List<DocumentSnapshot<Object?>>> getEmployeeByAge(
      DocumentSnapshot? lastID, Selection age) async {
    List<DocumentSnapshot<Object?>> res = (await firestore.get()).docs;
    List<DocumentSnapshot<Object?>> result = [];
    for (var i in res) {
      switch (age) {
        case Selection.elder:
          if (i['age'] as int > 60) result.add(i);
          continue;
        case Selection.younger:
          if (i['age'] as int < 60) result.add(i);
          continue;
        default:
          break;
      }
    }
    return result;
  }
}
