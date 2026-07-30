// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format width=80

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:cloud_firestore/cloud_firestore.dart' as _i974;
import 'package:ecommerce_clean_architecture/core/cubits/get_user_data_cubit/get_user_data_cubit.dart'
    as _i526;
import 'package:ecommerce_clean_architecture/core/modules/register_module/register_module.dart'
    as _i379;
import 'package:ecommerce_clean_architecture/core/repositories/flutter_secure_storage_repository/secure_storage_repository.dart'
    as _i562;
import 'package:ecommerce_clean_architecture/core/repositories/flutter_secure_storage_repository/secure_storage_repository_implementation.dart'
    as _i339;
import 'package:ecommerce_clean_architecture/core/repositories/local_storage_repository/local_storage_repository.dart'
    as _i993;
import 'package:ecommerce_clean_architecture/core/repositories/local_storage_repository/local_storage_repository_implementation.dart'
    as _i32;
import 'package:ecommerce_clean_architecture/core/services/database_service/database_service.dart'
    as _i15;
import 'package:ecommerce_clean_architecture/core/services/database_service/firestore_service.dart'
    as _i457;
import 'package:ecommerce_clean_architecture/core/services/local_database_service/local_storage_service.dart'
    as _i679;
import 'package:ecommerce_clean_architecture/core/services/local_database_service/shared_prefs_service.dart'
    as _i342;
import 'package:ecommerce_clean_architecture/core/services/secure_storage_service/flutter_secure_service.dart'
    as _i527;
import 'package:ecommerce_clean_architecture/core/services/secure_storage_service/flutter_secure_storage_service.dart'
    as _i857;
import 'package:ecommerce_clean_architecture/core/services/storage_service/storage_service.dart'
    as _i775;
import 'package:ecommerce_clean_architecture/core/services/storage_service/supabase_storage_service.dart'
    as _i1014;
import 'package:ecommerce_clean_architecture/features/auth/auth.dart' as _i285;
import 'package:ecommerce_clean_architecture/features/auth/data/repositories/auth_repository/auth_repository_implementation.dart'
    as _i241;
import 'package:ecommerce_clean_architecture/features/auth/data/repositories/user_repository/user_repository_implementation.dart'
    as _i556;
import 'package:ecommerce_clean_architecture/features/auth/data/services/auth_service/auth_service.dart'
    as _i936;
import 'package:ecommerce_clean_architecture/features/auth/data/services/auth_service/firebase_auth_service.dart'
    as _i996;
import 'package:ecommerce_clean_architecture/features/auth/presentation/forget_password/cubits/send_reset_password_email_cubit/send_reset_password_email_cubit.dart'
    as _i661;
import 'package:ecommerce_clean_architecture/features/auth/presentation/login/cubits/login_cubit/login_cubit.dart'
    as _i984;
import 'package:ecommerce_clean_architecture/features/auth/presentation/register/cubits/register_cubit/register_cubit.dart'
    as _i447;
import 'package:ecommerce_clean_architecture/features/auth/presentation/reset_password/cubits/confirm_reset_password_cubit/confirm_password_cubit.dart'
    as _i931;
import 'package:ecommerce_clean_architecture/features/checkout/data/repositories/order_repository/order_repository_implementation.dart'
    as _i43;
import 'package:ecommerce_clean_architecture/features/checkout/domain/repositories/order_repository/orders_repository.dart'
    as _i652;
import 'package:ecommerce_clean_architecture/features/checkout/presentation/core/cubits/add_order_cubit/add_order_cubit.dart'
    as _i450;
import 'package:ecommerce_clean_architecture/features/checkout/presentation/core/cubits/check_out_cubit/check_out_cubit.dart'
    as _i196;
import 'package:ecommerce_clean_architecture/features/checkout/presentation/core/cubits/save_address_cubit/save_address_cubit.dart'
    as _i1001;
import 'package:ecommerce_clean_architecture/features/checkout/presentation/core/cubits/save_payment_details_cubit/save_payment_details_cubit.dart'
    as _i884;
import 'package:ecommerce_clean_architecture/features/item_details/presentation/cubits/get_reviews_cubit/get_reviews_cubit.dart'
    as _i506;
import 'package:ecommerce_clean_architecture/features/main/data/repositories/featured_products_repository/featured_products_repository_implementation.dart'
    as _i915;
import 'package:ecommerce_clean_architecture/features/main/data/repositories/images_repository/images_repository_implementation.dart'
    as _i177;
import 'package:ecommerce_clean_architecture/features/main/data/repositories/notification_repository/notification_repository_implementation.dart'
    as _i1012;
import 'package:ecommerce_clean_architecture/features/main/data/repositories/products_repository/products_repository_implementation.dart'
    as _i940;
