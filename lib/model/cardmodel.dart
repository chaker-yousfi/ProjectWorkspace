import 'package:flutter/material.dart';

class CardModel {
  final String name;
  final String image;
  final double price;
  final int quantity;

  CardModel(
      {required this.name,
      required this.image,
      required this.price,
      required this.quantity});
}
