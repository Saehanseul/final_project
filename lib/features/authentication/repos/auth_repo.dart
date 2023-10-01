import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class AuthenticationRepository {
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;

  bool get isLoggedIn => _firebaseAuth.currentUser != null;

  Future<UserCredential> emailSignUp({
    required String email,
    required String password,
  }) async {
    return await _firebaseAuth.createUserWithEmailAndPassword(
      email: email,
      password: password,
    );
  }

  Future<void> signOut() async {
    await _firebaseAuth.signOut();
  }

  Future<UserCredential> signIn(
      {required String email, required String password}) async {
    final res = await _firebaseAuth.signInWithEmailAndPassword(
      email: email,
      password: password,
    );
    print("res: $res");
    return res;
  }
}

final authRepo = Provider((ref) => AuthenticationRepository());
