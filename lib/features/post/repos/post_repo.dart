import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class PostRepo {
  final FirebaseFirestore _db = FirebaseFirestore.instance;

  Future<void> addPost({
    required String text,
    required String mood,
  }) async {
    await _db.collection("posts").add({
      "text": text,
      "mood": mood,
      "createdAt": DateTime.now(),
    });
  }

  Future<QuerySnapshot<Map<String, dynamic>>> getPosts() async {
    return await _db
        .collection("posts")
        .orderBy("createdAt", descending: true)
        .get();
  }

  Future<void> deletePost(String docId) async {
    await _db.collection("posts").doc(docId).delete();
  }
}

final postRepo = Provider((ref) => PostRepo());
