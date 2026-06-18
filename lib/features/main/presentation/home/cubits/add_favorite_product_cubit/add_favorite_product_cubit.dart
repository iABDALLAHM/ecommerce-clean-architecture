import 'package:ecommerce_clean_architecture/features/main/presentation/home/cubits/add_favorite_product_cubit/add_favorite_product_states.dart';
import 'package:ecommerce_clean_architecture/features/main/domain/entities/product_entity/product_entity.dart';
import 'package:ecommerce_clean_architecture/features/main/data/repositories/products_repository/products_repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AddFavoriteProductCubit extends Cubit<AddFavoriteProductStates> {
  AddFavoriteProductCubit({required this.productsRepo})
    : super(InitialAddFavoriteProductState());
  final ProductsRepository productsRepo;

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
