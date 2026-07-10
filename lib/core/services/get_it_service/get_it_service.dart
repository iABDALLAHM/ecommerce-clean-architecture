import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ecommerce_clean_architecture/core/services/secure_storage_service/secure_storage_service.dart';
import 'package:ecommerce_clean_architecture/features/auth/auth.dart';
import 'package:ecommerce_clean_architecture/features/checkout/data/repositories/order_repository/order_repository_implementation.dart';
import 'package:ecommerce_clean_architecture/features/checkout/domain/repositories/order_repository/orders_repository.dart';
import 'package:ecommerce_clean_architecture/features/main/domain/repositories/images_repository/images_repository.dart';
import 'package:ecommerce_clean_architecture/features/main/data/repositories/images_repository/images_repository_implementation.dart';
import 'package:ecommerce_clean_architecture/features/main/domain/repositories/notification_repository/notification_repository.dart';
import 'package:ecommerce_clean_architecture/features/main/data/repositories/notification_repository/notification_repository_implementation.dart';
import 'package:ecommerce_clean_architecture/features/main/domain/repositories/products_repository/products_repository.dart';
import 'package:ecommerce_clean_architecture/features/main/data/repositories/products_repository/products_repository_implementation.dart';
import 'package:ecommerce_clean_architecture/core/services/database_service/database_service.dart';
import 'package:ecommerce_clean_architecture/core/services/database_service/firestore_service.dart';
import 'package:ecommerce_clean_architecture/core/services/local_database_service/shared_prefs_service.dart';
import 'package:ecommerce_clean_architecture/core/services/storage_service/storage_service.dart';
import 'package:ecommerce_clean_architecture/core/services/storage_service/supabase_storage_service.dart';
import 'package:ecommerce_clean_architecture/features/profile/data/repositories/payment_repository/payment_repository_implementation.dart';
import 'package:ecommerce_clean_architecture/features/profile/domain/repositories/payment_repository/payment_repository.dart';
import 'package:ecommerce_clean_architecture/features/review_and_rating/domain/entities/repositories/reviews_repository/reviews_repository.dart';
import 'package:ecommerce_clean_architecture/features/review_and_rating/data/repositories/reviews_repository/reviews_repository_implementation.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:get_it/get_it.dart';
import 'package:shared_preferences/shared_preferences.dart';

GetIt getIt = GetIt.instance;

void setupGetIt() async {
  getIt.registerSingleton<SharedPrefService>(
    SharedPrefService(sharedPreferences: await SharedPreferences.getInstance()),
  );
  getIt.registerSingleton<SecureStorageService>(
    SecureStorageService(storage: FlutterSecureStorage()),
  );

  getIt.registerSingleton<DatabaseService>(
    FirestoreService(firestore: FirebaseFirestore.instance),
  );

  getIt.registerSingleton<ReviewsRepository>(
    ReviewsRepositoryImplementation(
      databaseService: getIt.get<DatabaseService>(),
    ),
  );

  getIt.registerSingleton<UserRepository>(
    UserRepositoryImplementation(databaseService: getIt.get<DatabaseService>()),
  );
  getIt.registerSingleton<PaymentRepository>(
    PaymentRepositoryImplementation(
      databaseService: getIt.get<DatabaseService>(),
    ),
  );

  getIt.registerSingleton<AuthService>(
    FirebaseAuthService(firebaseAuth: FirebaseAuth.instance),
  );

  getIt.registerSingleton<StorageService>(SupabaseStorageService());

  getIt.registerSingleton<ImagesRepository>(
    ImagesRepositoryImplementation(storageService: getIt.get<StorageService>()),
  );
  getIt.registerSingleton<NotificationRepository>(
    NotificationRepositoryImplementation(
      databaseService: getIt.get<DatabaseService>(),
    ),
  );
  getIt.registerSingleton<OrdersRepository>(
    OrderRepositoryImplementation(
      databaseService: getIt.get<DatabaseService>(),
    ),
  );
  getIt.registerSingleton<ProductsRepository>(
    ProductsRepositoryImplementation(
      databaseService: getIt.get<DatabaseService>(),
    ),
  );
  getIt.registerSingleton<AuthRepository>(
    AuthRepositoryImplementation(authService: getIt.get<AuthService>()),
  );
}
