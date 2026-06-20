import 'package:ecommerce_clean_architecture/features/auth/auth.dart';
import 'package:ecommerce_clean_architecture/features/cart/domain/entities/cart_entity/cart_entity.dart';
import 'package:ecommerce_clean_architecture/features/cart/presentation/views/widgets/cart_body.dart';
import 'package:ecommerce_clean_architecture/features/checkout/checkout.dart';
import 'package:ecommerce_clean_architecture/features/main/domain/entities/product_entity/product_entity.dart';
import 'package:ecommerce_clean_architecture/features/main/main.dart';
import 'package:ecommerce_clean_architecture/features/main/presentation/best_selling/views/widgets/best_selling_body.dart';
import 'package:ecommerce_clean_architecture/features/main/presentation/home/views/widgets/home_body.dart';
import 'package:ecommerce_clean_architecture/features/main/presentation/search/views/widgets/search_body.dart';
import 'package:ecommerce_clean_architecture/features/onboarding/onboarding.dart';
import 'package:ecommerce_clean_architecture/features/products/presentation/views/widgets/products_body.dart';
import 'package:ecommerce_clean_architecture/features/profile/presentation/views/profile_body.dart';
import 'package:ecommerce_clean_architecture/features/profile/presentation/views/widgets/about_us_body.dart';
import 'package:ecommerce_clean_architecture/features/profile/presentation/views/widgets/add_new_wallet_method_body.dart';
import 'package:ecommerce_clean_architecture/features/profile/presentation/views/widgets/favorite_body.dart';
import 'package:ecommerce_clean_architecture/features/profile/presentation/views/widgets/orders_body.dart';
import 'package:ecommerce_clean_architecture/features/profile/presentation/views/widgets/private_profile_body.dart';
import 'package:ecommerce_clean_architecture/features/profile/presentation/views/widgets/wallet_body.dart';
import 'package:ecommerce_clean_architecture/features/splash/splash.dart';
import 'package:go_router/go_router.dart';

class AppRoutes {
  // should create a shell route as a parent for :
  // home.
  // products.
  // profile.
  // cart.

  // and each section has a nested route from it with shellRoute

  // home:
  // 1- bestSelling
  // 2- search
  // 3- notifications

  // products => dont have nested screens

  // cart => dont have nested screens

  // profile:
  // 1- private Profile
  // 2- myOrders
  // 3- myPayments
  // 4- addNewPayment
  // 5- favorite
  // 6- about

  // separate Screens:
  // splash 1
  // splash 2
  // onboarding
  // login
  // register
  // forgetPass
  // passRecovery
  // resetYourPass
  // itemDetails
  // reviewAndRating
  // allCheckOutBodies

  static const String splash = "/";
  static const String onboarding = "/onboarding";
  static const String login = "/login";
  static const String register = "/register";
  static const String forgetPassword = "/forgetPassword";
  static const String passwordRecovery = "/passwordRecovery";
  static const String resetYourPassword = "/resetYourPassword";

  static const String home = "/home";
  static const String bestSelling = "/bestSelling";
  static const String search = "/search";
  static const String notifications = "/notifications";
  static const String products = "/products";
  static const String itemDetails = "/itemDetails";
  static const String cart = "/cart";
  static const String reviewAndRating = "/reviewAndRating";
  static const String profile = "/profile";
  static const String privateProfile = "/privateProfile";
  static const String myOrders = "/myOrders";
  static const String myPayments = "/myPayments";
  static const String addNewPayment = "/addNewPayment";
  static const String favorite = "/favorite";
  static const String about = "/about";
  static const String checkOut = "/checkout";
  static const String reviewOrder = "/reviewOrder";
  static const String trackOrder = "/trackOrder";

  static GoRouter router = GoRouter(
    initialLocation: splash,
    routes: [
      ShellRoute(
        builder: (context, state, child) => MainView(child: child),
        routes: [
          GoRoute(
            path: home,
            builder: (context, state) => HomeBody(),
            routes: [
              GoRoute(
                path: bestSelling,
                builder: (context, state) => BestSellingBody(),
              ),
              GoRoute(path: search, builder: (context, state) => SearchBody()),
              GoRoute(
                path: notifications,
                builder: (context, state) => NotificationBody(),
              ),
            ],
          ),

          GoRoute(
            path: products,
            builder: (context, state) => ProductsBody(),
            routes: [
              GoRoute(path: search, builder: (context, state) => SearchBody()),
            ],
          ),

          GoRoute(
            path: profile,
            builder: (context, state) => ProfileBody(),
            routes: [
              GoRoute(
                path: privateProfile,
                builder: (context, state) => PrivateProfileBody(),
              ),
              GoRoute(
                path: myOrders,
                builder: (context, state) => OrdersBody(),
              ),
              GoRoute(
                path: myPayments,
                builder: (context, state) => WalletBody(),
                routes: [
                  GoRoute(
                    path: addNewPayment,
                    builder: (context, state) => AddNewWalletMethodBody(),
                  ),
                ],
              ),

              GoRoute(
                path: favorite,
                builder: (context, state) => FavoriteBody(),
              ),

              GoRoute(path: about, builder: (context, state) => AboutUsBody()),
            ],
          ),

          GoRoute(path: cart, builder: (context, state) => CartBody()),
        ],
      ),

      GoRoute(
        path: checkOut,
        builder: (context, state) {
          final cartEntity = state.extra as CartEntity;

          return CheckOutView(cartEntity: cartEntity);
        },
      ),

      GoRoute(path: trackOrder, builder: (context, state) => TrackOrderView()),

      GoRoute(
        path: reviewOrder,
        builder: (context, state) => ReviewOrderView(),
      ),

      GoRoute(path: onboarding, builder: (context, state) => OnboardingView()),
      GoRoute(path: onboarding, builder: (context, state) => OnboardingView()),
      GoRoute(path: splash, builder: (context, state) => SplashView()),
      GoRoute(path: login, builder: (context, state) => LoginView()),
      GoRoute(path: register, builder: (context, state) => RegisterView()),
      GoRoute(
        path: forgetPassword,
        builder: (context, state) => ForgetPasswordView(),
      ),
      GoRoute(
        path: resetYourPassword,
        builder: (context, state) => ResetYourPasswordView(),
      ),
      GoRoute(
        path: passwordRecovery,
        builder: (context, state) => PasswordRecoveryView(),
      ),

      GoRoute(
        path: itemDetails,
        builder: (context, state) {
          final productEntity = state.extra as ProductEntity;
          return FruitItemDetailsView(productEntity: productEntity);
        },
      ),

      GoRoute(
        path: reviewAndRating,
        builder: (context, state) {
          final productEntity = state.extra as ProductEntity;

          return ReviewAndRatingView(productEntity: productEntity);
        },
      ),
    ],
  );
}
