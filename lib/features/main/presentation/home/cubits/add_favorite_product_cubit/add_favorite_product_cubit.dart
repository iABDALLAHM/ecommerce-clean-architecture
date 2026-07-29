import 'package:ecommerce_clean_architecture/features/main/domain/repositories/products_repository/products_repository.dart';
import 'package:ecommerce_clean_architecture/features/main/presentation/home/cubits/add_favorite_product_cubit/add_favorite_product_states.dart';
import 'package:ecommerce_clean_architecture/features/main/domain/entities/product_entity/product_entity.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

@injectable
class AddFavoriteProductCubit extends Cubit<FavoriteProductStates> {
  AddFavoriteProductCubit({required this.productsRepository})
    : super(InitialFavoriteProductState());

  final ProductsRepository productsRepository;
  final List<ProductEntity> favoriteProducts = [];

  Future<void> toggleFavorite({required ProductEntity product}) async {
    if (favoriteProducts.contains(product)) {
      await handleIfProductIsFavorite(product: product);
    } else {
      await handleIfProductIsNotFavorite(product: product);
    }
  }

  Future<void> handleIfProductIsNotFavorite({
    required ProductEntity product,
  }) async {
    var result = await productsRepository.addFavoriteProduct(product: product);
    result.fold(
      (l) {
        emit(FailureAddFavoriteProduct(errorMessage: l.message));
      },
      (success) {
        favoriteProducts.add(product);
        emit(SuccessAddFavoriteProduct(productEntity: product));
      },
    );
  }

  Future<void> handleIfProductIsFavorite({
    required ProductEntity product,
  }) async {
    var result = await productsRepository.removeFavoriteProduct(
      product: product,
    );
    result.fold(
      (failure) {
        emit(FailureRemoveFavoriteProduct(errorMessage: failure.message));
      },
      (success) {
        favoriteProducts.remove(product);
        emit(SuccessRemoveFavoriteProduct(productEntity: product));
      },
    );
  }

  bool isFavorited({required ProductEntity product}) {
    return favoriteProducts.contains(product);
  }
}
