import 'dart:developer';
import 'package:easy_localization/easy_localization.dart';
import 'package:ecommerce_clean_architecture/constants.dart';
import 'package:ecommerce_clean_architecture/core/functions/show_snack_bar.dart';
import 'package:ecommerce_clean_architecture/core/utils/app_routes.dart';
import 'package:ecommerce_clean_architecture/features/cart/presentation/cubits/cart_cubit/cart_cubit.dart';
import 'package:ecommerce_clean_architecture/features/cart/presentation/cubits/cart_cubit/cart_states.dart';
import 'package:ecommerce_clean_architecture/features/last_orders/presentation/cubits/get_my_orders_cubit/get_my_orders_cubit.dart';
import 'package:ecommerce_clean_architecture/features/last_orders/presentation/cubits/get_my_orders_cubit/get_my_orders_state.dart';
import 'package:ecommerce_clean_architecture/features/main/presentation/home/cubits/add_favorite_product_cubit/add_favorite_product_cubit.dart';
import 'package:ecommerce_clean_architecture/features/main/presentation/home/cubits/add_favorite_product_cubit/add_favorite_product_states.dart';
import 'package:ecommerce_clean_architecture/features/main/presentation/home/cubits/get_featured_product_cubit/get_featured_product_cubit.dart';
import 'package:ecommerce_clean_architecture/features/main/presentation/home/cubits/get_featured_product_cubit/get_featured_product_state.dart';
import 'package:ecommerce_clean_architecture/features/main/presentation/home/cubits/products_cubit/products_cubit.dart';
import 'package:ecommerce_clean_architecture/features/main/presentation/core/widgets/search_bar_trigger.dart';
import 'package:ecommerce_clean_architecture/features/main/presentation/home/cubits/verify_change_email_cubit/verify_change_email_cubit.dart';
import 'package:ecommerce_clean_architecture/features/main/presentation/home/widgets/home_body_header.dart';
import 'package:ecommerce_clean_architecture/features/main/presentation/home/widgets/banner_list.dart';
import 'package:ecommerce_clean_architecture/features/main/presentation/home/widgets/custom_home_app_bar.dart';
import 'package:ecommerce_clean_architecture/features/main/presentation/core/widgets/fruit_items_grid_view_bloc_builder.dart';
import 'package:ecommerce_clean_architecture/features/main/presentation/home/widgets/last_orders_banner.dart';
import 'package:ecommerce_clean_architecture/features/main/presentation/home/widgets/verify_change_email_dialog.dart';
import 'package:ecommerce_clean_architecture/features/main/presentation/notification/cubits/get_notifications_cubit/get_notifications_cubit.dart';
import 'package:ecommerce_clean_architecture/generated/locale_keys.g.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeBody extends StatefulWidget {
  const HomeBody({super.key, required this.oobCode});
  final String oobCode;
  @override
  State<HomeBody> createState() => _HomeBodyState();
}

class _HomeBodyState extends State<HomeBody> {
  late ScrollController scrollController;

