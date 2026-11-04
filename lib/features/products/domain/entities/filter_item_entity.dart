import 'package:ecommerce_clean_architecture/features/products/presentation/enums/product_filters/products_filters_enum.dart';
import 'package:flutter/material.dart';

class FilterItemEntity {
  final String title;
  final IconData icon;
  final ProductFilters filter;

  FilterItemEntity({
    required this.title,
    required this.icon,
    required this.filter,
  });
}
