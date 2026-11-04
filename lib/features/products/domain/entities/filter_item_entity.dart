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

List<FilterItemEntity> listOfFilters = [
  FilterItemEntity(
    title: 'Organic',
    icon: Icons.eco_outlined,
    filter: ProductFilters.organic,
  ),
  FilterItemEntity(
    title: 'Low Calories',
    icon: Icons.fitness_center,
    filter: ProductFilters.lowCalories,
  ),
  FilterItemEntity(
    title: '< 100 EGP',
    icon: Icons.payments,
    filter: ProductFilters.lowerThan100EGP,
  ),
  FilterItemEntity(
    title: 'High Energy',
    icon: Icons.electric_bolt_outlined,
    filter: ProductFilters.highCalories,
  ),
];
