import 'package:firebase_auth/firebase_auth.dart';

abstract class AuthService {
  Future<User> signIn({required String email, required String password});
  Future<void> register({required String email, required String password});
  Future<void> delete();
  Future<void> signOut();
  Future<void> updatePassword({
    required String newPassword,
    required String oldPassword,
  });
  Future<void> updateEmail({required String email, required String password});
  Future<String>? getCurrentUserId();
  Future<void> resetPassword({required String email});
  Future<void> confirmPasswordReset({
    required String code,
    required String newPassword,
  });
  Future<UserCredential> signInWithGoogle();
  Future<UserCredential> signInWithFacebook();
}
