import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ecommerce_clean_architecture/features/home/domain/repos/images_repo.dart';
import 'package:ecommerce_clean_architecture/features/home/data/repos/images_repo_implementation.dart';
import 'package:ecommerce_clean_architecture/features/notification/domain/repos/notification_repo.dart';
import 'package:ecommerce_clean_architecture/features/notification/data/repos/notification_repo_implementation.dart';
import 'package:ecommerce_clean_architecture/features/home/data/repos/order_repo_implementation.dart';
import 'package:ecommerce_clean_architecture/features/home/domain/repos/orders_repo.dart';
import 'package:ecommerce_clean_architecture/features/home/domain/repos/products_repo.dart';
import 'package:ecommerce_clean_architecture/features/home/data/repos/products_repo_implementation.dart';
import 'package:ecommerce_clean_architecture/features/auth/data/repos/user_repository/user_repo.dart';
import 'package:ecommerce_clean_architecture/features/auth/data/repos/user_repository/user_repo_implementation.dart';
import 'package:ecommerce_clean_architecture/core/services/auth_service.dart';
import 'package:ecommerce_clean_architecture/core/services/database_service.dart';
import 'package:ecommerce_clean_architecture/core/services/firebase_auth_service.dart';
import 'package:ecommerce_clean_architecture/core/services/firestore_service.dart';
import 'package:ecommerce_clean_architecture/core/services/shared_prefs_service.dart';
import 'package:ecommerce_clean_architecture/core/services/storage_service.dart';
import 'package:ecommerce_clean_architecture/core/services/supabase_storage_service.dart';
import 'package:ecommerce_clean_architecture/features/auth/data/datasources/local/user_local_data_source.dart';
import 'package:ecommerce_clean_architecture/features/auth/data/datasources/local/user_local_data_source_implementation.dart';
import 'package:ecommerce_clean_architecture/features/auth/data/repos/auth_repository/auth_repo_implementation.dart';
import 'package:ecommerce_clean_architecture/features/auth/data/repos/auth_repository/auth_repo.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get_it/get_it.dart';
import 'package:shared_preferences/shared_preferences.dart';

GetIt getIt = GetIt.instance;

void setupGetIt() async {
  getIt.registerSingleton<SharedPrefService>(
    SharedPrefService(sharedPreferences: await SharedPreferences.getInstance()),
  );

  getIt.registerSingleton<DatabaseService>(
    FirestoreService(firestore: FirebaseFirestore.instance),
  );

  getIt.registerSingleton<UserLocalDataSource>(
    UserLocalDataSourceImplementation(),
  );

  getIt.registerSingleton<UserRepo>(
    UserRepoImplementation(
      databaseService: getIt.get<DatabaseService>(),
      localDataSource: getIt.get<UserLocalDataSource>(),
    ),
  );

  getIt.registerSingleton<AuthService>(
    FirebaseAuthService(firebaseAuth: FirebaseAuth.instance),
  );

  getIt.registerSingleton<StorageService>(SupabaseStorageService());

  getIt.registerSingleton<ImagesRepo>(
    ImagesRepoImplementation(storageService: getIt.get<StorageService>()),
  );
  getIt.registerSingleton<NotificationRepo>(
    NotificationRepoImplementation(
      databaseService: getIt.get<DatabaseService>(),
    ),
  );
  getIt.registerSingleton<OrdersRepo>(
    OrderRepoImplementation(databaseService: getIt.get<DatabaseService>()),
  );
  getIt.registerSingleton<ProductsRepo>(
    ProductsRepoImplementation(databaseService: getIt.get<DatabaseService>()),
  );
  getIt.registerSingleton<AuthRepo>(
    AuthRepoImplementation(
      authService: getIt.get<AuthService>(),
      userLocalDataSource: getIt.get<UserLocalDataSource>(),
    ),
  );
}
