import 'package:ecommerce_clean_architecture/core/services/get_it_service/get_it_service.dart';
import 'package:ecommerce_clean_architecture/features/item_details/presentation/cubits/get_reviews_cubit/get_reviews_cubit.dart';
import 'package:ecommerce_clean_architecture/features/review_and_rating/domain/entities/repositories/reviews_repository/reviews_repository.dart';
import 'package:ecommerce_clean_architecture/features/review_and_rating/presentation/cubits/add_review_cubit/add_review_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class FruitItemDetailsBlocProvider extends StatelessWidget {
  const FruitItemDetailsBlocProvider({super.key, required this.child});
  final Widget child;
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) =>
              AddReviewCubit(reviewsRepository: getIt.get<ReviewsRepository>()),
        ),
        BlocProvider(
          create: (context) => GetReviewsCubit(
            reviewsRepository: getIt.get<ReviewsRepository>(),
          ),
        ),
      ],
      child: child,
    );
  }
}
