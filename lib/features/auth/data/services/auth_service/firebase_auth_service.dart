import 'dart:developer';
import 'package:easy_localization/easy_localization.dart';
import 'package:ecommerce_clean_architecture/core/errors/custom_exception.dart';
import 'package:ecommerce_clean_architecture/core/utils/app_routes.dart';
import 'package:ecommerce_clean_architecture/features/auth/data/services/auth_service/auth_service.dart';
import 'package:ecommerce_clean_architecture/generated/locale_keys.g.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:injectable/injectable.dart';

@LazySingleton(as: AuthService)
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
        throw CustomException(
          exceptionMeassge: LocaleKeys.authErrors_weakPasswordError.tr(),
        );
      } else if (e.code == 'email-already-in-use') {
        throw CustomException(
          exceptionMeassge: LocaleKeys.authErrors_emailAlreadyInUseError.tr(),
        );
      } else if (e.code == 'invalid-email') {
        throw CustomException(
          exceptionMeassge: LocaleKeys.authErrors_invalidEmailError.tr(),
        );
      } else if (e.code == "network-request-failed") {
        throw CustomException(
          exceptionMeassge: LocaleKeys.authErrors_networkError.tr(),
        );
      } else {
        throw CustomException(
          exceptionMeassge: LocaleKeys.authErrors_generalError.tr(),
        );
      }
    } catch (e) {
      log(
        "error happend in FirebaseAuthService in Register method please check it, the error: $e",
      );
      throw CustomException(
        exceptionMeassge: LocaleKeys.authErrors_generalError.tr(),
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
          exceptionMeassge: LocaleKeys.authErrors_userNotFoundError.tr(),
        );
      } else if (e.code == 'wrong-password') {
        throw CustomException(
          exceptionMeassge: LocaleKeys.authErrors_wrongPasswordError.tr(),
        );
      } else if (e.code == "network-request-failed") {
        throw CustomException(
          exceptionMeassge: LocaleKeys.authErrors_networkError.tr(),
        );
      } else {
        throw CustomException(
          exceptionMeassge: LocaleKeys.authErrors_generalError.tr(),
        );
      }
    } catch (e) {
      log(
        "error happend in FirebaseAuthService in signIn method please check it, the error: $e",
      );
      throw CustomException(
        exceptionMeassge: LocaleKeys.authErrors_generalError.tr(),
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
        exceptionMeassge: LocaleKeys.authErrors_generalError.tr(),
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
        exceptionMeassge: LocaleKeys.authErrors_generalError.tr(),
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
          exceptionMeassge: LocaleKeys.authErrors_invalidCreadintialError.tr(),
        );
      } else {
        throw CustomException(
          exceptionMeassge: LocaleKeys.authErrors_generalError.tr(),
        );
      }
    } catch (e) {
      log(
        "error happend in FirebaseAuthService in updatePassword method please check it, the error: $e",
      );
      throw CustomException(
        exceptionMeassge: LocaleKeys.authErrors_generalError.tr(),
      );
    }
  }

  @override
  Future<String>? getCurrentUserId() async {
    try {
      var userId = firebaseAuth.currentUser;

      if (userId == null) {
        throw CustomException(
          exceptionMeassge: LocaleKeys.authErrors_generalError.tr(),
        );
      }
      return userId.uid;
    } on FirebaseAuthException catch (e) {
      log(
        "error happend in FirebaseAuthService in getCurrentUserId method please check it, the error: $e",
      );
      throw CustomException(
        exceptionMeassge: LocaleKeys.authErrors_generalError.tr(),
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
    } catch (e) {
      log(
        "error happend in FirebaseAuthService in resetPassword method please check it, the error: $e",
      );
      throw CustomException(
        exceptionMeassge: LocaleKeys.authErrors_generalError.tr(),
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
        exceptionMeassge: LocaleKeys.authErrors_generalError.tr(),
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
        exceptionMeassge: LocaleKeys.authErrors_generalError.tr(),
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
        exceptionMeassge: LocaleKeys.authErrors_generalError.tr(),
      );
    } catch (e) {
      throw CustomException(
        exceptionMeassge: LocaleKeys.authErrors_generalError.tr(),
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
        exceptionMeassge: LocaleKeys.authErrors_generalError.tr(),
      );
    } catch (e) {
      log("Error in signInWithFacebook: $e");
      throw CustomException(
        exceptionMeassge: LocaleKeys.authErrors_generalError.tr(),
      );
    }
  }
}
