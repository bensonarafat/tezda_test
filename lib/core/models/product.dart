import 'package:json_annotation/json_annotation.dart';
import 'package:tezda_test/core/models/category.dart';

part 'product.g.dart';

@JsonSerializable(explicitToJson: true)
class Product {
  final int id;
  final String title;
  final double price;
  final String description;
  final List<String> images;
  final DateTime creationAt;
  final DateTime updatedAt;
  final Category category;

  Product(
      {required this.id,
      required this.title,
      required this.price,
      required this.description,
      required this.images,
      required this.creationAt,
      required this.updatedAt,
      required this.category});

  factory Product.fromJson(Map<String, dynamic> json) =>
      _$ProductFromJson(json);

  Map<String, dynamic> toJson() => _$ProductToJson(this);
}
