import 'dart:convert';
import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:goodfood_mobile/domain/entities/produit.dart';

class ProduitResponse extends Equatable {
  final int? id;
  final String? name;
  final String? price;
  final int? categoryId;
  final int? restaurantId;
  final String? description;
  final Image? productImage;

  const ProduitResponse({
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

  Produit toEntity() {
    return Produit(
        name: name,
        price: price,
        id: id,
        categoryId: categoryId,
        restaurantId: restaurantId,
        description: description,
        productImage: productImage);
  }

  factory ProduitResponse.fromMap(Map<String, dynamic> map) {
    return ProduitResponse(
        id: map['id'],
        price: map['price'],
        name: map['name'],
        categoryId: map['categoryId'],
        restaurantId: map['restaurantId'],
        description: map['description'],
        productImage: Image.memory(
          base64.decode(map['productImage']),
          height: 70,
          width: 100,
          fit: BoxFit.cover,
        ));
  }
}
