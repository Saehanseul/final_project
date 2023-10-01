import 'package:cloud_firestore/cloud_firestore.dart';

class PostModel {
  final String id;
  final String text;
  final String mood;
  final Timestamp createdAt;

  PostModel({
    required this.id,
    required this.text,
    required this.mood,
    required this.createdAt,
  });

  PostModel.fromJson(Map<String, dynamic> json)
      : id = json["id"],
        text = json["text"],
        mood = json["mood"],
        createdAt = json["createdAt"];

  Map<String, dynamic> toJson() => {
        "id": id,
        "text": text,
        "mood": mood,
        "createdAt": createdAt,
      };
}
