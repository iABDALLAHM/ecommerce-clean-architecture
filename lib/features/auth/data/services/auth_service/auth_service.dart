import 'package:firebase_auth/firebase_auth.dart';

abstract class AuthService {
  Future<User> signIn({required String email, required String password});
  Future<void> register({required String email, required String password});
  Future<void> delete();
  Future<void> signOut();
  Future<void> updatePassword({required String newPassword});
  Future<String> getCurrentUserId();
}
