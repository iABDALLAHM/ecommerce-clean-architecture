import 'package:ecommerce_clean_architecture/features/auth/auth.dart';
import 'package:ecommerce_clean_architecture/features/cart/domain/entities/cart_entity/cart_entity.dart';
import 'package:ecommerce_clean_architecture/features/cart/presentation/widgets/cart_body.dart';
import 'package:ecommerce_clean_architecture/features/checkout/checkout.dart';
import 'package:ecommerce_clean_architecture/features/item_details/presentation/views/widgets/fruit_item_details_wrapper.dart';
import 'package:ecommerce_clean_architecture/features/main/main.dart';
import 'package:ecommerce_clean_architecture/features/main/presentation/best_selling/widgets/best_selling_body.dart';
import 'package:ecommerce_clean_architecture/features/main/presentation/home/widgets/home_body.dart';
import 'package:ecommerce_clean_architecture/features/main/presentation/search/widgets/search_body.dart';
import 'package:ecommerce_clean_architecture/features/onboarding/onboarding.dart';
import 'package:ecommerce_clean_architecture/features/products/presentation/widgets/products_body.dart';
import 'package:ecommerce_clean_architecture/features/profile/presentation/add_new_card/views/add_new_card_view.dart';
import 'package:ecommerce_clean_architecture/features/profile/presentation/core/views/profile_view.dart';
import 'package:ecommerce_clean_architecture/features/profile/presentation/my_orders/views/my_orders_view.dart';
import 'package:ecommerce_clean_architecture/features/profile/presentation/user_profile/widgets/user_profile.dart';
import 'package:ecommerce_clean_architecture/features/profile/presentation/about_us_body/widgets/about_us_body.dart';
import 'package:ecommerce_clean_architecture/features/profile/presentation/favorite_products/views/favorite_view.dart';
import 'package:ecommerce_clean_architecture/features/profile/presentation/wallet/views/my_cards_view.dart';
import 'package:ecommerce_clean_architecture/features/review_and_rating/presentation/views/widgets/review_and_rating_wrapper.dart';
import 'package:ecommerce_clean_architecture/features/splash/splash.dart';
import 'package:go_router/go_router.dart';

class AppRoutes {
  static const String splash = "/";
  static const String onboarding = "/onboarding";
  static const String login = "/login";
  static const String register = "/register";
  static const String forgetPassword = "/forgetPassword";
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
  static const String userProfile = "/userProfile";
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
            builder: (context, state) => ProfileView(),
            routes: [
              GoRoute(
                path: userProfile,
                builder: (context, state) => UserProfile(),
              ),
              GoRoute(
                path: myOrders,
                builder: (context, state) => MyOrdersView(),
              ),
              GoRoute(
                path: myPayments,
                builder: (context, state) => MyCardsView(),
                routes: [
                  GoRoute(
                    path: addNewPayment,
                    builder: (context, state) {
                      Map<String, dynamic> data =
                          state.extra as Map<String, dynamic>;
                      return AddNewCardView(data: data);
                    },
                  ),
                ],
              ),

              GoRoute(
                path: favorite,
                builder: (context, state) => FavoriteView(),
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

      GoRoute(
        path: trackOrder,
        builder: (context, state) {
          OrderEntity orderEntity = state.extra as OrderEntity;
          return TrackOrderView(orderEntity: orderEntity);
        },
      ),

      GoRoute(
        path: reviewOrder,
        builder: (context, state) {
          OrderEntity orderEntity = state.extra as OrderEntity;
          return ReviewOrderView(orderEntity: orderEntity);
        },
      ),

      GoRoute(path: onboarding, builder: (context, state) => OnboardingView()),
      GoRoute(path: onboarding, builder: (context, state) => OnboardingView()),
      GoRoute(path: splash, builder: (context, state) => SplashView()),

      // // handle login
      // GoRoute(
      //   path: '/__/auth/links',
      //   redirect: (context, state) {
      //     final link = state.uri.queryParameters['link'];
      //     if (link != null) {
      //       final innerUri = Uri.parse(link);
      //       final oobCode = innerUri.queryParameters['oobCode'];
      //       if (oobCode != null) {
      //         return '$login?oobCode=$oobCode';
      //       }
      //     }
      //     return login;
      //   },
      // ),
      GoRoute(
        path: login,
        builder: (context, state) {
          // String oobCode = state.uri.queryParameters['oobCode'] ?? "";
          return LoginView();
        },
      ),

      GoRoute(path: register, builder: (context, state) => RegisterView()),
      GoRoute(
        path: forgetPassword,
        builder: (context, state) => ForgetPasswordView(),
      ),

      // handle resetPassword
      GoRoute(
        path: resetYourPassword,
        builder: (context, state) {
          String oobCode = state.uri.queryParameters['oobCode'] ?? "";
          return ResetYourPasswordView(oobCode: oobCode);
        },
      ),

      GoRoute(
        path: '/__/auth/links',
        redirect: (context, state) {
          final link = state.uri.queryParameters['link'];
          if (link != null) {
            final innerUri = Uri.parse(link);
            final oobCode = innerUri.queryParameters['oobCode'];
            if (oobCode != null) {
              return '$resetYourPassword?oobCode=$oobCode';
            }
          }
          return resetYourPassword;
        },
      ),

      GoRoute(
        path: itemDetails,
        builder: (context, state) {
          Map<String, dynamic> data = state.extra as Map<String, dynamic>;
          return FruitItemDetailsWrapper(data: data);
        },
      ),

      GoRoute(
        path: reviewAndRating,
        builder: (context, state) {
          Map<String, dynamic> data = state.extra as Map<String, dynamic>;
          return ReviewAndRatingWrapper(data: data);
        },
      ),
    ],
  );
}