import 'package:ecommerce_clean_architecture/features/main/domain/repositories/featured_products_repository/featured_products_repository.dart'
    as _i956;
import 'package:ecommerce_clean_architecture/features/main/domain/repositories/images_repository/images_repository.dart'
    as _i622;
import 'package:ecommerce_clean_architecture/features/main/domain/repositories/notification_repository/notification_repository.dart'
    as _i425;
import 'package:ecommerce_clean_architecture/features/main/domain/repositories/products_repository/products_repository.dart'
    as _i120;
import 'package:ecommerce_clean_architecture/features/main/presentation/home/cubits/add_favorite_product_cubit/add_favorite_product_cubit.dart'
    as _i223;
import 'package:ecommerce_clean_architecture/features/main/presentation/home/cubits/get_featured_product_cubit/get_featured_product_cubit.dart'
    as _i197;
import 'package:ecommerce_clean_architecture/features/main/presentation/home/cubits/products_cubit/products_cubit.dart'
    as _i1035;
import 'package:ecommerce_clean_architecture/features/main/presentation/notification/cubits/get_notifications_cubit/get_notifications_cubit.dart'
    as _i677;
import 'package:ecommerce_clean_architecture/features/main/presentation/search/cubits/search_cubit/search_cubit.dart'
    as _i683;
import 'package:ecommerce_clean_architecture/features/onboarding/presentation/cubits/onboarding_cubit/onboarding_cubit.dart'
    as _i956;
import 'package:ecommerce_clean_architecture/features/profile/data/repositories/payment_repository/payment_repository_implementation.dart'
    as _i28;
import 'package:ecommerce_clean_architecture/features/profile/domain/repositories/payment_repository/payment_repository.dart'
    as _i557;
import 'package:ecommerce_clean_architecture/features/profile/presentation/add_new_card/cubits/add_new_card_cubit/add_new_card_cubit.dart'
    as _i391;
import 'package:ecommerce_clean_architecture/features/profile/presentation/core/cubits/sign_out_cubit/sign_out_cubit.dart'
    as _i627;
import 'package:ecommerce_clean_architecture/features/profile/presentation/core/cubits/update_user_image_cubit/update_user_image_cubit.dart'
    as _i116;
import 'package:ecommerce_clean_architecture/features/profile/presentation/favorite_products/cubits/get_favorite_products_cubit/get_favorite_products_cubit.dart'
    as _i535;
import 'package:ecommerce_clean_architecture/features/profile/presentation/my_orders/cubits/get_my_orders_cubit/get_my_orders_stream_cubit.dart'
    as _i149;
import 'package:ecommerce_clean_architecture/features/profile/presentation/user_profile/cubits/update_user_email_cubit/update_user_email_cubit.dart'
    as _i761;
import 'package:ecommerce_clean_architecture/features/profile/presentation/user_profile/cubits/update_user_name_cubit/update_user_name_cubit.dart'
    as _i821;
import 'package:ecommerce_clean_architecture/features/profile/presentation/user_profile/cubits/update_user_password_cubit/update_user_password_cubit.dart'
    as _i869;
import 'package:ecommerce_clean_architecture/features/profile/presentation/wallet/cubits/get_my_cards_cubit/get_my_cards_cubit.dart'
    as _i890;
import 'package:ecommerce_clean_architecture/features/review_and_rating/data/repositories/reviews_repository/reviews_repository_implementation.dart'
    as _i780;
import 'package:ecommerce_clean_architecture/features/review_and_rating/domain/entities/repositories/reviews_repository/reviews_repository.dart'
    as _i89;
import 'package:ecommerce_clean_architecture/features/review_and_rating/presentation/cubits/add_review_cubit/add_review_cubit.dart'
    as _i1048;
import 'package:ecommerce_clean_architecture/features/splash/presentation/cubits/splash_cubit/splash_cubit.dart'
    as _i397;
import 'package:firebase_auth/firebase_auth.dart' as _i59;
import 'package:flutter_secure_storage/flutter_secure_storage.dart' as _i558;
import 'package:get_it/get_it.dart' as _i174;
import 'package:injectable/injectable.dart' as _i526;
import 'package:shared_preferences/shared_preferences.dart' as _i460;
import 'package:supabase_flutter/supabase_flutter.dart' as _i454;

