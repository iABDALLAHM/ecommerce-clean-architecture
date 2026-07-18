import 'dart:developer';
import 'package:ecommerce_clean_architecture/core/errors/custom_exception.dart';
import 'package:ecommerce_clean_architecture/features/auth/data/services/auth_service/auth_service.dart';
import 'package:firebase_auth/firebase_auth.dart';

class FirebaseAuthService implements AuthService {
  final FirebaseAuth firebaseAuth;

  FirebaseAuthService({required this.firebaseAuth});

  @override
  Future<User> register({
    required String email,
    required String password,
  }) async {
    try {
      final credential = await firebaseAuth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      return credential.user!;
    } on FirebaseAuthException catch (e) {
      log(
        "error happend in FirebaseAuthService in Register method please check it, the error: $e",
      );
      if (e.code == 'weak-password') {
        throw CustomException(exceptionMeassge: "هذا الباسورد ضعيف");
      } else if (e.code == 'email-already-in-use') {
        throw CustomException(exceptionMeassge: "هذا الإيميل مستخدم بالفعل");
      } else if (e.code == 'invalid-email') {
        throw CustomException(
          exceptionMeassge:
              "الايميل او الباسورد غير صحيح برجاء المحاولة مرة آخرى",
        );
      } else if (e.code == "network-request-failed") {
        throw CustomException(exceptionMeassge: "لا يوجد اتصال بالإنترنت");
      } else {
        throw CustomException(
          exceptionMeassge: "حدث خطأ ما برجاء المحاولة مرة آخرى",
        );
      }
    } catch (e) {
      log(
        "error happend in FirebaseAuthService in Register method please check it, the error: $e",
      );
      throw CustomException(
        exceptionMeassge: "حدث خطأ ما برجاء المحاولة مرة آخرى",
      );
    }
  }

  @override
  Future<User> signIn({required String email, required String password}) async {
    try {
      final credential = await firebaseAuth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      return credential.user!;
    } on FirebaseAuthException catch (e) {
      log(
        "error happend in FirebaseAuthService in signIn method please check it, the error: $e",
      );
      if (e.code == 'user-not-found') {
        throw CustomException(
          exceptionMeassge: "هذا المستخدم غير موجود بالفعل",
        );
      } else if (e.code == 'wrong-password') {
        throw CustomException(
          exceptionMeassge:
              "الايميل او الباسورد غير صحيح برجاء المحاولة مرة اخرى",
        );
      } else if (e.code == "network-request-failed") {
        throw CustomException(exceptionMeassge: "لا يوجد اتصال بالإنترنت");
      } else {
        throw CustomException(
          exceptionMeassge: "لقد حدث خطأ ما برجاء المحاولة مرة اخرى",
        );
      }
    } catch (e) {
      log(
        "error happend in FirebaseAuthService in signIn method please check it, the error: $e",
      );
      throw CustomException(
        exceptionMeassge: "لقد حدث خطأ ما برجاء المحاولة مرة اخرى",
      );
    }
  }

  @override
  Future<void> delete() async {
    try {
      await firebaseAuth.currentUser!.delete();
    } catch (e) {
      log(
        "error happend in FirebaseAuthService in delete method please check it, the error: $e",
      );
      throw CustomException(
        exceptionMeassge: "لقد حدث خطأ ما برجاء المحاولة مرة اخرى",
      );
    }
  }

  @override
  Future<void> signOut() async {
    try {
      await firebaseAuth.signOut();
    } catch (e) {
      log(
        "error happend in FirebaseAuthService in signOut method please check it, the error: $e",
      );
      throw CustomException(
        exceptionMeassge: "لقد حدث خطأ ما برجاء المحاولة مرة اخرى",
      );
    }
  }

  @override
  Future<void> updatePassword({
    required String newPassword,
    required String oldPassword,
  }) async {
    try {
      final user = firebaseAuth.currentUser!;
      final credential = EmailAuthProvider.credential(
        email: user.email!,
        password: oldPassword,
      );
      await user.reauthenticateWithCredential(credential);
      await user.updatePassword(newPassword);
    } on FirebaseAuthException catch (e) {
      log(
        "error happend in FirebaseAuthService in updatePassword method please check it, the error: $e",
      );
      if (e.code == "invalid-credential") {
        throw CustomException(
          exceptionMeassge: "حدث خطأ ما برجاء المحاولة مرة آخرى",
        );
      } else {
        throw CustomException(
          exceptionMeassge: "حدث خطأ ما برجاء المحاولة مرة آخرى",
        );
      }
    } catch (e) {
      log(
        "error happend in FirebaseAuthService in updatePassword method please check it, the error: $e",
      );
      throw CustomException(
        exceptionMeassge: "لقد حدث خطأ ما برجاء المحاولة مرة اخرى",
      );
    }
  }

  @override
  Future<String> getCurrentUserId() async {
    try {
      var userId = firebaseAuth.currentUser;

      if (userId == null) {
        throw CustomException(
          exceptionMeassge: "لقد حدث خطأ ما برجاء المحاولة مرة اخرى",
        );
      }
      return userId.uid;
    } catch (e) {
      log(
        "error happend in FirebaseAuthService in getCurrentUserId method please check it, the error: $e",
      );
      throw CustomException(
        exceptionMeassge: "لقد حدث خطأ ما برجاء المحاولة مرة اخرى",
      );
    }
  }

  @override
  Future<void> resetPassword({required String email}) async {
    try {
      await firebaseAuth.sendPasswordResetEmail(email: email);
    } on FirebaseAuthException catch (e) {
      log(
        "error happend in FirebaseAuthService in resetPassword method please check it, the error: $e",
      );
      throw CustomException(
        exceptionMeassge: "لقد حدث خطأ ما برجاء المحاولة مرة اخرى",
      );
    }
  }

  @override
  Future<void> updateEmail({
    required String email,
    required String password,
  }) async {
    try {
      final user = firebaseAuth.currentUser!;
      final credential = EmailAuthProvider.credential(
        email: user.email!,
        password: password,
      );
      await user.reauthenticateWithCredential(credential);
      await user.verifyBeforeUpdateEmail(email);
      // await user.updateEmail(newEmail); // لسه لم تطبق!
    } on FirebaseAuthException catch (e) {
      log(
        "error happend in FirebaseAuthService in updateEmail method please check it, the error: $e",
      );
      throw CustomException(
        exceptionMeassge: "لقد حدث خطأ ما برجاء المحاولة مرة اخرى",
      );
    }
  }
}
