import 'package:ecommerce_clean_architecture/features/main/domain/repositories/featured_products_repository/featured_products_repository.dart';
import 'package:ecommerce_clean_architecture/features/main/presentation/home/cubits/get_featured_product_cubit/get_featured_product_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

@injectable
class GetFeaturedProductCubit extends Cubit<GetFeaturedProductState> {
  GetFeaturedProductCubit({
    required FeaturedProductsRepository featuredProductsRepository,
  }) : _featuredProductsRepository = featuredProductsRepository,
       super(InitialGetFeaturedProductState());
  final FeaturedProductsRepository _featuredProductsRepository;

  Future getFeaturedProducts() async {
    emit(LoadingGetFeaturedProductState());
    var result = await _featuredProductsRepository.getFeaturedProducts();
    result.fold(
      (failure) {
        emit(FailureGetFeaturedProductState(errorMessage: failure.message));
      },
      (success) {
        emit(SuccessGetFeaturedProductState(featuredProducts: success));
      },
    );
  }
}
