import 'package:ecommerce_clean_architecture/constants.dart';
import 'package:ecommerce_clean_architecture/core/entities/product_entity.dart';

ProductEntity dummyProduct() {
  return ProductEntity(
    productName: "بطيخ",
    productPrice: 60,
    productCode: "FRU-WM-001",
    productDiscription: "بطيخ طازج عالي الجودة، مزروع محليًا وخالي من المواد الحافظة.",
    isFeaturedProduct: true,
    productImageUrl: kDefaultUserImageUrl,
    isOrganicProduct: true,
    expirationYears: 1,
    numberOfCalories: 30,
    unitAmount: 5,
    averageRating: 4.6,
    ratingCount: 124,
    reviews: [],
    sellingCount: 842,
  );
}

List<ProductEntity> getDummyProducts() {
  return [dummyProduct(), dummyProduct(), dummyProduct(), dummyProduct()];
}
