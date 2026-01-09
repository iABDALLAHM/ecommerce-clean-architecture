import 'package:ecommerce_clean_architecture/core/entities/product_entity.dart';

ProductEntity dummyProduct() {
  return ProductEntity(
    name: "بطيخ",
    price: 60.0,
    code: "FRU-WM-001",
    discription: "بطيخ طازج عالي الجودة، مزروع محليًا وخالي من المواد الحافظة.",
    isFeatured: true,
    imageUrl: "",
    isOrganic: true,
    expirationMonths: 2,
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
