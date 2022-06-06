import 'package:cloud_firestore/cloud_firestore.dart';

class User {
  String id;
  final String title;
  final DateTime startDate;
  final DateTime endDate;
  final DateTime startTime;
  final DateTime endTime;
  final String description;

  User({
    this.id = '',
    required this.title,
    required this.startDate,
    required this.endDate,
    required this.startTime,
    required this.endTime,
    required this.description,
  });

  Map<String, dynamic> toJson() => {
    'id': id,
    'title': title,
    'startDate': startDate,
    'endDate': endDate,
    'startTime': startTime,
    'endTime': endTime,
    'description': description,
  };

   static User fromJson(Map<String, dynamic> json) => User(
     id: json['id'],
     title: json['title'],
     startDate: (json['startDate'] as Timestamp).toDate(),
     endDate: (json['endDate'] as Timestamp).toDate(),
     startTime: (json['startTime'] as Timestamp).toDate(),
     endTime: (json['endTime'] as Timestamp).toDate(),
     description: json['description'],
   );
}