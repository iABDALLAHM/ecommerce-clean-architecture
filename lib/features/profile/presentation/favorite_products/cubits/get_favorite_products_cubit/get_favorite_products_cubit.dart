import 'package:ecommerce_clean_architecture/features/profile/presentation/favorite_products/cubits/get_favorite_products_cubit/get_favorite_products_states.dart';
import 'package:ecommerce_clean_architecture/features/main/domain/repositories/products_repository/products_repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

@injectable
class GetFavoriteProductsCubit extends Cubit<GetFavoriteProductsStates> {
  GetFavoriteProductsCubit({required this.productsRepo})
    : super(InitialGetFavoriteProductsState());

  final ProductsRepository productsRepo;

  Future getFavoriteProducts() async {
    emit(LoadingGetFavoriteProductsState());
    var result = await productsRepo.getFavoriteProducts();

    result.fold(
      (failure) {
        emit(FailureGetFavoriteProductsState(errorMessage: failure.message));
      },
      (products) {
        if (products.isEmpty) {
          emit(EmptyFavoriteProductsState());
        } else {
          emit(SuccessGetFavoriteProductsState(productsList: products));
        }
      },
    );
  }
}
