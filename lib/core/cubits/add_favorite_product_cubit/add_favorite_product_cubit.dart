import 'package:ecommerce_clean_architecture/core/cubits/add_favorite_product_cubit/add_favorite_product_states.dart';
import 'package:ecommerce_clean_architecture/core/entities/product_entity.dart';
import 'package:ecommerce_clean_architecture/core/repos/products_repo/products_repo.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AddFavoriteProductCubit extends Cubit<AddFavoriteProductStates> {
  AddFavoriteProductCubit({required this.productsRepo})
    : super(InitialAddFavoriteProductState());
  final ProductsRepo productsRepo;

  Future addFavoriteProduct({required ProductEntity product}) async {
    var result = await productsRepo.addFavoriteProducts(product: product);
    result.fold(
      (failure) {
        emit(FailureAddFavoriteProductState(errMessage: failure.message));
      },
      (success) {
        emit(SuccessAddFavoriteProductState());
      },
    );
  }
}
