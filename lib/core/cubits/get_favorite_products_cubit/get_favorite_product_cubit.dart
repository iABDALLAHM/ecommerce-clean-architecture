import 'package:ecommerce_clean_architecture/core/cubits/get_favorite_products_cubit/get_favorite_product_states.dart';
import 'package:ecommerce_clean_architecture/core/entities/product_entity.dart';
import 'package:ecommerce_clean_architecture/core/repos/products_repo/products_repo.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class GetFavoriteProductCubit extends Cubit<GetFavoriteProductStates> {
  GetFavoriteProductCubit({required this.productsRepo})
    : super(InitialGetFavoriteProductState());
  final ProductsRepo productsRepo;

  Future getFavoriteProduct({required ProductEntity product}) async {
    var result = await productsRepo.getFavoriteProducts();
    result.fold(
      (failure) {
        emit(FailureGetFavoriteProductState(errMessage: failure.message));
      },
      (products) {
        emit(SuccessGetFavoriteProductState(productsList: products));
      },
    );
  }
}
