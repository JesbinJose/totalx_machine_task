import 'package:cloud_firestore/cloud_firestore.dart';

class Employee {
  final String refId;
  final String name;
  final String imageUrl;
  final int age;
  Employee({
    required this.refId,
    required this.name,
    required this.age,
    required this.imageUrl,
  });

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'age': age,
      'image_url': imageUrl,
    };
  }

  Employee.fromFirestore(DocumentSnapshot doc)
      : refId = doc.id,
        name = doc.get('name') as String,
        age = doc.get('age') as int,
        imageUrl = doc.get('image_url') as String;

  Employee copyWith({
    String? refId,
    String? name,
    String? imageUrl,
    int? age,
  }) {
    return Employee(
      refId: refId ?? this.refId,
      name: name ?? this.name,
      imageUrl: imageUrl ?? this.imageUrl,
      age: age ?? this.age,
    );
  }
}