  @override
  void initState() {
    scrollController = ScrollController();
    scrollController.addListener(() {
      if (scrollController.position.pixels >=
          scrollController.position.maxScrollExtent) {
        context.read<ProductsCubit>().getProducts(isLoadMore: true);
      }
    });
    context.read<ProductsCubit>().getProducts();
    context.read<GetMyOrdersCubit>().getMyOrders();
    context.read<GetNotificationsCubit>().getNotification();
    context.read<GetFeaturedProductCubit>().getFeaturedProducts();
    if (widget.oobCode.isNotEmpty) {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        Future.delayed(const Duration(milliseconds: 300), () {
          if (mounted) _showVerifyEmailDialog();
        });
      });
    }
    super.initState();
  }

  @override
  void dispose() {
    scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: HomeBodyMultiBlocListenr(
        child: CustomScrollView(
          controller: scrollController,
          slivers: [
            SliverToBoxAdapter(
              child: Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: kHorizontalPadding,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(height: 16),
                    CustomHomeAppBar(),
                    const SizedBox(height: 16),
                    SearchBarTrigger(fromRoute: AppRoutes.home),
                    const SizedBox(height: 12),
                    BlocBuilder<
                      GetFeaturedProductCubit,
                      GetFeaturedProductState
                    >(
                      builder: (context, state) {
                        if (state is SuccessGetFeaturedProductState) {
                          return BannerList(
                            featuredProducts: state.featuredProducts,
                          );
                        }
                        return SizedBox();
                      },
                    ),
                    const SizedBox(height: 12),
                    BlocBuilder<GetMyOrdersCubit, GetMyOrdersState>(
                      builder: (context, state) {
                        if (state is GetMyOrdersSuccessState) {
                          var listOfOrders = state.listOfOrders;
                          for (var item in listOfOrders) {
                            if (item.orderStatusEntity.orderDelivered == true) {
                              return LastOrdersBanner(orderEntity: item);
                            }
                          }
                        } else if (state is GetMyOrdersLoadingState) {
                          Center(child: CircularProgressIndicator());
                        }
                        return SizedBox();
                      },
                    ),
                    const SizedBox(height: 12),
                    HomeBodyHeader(),
                    const SizedBox(height: 8),
                  ],
                ),
              ),
            ),
            SliverPadding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              sliver: FruitItemsGridViewBlocBuilder(),
            ),
            SliverToBoxAdapter(child: const SizedBox(height: 32)),
          ],
        ),
      ),
    );
  }

  void _showVerifyEmailDialog() {
    showDialog(
      context: context,
      builder: (_) {
        final verifyChangeEmailCubit = context.read<VerifyChangeEmailCubit>();
        return BlocProvider.value(
          value: verifyChangeEmailCubit,
          child: VerifyChangeEmailDialog(code: widget.oobCode),
        );
      },
    );
  }
}

class HomeBodyMultiBlocListenr extends StatelessWidget {
  const HomeBodyMultiBlocListenr({super.key, required this.child});
  final Widget child;
  @override
  Widget build(BuildContext context) {
    return MultiBlocListener(
      listeners: [
        BlocListener<AddFavoriteProductCubit, FavoriteProductStates>(
          listener: (context, state) {
            log("message");
            if (state is SuccessAddFavoriteProduct) {
              showSnackBar(
                context,
                message: LocaleKeys.home_messages_addProductToFav.tr(
                  context: context,
                ),
              );
            } else if (state is SuccessRemoveFavoriteProduct) {
              showSnackBar(
                context,
                message: LocaleKeys.home_messages_removeProductFromFav.tr(
                  context: context,
                ),
              );
            } else if (state is FailureAddFavoriteProduct) {
              showSnackBar(context, message: state.errorMessage);
            } else if (state is FailureRemoveFavoriteProduct) {
              showSnackBar(context, message: state.errorMessage);
            }
          },
        ),

        BlocListener<CartCubit, CartStates>(
          listener: (context, state) {
            if (state is CartUpdatedState) {
              showSnackBar(
                context,
                message: LocaleKeys.home_messages_addProductToCart.tr(
                  context: context,
                ),
              );
            } else if (state is CartUpdatedState) {
              showSnackBar(
                context,
                message: LocaleKeys.home_messages_loadingAddProductToCart.tr(
                  context: context,
                ),
              );
            } else if (state is CartUpdatedState) {
              showSnackBar(
                context,
                message: LocaleKeys.home_messages_productIncrementedInCart.tr(
                  context: context,
                ),
              );
            } else if (state is CartUpdatedState) {
              showSnackBar(
                context,
                message: LocaleKeys.home_messages_productDecrementedFromCart.tr(
                  context: context,
                ),
              );
            }
          },
        ),
      ],
      child: child,
    );
  }
}
