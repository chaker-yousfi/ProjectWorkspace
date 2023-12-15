import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ecommerce_app/model/product.dart';
import 'package:flutter/material.dart';

class ProductProvider with ChangeNotifier {
  List<Product> featured = [];
  late Product featuredData;
  Future<void> getFeaturedData() async {
    List<Product> newList = [];
    QuerySnapshot featuredSnapShot = await FirebaseFirestore.instance
        .collection("products")
        .doc("yUysk9gzJ6xH8zhsrurZ")
        .collection("featuredproduct")
        .get();
    featuredSnapShot.docs.forEach(
      (element) {
        featuredData = Product(
            element["image"], element["name"], element["price"].toDouble());
        newList.add(featuredData);
      },
    );
    featured = newList;
  }

  List<Product> get getFeaturedList {
    return featured;
  }

  List<Product> newproduct = [];
  late Product newData;
  Future<void> getNewData() async {
    List<Product> newList = [];
    QuerySnapshot newSnapShot = await FirebaseFirestore.instance
        .collection("products")
        .doc("yUysk9gzJ6xH8zhsrurZ")
        .collection("newproduct")
        .get();
    newSnapShot.docs.forEach(
      (element) {
        newData = Product(
          element["image"],
          element["name"],
          element["price"].toDouble(),
        );
        newList.add(newData);
      },
    );
    newproduct = newList;
  }

  List<Product> get getNewList {
    return newproduct;
  }
}
