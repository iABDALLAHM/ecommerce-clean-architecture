import 'package:ecommerce_clean_architecture/constants.dart';
import 'package:ecommerce_clean_architecture/features/main/domain/entities/product_entity/product_entity.dart';

ProductEntity dummyProduct() {
  return ProductEntity(
    productName: "بطيخ",
    productPrice: 60,
    productCode: "FRU-WM-001",
    description: "بطيخ طازج عالي الجودة، مزروع محليًا وخالي من المواد الحافظة.",
    productImageUrl: kDefaultUserImageUrl,
    isOrganicProduct: true,
    expirationYears: 1,
    numberOfCalories: 30,
    unitAmount: 5,
  );
}

List<ProductEntity> getDummyProducts() {
  return [dummyProduct(), dummyProduct(), dummyProduct(), dummyProduct()];
}
