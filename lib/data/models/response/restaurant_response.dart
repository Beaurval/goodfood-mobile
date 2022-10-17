import 'dart:convert';
import 'dart:io';

import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:goodfood_mobile/domain/entities/user/restaurant.dart';

class RestaurantResponse extends Equatable {
  final int? id;
  final String? name;
  final String? address;
  final String? cp;
  final String? city;
  final String? informations;
  final Image? providerImage;
  final bool? isOpen;

  const RestaurantResponse({
    required this.id,
    required this.name,
    required this.address,
    required this.cp,
    required this.city,
    required this.informations,
    required this.providerImage,
    required this.isOpen,
  });

  @override
  List<Object?> get props => [
        id,
        name,
        address,
        cp,
        city,
        informations,
        providerImage,
        isOpen,
      ];

  Restaurant toEntity() {
    return Restaurant(
        name: name,
        address: address,
        id: id,
        cp: cp,
        city: city,
        informations: informations,
        isOpen: isOpen,
        providerImage: providerImage);
  }

  factory RestaurantResponse.fromMap(Map<String, dynamic> map) {
    return RestaurantResponse(
        id: map['id'],
        address: map['address'],
        name: map['name'],
        cp: map['cp'],
        city: map['phonecityNumber'],
        informations: map['informations'],
        isOpen: map['isOpen'],
        providerImage: Image.memory(
          base64.decode(map['providerImage']),
          height: 70,
          width: 100,
          fit: BoxFit.cover,
        ));
  }
}
