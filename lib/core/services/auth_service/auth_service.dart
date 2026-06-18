abstract class AuthService {
  Future<void> signIn({required String email, required String password});
  Future<void> register({required String email, required String password});
  Future<void> delete();
  Future<void> signOut();
  Future<void> updatePassword({required String newPassword});
}
