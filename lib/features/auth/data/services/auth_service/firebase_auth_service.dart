import 'dart:developer';
import 'package:ecommerce_clean_architecture/core/errors/custom_exception.dart';
import 'package:ecommerce_clean_architecture/core/utils/app_routes.dart';
import 'package:ecommerce_clean_architecture/features/auth/data/services/auth_service/auth_service.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

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
  Future<String>? getCurrentUserId() async {
    try {
      var userId = firebaseAuth.currentUser;

      if (userId == null) {
        throw CustomException(
          exceptionMeassge: "لقد حدث خطأ ما برجاء المحاولة مرة اخرى",
        );
      }
      return userId.uid;
    } on FirebaseAuthException catch (e) {
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
      await firebaseAuth.sendPasswordResetEmail(
        actionCodeSettings: ActionCodeSettings(
          url:
              'https://ecommerce-clean-arch.firebaseapp.com${AppRoutes.resetYourPassword}',
          handleCodeInApp: true,
          androidPackageName: 'com.example.ecommerce_clean_architecture',
          androidInstallApp: true,
          androidMinimumVersion: '12',
        ),
        email: email.trim(),
      );
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
      await user.verifyBeforeUpdateEmail(
        email,
        ActionCodeSettings(
          url: "https://ecommerce-clean-arch.firebaseapp.com${AppRoutes.home}",
          handleCodeInApp: true,
          androidPackageName: 'com.example.ecommerce_clean_architecture',
          androidInstallApp: true,
          androidMinimumVersion: '12',
        ),
      );
    } on FirebaseAuthException catch (e) {
      log(
        "error happend in FirebaseAuthService in updateEmail method please check it, the error: $e",
      );
      throw CustomException(
        exceptionMeassge: "لقد حدث خطأ ما برجاء المحاولة مرة اخرى",
      );
    }
  }

  @override
  Future<void> confirmPasswordReset({
    required String code,
    required String newPassword,
  }) async {
    try {
      await firebaseAuth.confirmPasswordReset(
        code: code,
        newPassword: newPassword,
      );
    } catch (e) {
      log(
        "error happend in FirebaseAuthService in confirmPasswordReset method please check it, the error: $e",
      );
      throw CustomException(
        exceptionMeassge: "لقد حدث خطأ ما برجاء المحاولة مرة اخرى",
      );
    }
  }

  @override
  Future<UserCredential> signInWithGoogle() async {
    try {
      final GoogleSignIn googleSignIn = GoogleSignIn.instance;

      await googleSignIn.initialize(
        serverClientId:
            '942377143150-98gsaovn7092qtngli0tk2mt6i44auh1.apps.googleusercontent.com',
      );
      final GoogleSignInAccount googleUser = await googleSignIn.authenticate();

      final GoogleSignInAuthentication googleAuth = googleUser.authentication;

      final AuthCredential credential = GoogleAuthProvider.credential(
        idToken: googleAuth.idToken,
      );

      UserCredential userCredential = await firebaseAuth.signInWithCredential(
        credential,
      );

      return userCredential;
    } on GoogleSignInException catch (e) {
      log(
        "error happend in FirebaseAuthService in signInWithGoogle method please check it, the error: $e",
      );
      throw CustomException(
        exceptionMeassge: "لقد حدث خطأ ما برجاء المحاولة مرة اخرى",
      );
    } catch (e) {
      throw CustomException(
        exceptionMeassge: "لقد حدث خطأ ما برجاء المحاولة مرة اخرى",
      );
    }
  }

  @override
  Future<UserCredential> signInWithFacebook() async {
    try {
      final FacebookAuth facebookAuth = FacebookAuth.instance;

      final LoginResult result = await facebookAuth.login(
        permissions: ['public_profile', 'email'],
      );

      final OAuthCredential credential = FacebookAuthProvider.credential(
        result.accessToken!.tokenString,
      );

      UserCredential userCredential = await firebaseAuth.signInWithCredential(
        credential,
      );
      return userCredential;
    } on FirebaseAuthException catch (e) {
      log("Error in FirebaseAuthService signInWithFacebook: $e");
      throw CustomException(
        exceptionMeassge: "لقد حدث خطأ ما برجاء المحاولة مرة اخرى",
      );
    } catch (e) {
      log("Error in signInWithFacebook: $e");
      throw CustomException(
        exceptionMeassge: "لقد حدث خطأ ما برجاء المحاولة مرة اخرى",
      );
    }
  }
}
