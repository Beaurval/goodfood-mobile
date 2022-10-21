import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';

class Produit extends Equatable {
  final int? id;
  final int? categoryId;
  final int? restaurantId;
  final String? name;
  final String? price;
  final String? description;
  final Image? productImage;

  const Produit({
    required this.id,
    required this.name,
    required this.price,
    required this.categoryId,
    required this.restaurantId,
    required this.description,
    required this.productImage,
  });

  @override
  List<Object?> get props => [
        id,
        name,
        price,
        categoryId,
    restaurantId,
        description,
        productImage,
      ];
}
