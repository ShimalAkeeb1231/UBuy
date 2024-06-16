import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';


class AuthenticationService {
  final FirebaseAuth _firebaseAuth;

  AuthenticationService(this._firebaseAuth);

  Stream<User?> get authStateChanges => _firebaseAuth.authStateChanges();

  Future<void> signOut() async {
    await _firebaseAuth.signOut();
  }

  Future<String?> signIn({required String email, required String password}) async {
    try {
      await _firebaseAuth.signInWithEmailAndPassword(email: email, password: password);
      return "Signed in";
    } on FirebaseAuthException catch (e) {
      return e.message;
    }
  }

  Future<String?> signUp({required String email, required String password}) async {
    try {
      await _firebaseAuth.createUserWithEmailAndPassword(email: email, password: password);
      return "Signed up";
    } on FirebaseAuthException catch (e) {
      return e.message;
    }
  }

  User? getCurrentUser() {
    try {
      return _firebaseAuth.currentUser;
    } catch (e) {
      print('Error getting current user: $e');
      return null;
    }
  }

}

class FirestoreService {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<void> updateUserProfile(String userId, String username, String profileImageUrl) async {
    try {
      await _firestore.collection('users').doc(userId).set({
        'userId': userId, // Include userId in the document for reference
        'username': username,
        'profileImageUrl': profileImageUrl,
      });
    } catch (e) {
      print('Failed to update user profile: $e');
      throw e;
    }
  }

  Future<Map<String, dynamic>> getUserProfile(String userId) async {
    try {
      var snapshot = await _firestore.collection('users').doc(userId).get();
      return snapshot.data() as Map<String, dynamic>;
    } catch (e) {
      print('Failed to get user profile: $e');
      throw e;
    }
  }
}