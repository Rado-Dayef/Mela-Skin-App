import 'package:firebase_auth/firebase_auth.dart';
import 'package:mela_skin/constants/extensions.dart';

class FirebaseAuthServices {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  /// Sign Up Function.
  Future<User?> signUp({required String email, required String password}) async {
    try {
      UserCredential userCredential = await _auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      return userCredential.user;
    } catch (error) {
      error.toString().showToast;
      return null;
    }
  }

  /// Sign In Function.
  Future<User?> signIn({required String email, required String password}) async {
    try {
      UserCredential userCredential = await _auth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      return userCredential.user;
    } catch (error) {
      error.toString().showToast;
      return null;
    }
  }

  /// Sign Out Function.
  Future<int> signOut() async {
    try {
      await _auth.signOut();
      return 1;
    } catch (error) {
      error.toString().showToast;
      return -1;
    }
  }

  /// Get Current User.
  User? getCurrentUser() {
    try {
      return _auth.currentUser;
    } catch (error) {
      error.toString().showToast;
      return null;
    }
  }

  /// Password Reset Function.
  Future<int> resetPassword({required String email}) async {
    try {
      await _auth.sendPasswordResetEmail(email: email);
      return 1;
    } catch (error) {
      error.toString().showToast;
      return -1;
    }
  }

  /// Email Verification Function.
  Future<int> sendEmailVerification(User user) async {
    try {
      await user.sendEmailVerification();
      return 1;
    } catch (error) {
      error.toString().showToast;
      return -1;
    }
  }
}