extension GetItInjectableX on _i174.GetIt {
  // initializes the registration of main-scope dependencies inside of GetIt
  Future<_i174.GetIt> init({
    String? environment,
    _i526.EnvironmentFilter? environmentFilter,
  }) async {
    final gh = _i526.GetItHelper(this, environment, environmentFilter);
    final registerModule = _$RegisterModule();
    await gh.factoryAsync<_i460.SharedPreferences>(
      () => registerModule.prefs,
      preResolve: true,
    );
    gh.singleton<_i59.FirebaseAuth>(() => registerModule.firebaseAuth);
    gh.singleton<_i974.FirebaseFirestore>(() => registerModule.firestore);
    gh.singleton<_i558.FlutterSecureStorage>(
      () => registerModule.secureStorage,
    );
    gh.singleton<_i454.Supabase>(() => registerModule.supabaseStorage);
    gh.lazySingleton<_i936.AuthService>(
      () => _i996.FirebaseAuthService(firebaseAuth: gh<_i59.FirebaseAuth>()),
    );
    gh.lazySingleton<_i527.FlutterSecureService>(
      () => _i857.FlutterSecureStorageService(
        storage: gh<_i558.FlutterSecureStorage>(),
      ),
    );
    gh.lazySingleton<_i775.StorageService>(
      () => _i1014.SupabaseStorageService(supabase: gh<_i454.Supabase>()),
    );
    gh.lazySingleton<_i679.LocalStorageService>(
      () => _i342.SharedPrefService(
        sharedPreferences: gh<_i460.SharedPreferences>(),
      ),
    );
    gh.lazySingleton<_i993.LocalStorageRepository>(
      () => _i32.LocalStorageRepositoryImplementation(
        localStorageService: gh<_i679.LocalStorageService>(),
      ),
    );
    gh.lazySingleton<_i285.AuthRepository>(
      () => _i241.AuthRepositoryImplementation(
        authService: gh<_i285.AuthService>(),
      ),
    );
    gh.lazySingleton<_i15.DatabaseService>(
      () => _i457.FirestoreService(firestore: gh<_i974.FirebaseFirestore>()),
    );
    gh.lazySingleton<_i622.ImagesRepository>(
      () => _i177.ImagesRepositoryImplementation(
        storageService: gh<_i775.StorageService>(),
      ),
    );
    gh.lazySingleton<_i562.SecureStorageRepository>(
      () => _i339.SecureStorageRepositoryImplementation(
        flutterSecureService: gh<_i527.FlutterSecureService>(),
      ),
    );
    gh.factory<_i869.UpdateUserPasswordCubit>(
      () => _i869.UpdateUserPasswordCubit(authRepo: gh<_i285.AuthRepository>()),
    );
    gh.factory<_i661.SendResetPasswordEmailCubit>(
      () => _i661.SendResetPasswordEmailCubit(
        authRepository: gh<_i285.AuthRepository>(),
      ),
    );
    gh.factory<_i931.ConfirmPasswordCubit>(
      () => _i931.ConfirmPasswordCubit(
        authRepository: gh<_i285.AuthRepository>(),
      ),
    );
    gh.lazySingleton<_i652.OrdersRepository>(
      () => _i43.OrderRepositoryImplementation(
        databaseService: gh<_i15.DatabaseService>(),
      ),
    );
    gh.lazySingleton<_i557.PaymentRepository>(
      () => _i28.PaymentRepositoryImplementation(
        databaseService: gh<_i15.DatabaseService>(),
      ),
    );
    gh.factory<_i149.GetMyOrdersStreamCubit>(
      () => _i149.GetMyOrdersStreamCubit(
        ordersRepository: gh<_i652.OrdersRepository>(),
        secureStorageRepository: gh<_i562.SecureStorageRepository>(),
      ),
    );
    gh.factory<_i956.OnboardingCubit>(
      () => _i956.OnboardingCubit(
        localStorageRepository: gh<_i993.LocalStorageRepository>(),
      ),
    );
    gh.factory<_i1001.SaveAddressCubit>(
      () => _i1001.SaveAddressCubit(
        ordersRepository: gh<_i652.OrdersRepository>(),
      ),
    );
    gh.factory<_i884.SavePaymentDetailsCubit>(
      () => _i884.SavePaymentDetailsCubit(
        ordersRepository: gh<_i652.OrdersRepository>(),
      ),
    );
    gh.lazySingleton<_i425.NotificationRepository>(
      () => _i1012.NotificationRepositoryImplementation(
        databaseService: gh<_i15.DatabaseService>(),
      ),
    );
    gh.lazySingleton<_i89.ReviewsRepository>(
      () => _i780.ReviewsRepositoryImplementation(
        databaseService: gh<_i15.DatabaseService>(),
      ),
    );
    gh.lazySingleton<_i956.FeaturedProductsRepository>(
      () => _i915.FeaturedProductsRepositoryImplementation(
        databaseService: gh<_i15.DatabaseService>(),
      ),
    );
    gh.factory<_i1048.AddReviewCubit>(
      () => _i1048.AddReviewCubit(
        reviewsRepository: gh<_i89.ReviewsRepository>(),
        secureStorageRepository: gh<_i562.SecureStorageRepository>(),
      ),
    );
    gh.lazySingleton<_i285.UserRepository>(
      () => _i556.UserRepositoryImplementation(
        databaseService: gh<_i15.DatabaseService>(),
      ),
    );
    gh.factory<_i526.GetUserDataCubit>(
      () => _i526.GetUserDataCubit(
        userRepository: gh<_i285.UserRepository>(),
        secureStorageRepository: gh<_i562.SecureStorageRepository>(),
      ),
    );
    gh.lazySingleton<_i120.ProductsRepository>(
      () => _i940.ProductsRepositoryImplementation(
        databaseService: gh<_i15.DatabaseService>(),
        secureStorageRepository: gh<_i562.SecureStorageRepository>(),
      ),
    );
    gh.factory<_i397.SplashCubit>(
      () => _i397.SplashCubit(
        authRepository: gh<_i285.AuthRepository>(),
        secureStorageRepository: gh<_i562.SecureStorageRepository>(),
        localStorageService: gh<_i993.LocalStorageRepository>(),
      ),
    );
    gh.factory<_i627.SignOutCubit>(
      () => _i627.SignOutCubit(
        authRepo: gh<_i285.AuthRepository>(),
        secureStorageRepository: gh<_i562.SecureStorageRepository>(),
        localStorageRepository: gh<_i993.LocalStorageRepository>(),
      ),
    );
    gh.factory<_i197.GetFeaturedProductCubit>(
      () => _i197.GetFeaturedProductCubit(
        featuredProductsRepository: gh<_i956.FeaturedProductsRepository>(),
      ),
    );
    gh.factory<_i984.LoginCubit>(
      () => _i984.LoginCubit(
        authRepo: gh<_i285.AuthRepository>(),
        userRepo: gh<_i285.UserRepository>(),
        secureStorageRepository: gh<_i562.SecureStorageRepository>(),
      ),
    );
    gh.factory<_i450.AddOrderCubit>(
      () => _i450.AddOrderCubit(orderRepo: gh<_i652.OrdersRepository>()),
    );
    gh.factory<_i116.UpdateUserImageCubit>(
      () => _i116.UpdateUserImageCubit(
        imagesRepo: gh<_i622.ImagesRepository>(),
        userRepository: gh<_i285.UserRepository>(),
      ),
    );
    gh.factory<_i677.GetNotificationsCubit>(
      () => _i677.GetNotificationsCubit(
        notificationRepo: gh<_i425.NotificationRepository>(),
      ),
    );
    gh.factory<_i196.CheckOutCubit>(
      () => _i196.CheckOutCubit(
        secureStorageRepository: gh<_i562.SecureStorageRepository>(),
      ),
    );
    gh.factory<_i447.RegisterCubit>(
      () => _i447.RegisterCubit(
        authRepo: gh<_i285.AuthRepository>(),
        userRepo: gh<_i285.UserRepository>(),
      ),
    );
    gh.factory<_i506.GetReviewsCubit>(
      () => _i506.GetReviewsCubit(
        reviewsRepository: gh<_i89.ReviewsRepository>(),
      ),
    );
    gh.factory<_i683.SearchCubit>(
      () => _i683.SearchCubit(productsRepo: gh<_i120.ProductsRepository>()),
    );
    gh.factory<_i535.GetFavoriteProductsCubit>(
      () => _i535.GetFavoriteProductsCubit(
        productsRepo: gh<_i120.ProductsRepository>(),
      ),
    );
    gh.factory<_i223.AddFavoriteProductCubit>(
      () => _i223.AddFavoriteProductCubit(
        productsRepository: gh<_i120.ProductsRepository>(),
      ),
    );
    gh.factory<_i1035.ProductsCubit>(
      () => _i1035.ProductsCubit(
        productsRepository: gh<_i120.ProductsRepository>(),
      ),
    );
    gh.factory<_i391.AddNewCardCubit>(
      () => _i391.AddNewCardCubit(
        paymentRepository: gh<_i557.PaymentRepository>(),
        secureStorageRepository: gh<_i562.SecureStorageRepository>(),
      ),
    );
    gh.factory<_i890.GetMyCardsCubit>(
      () => _i890.GetMyCardsCubit(
        paymentRepository: gh<_i557.PaymentRepository>(),
        secureStorageRepository: gh<_i562.SecureStorageRepository>(),
      ),
    );
    gh.factory<_i821.UpdateUserNameCubit>(
      () =>
          _i821.UpdateUserNameCubit(userRepository: gh<_i285.UserRepository>()),
    );
    gh.factory<_i761.UpdateUserEmailCubit>(
      () => _i761.UpdateUserEmailCubit(
        authRepository: gh<_i285.AuthRepository>(),
        userRepository: gh<_i285.UserRepository>(),
      ),
    );
    return this;
  }
}

class _$RegisterModule extends _i379.RegisterModule {}
