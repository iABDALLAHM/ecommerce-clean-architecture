import 'dart:developer';
import 'package:ecommerce_clean_architecture/core/errors/custom_exception.dart';
import 'package:ecommerce_clean_architecture/core/services/auth_service.dart';
import 'package:firebase_auth/firebase_auth.dart';

class FirebaseAuthService implements AuthService {
  FirebaseAuth firebaseAuth = FirebaseAuth.instance;

  @override
  Future<User> register({
    required String email,
    required String password,
  }) async {
    try {
      final credential = await FirebaseAuth.instance
          .createUserWithEmailAndPassword(email: email, password: password);
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
      final credential = await FirebaseAuth.instance.signInWithEmailAndPassword(
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
    await firebaseAuth.currentUser!.delete();
  }

  @override
  Future<void> signOut() async {
    await firebaseAuth.signOut();
  }

  @override
  Future<void> updatePassword({required String newPassword}) async {
    try {
      final user = firebaseAuth.currentUser;
      await user!.updatePassword(newPassword);
    } on FirebaseAuthException catch (e) {
      log(
        "error happend in FirebaseAuthService in updatePassword method please check it, the error: $e",
      );
      if (e.code == "invalid-credential") {
        throw CustomException(
          exceptionMeassge: "حدث خطأ ما برجاء المحاولة مرة آخرى",
        );
      }
    } catch (e) {
      log(
        "error happend in FirebaseAuthService in updatePassword method please check it, the error: $e",
      );
      throw CustomException(
        exceptionMeassge: "حدث خطأ ما برجاء المحاولة مرة آخرى",
      );
    }
  }
}
