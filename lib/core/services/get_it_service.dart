import 'package:ecommerce_clean_architecture/core/services/auth_service.dart';
import 'package:ecommerce_clean_architecture/core/services/database_service.dart';
import 'package:ecommerce_clean_architecture/core/services/firebase_auth_service.dart';
import 'package:ecommerce_clean_architecture/core/services/firestore_service.dart';
import 'package:ecommerce_clean_architecture/features/auth/data/repos/auth_repo_implementation.dart';
import 'package:ecommerce_clean_architecture/features/auth/domain/repo/auth_repo.dart';
import 'package:get_it/get_it.dart';

GetIt getIt = GetIt.instance;
void setupGetIt() {
  getIt.registerSingleton<AuthService>(FirebaseAuthService());
  getIt.registerSingleton<DatabaseService>(FirestoreService());
  getIt.registerSingleton<AuthRepo>(
    AuthRepoImplementation(
      authService: getIt<AuthService>(),
      firestoreService: getIt<DatabaseService>(),
    ),
  );
}
