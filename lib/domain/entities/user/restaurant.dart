import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';

class Restaurant extends Equatable {
  final int? id;
  final String? name;
  final String? address;
  final String? cp;
  final String? city;
  final String? informations;
  final Image? providerImage;
  final bool? isOpen;

  const Restaurant({
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
}
