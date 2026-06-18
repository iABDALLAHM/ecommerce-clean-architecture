import 'package:ecommerce_clean_architecture/features/profile/presentation/cubits/get_favorite_products_cubit/get_favorite_product_states.dart';
import 'package:ecommerce_clean_architecture/features/main/data/repositories/products_repository/products_repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class GetFavoriteProductCubit extends Cubit<GetFavoriteProductStates> {
  GetFavoriteProductCubit({required this.productsRepo})
    : super(InitialGetFavoriteProductState());
  final ProductsRepository productsRepo;

  Future getFavoriteProduct() async {
    emit(LoadingGetFavoriteProductState());
    var result = await productsRepo.getFavoriteProducts();
    result.fold(
      (failure) {
        emit(FailureGetFavoriteProductState(errMessage: failure.message));
      },
      (products) {
        if (products.isEmpty) {
          emit(EmptyFavoriteProductState());
        } else {
          emit(SuccessGetFavoriteProductState(productsList: products));
        }
      },
    );
  }
}
