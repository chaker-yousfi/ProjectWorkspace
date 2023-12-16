import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ecommerce_app/model/product.dart';
import 'package:flutter/material.dart';

class CategoryProvider with ChangeNotifier {
  List<Product> shirt = [];
  late Product shirtData;
  List<Product> shoes = [];
  late Product shoesData;
  List<Product> shorts = [];
  late Product shortsData;
  List<Product> tracksuit = [];
  late Product trascksuitData;
  List<Product> gloves = [];
  late Product glovesData;
  Future<void> getShirtData() async {
    List<Product> newList = [];
    QuerySnapshot shirtSnapShot = await FirebaseFirestore.instance
        .collection("category")
        .doc("cLzR40WWCEwKbVdYi1YV")
        .collection("shirt")
        .get();
    shirtSnapShot.docs.forEach(
      (element) {
        shirtData = Product(
            element["image"], element["name"], element["price"].toDouble());
        newList.add(shirtData);
      },
    );
    shirt = newList;
    notifyListeners();
  }

  List<Product> get getShirtList {
    return shirt;
  }

  Future<void> getShoesData() async {
    List<Product> newList = [];
    QuerySnapshot shoesSnapShot = await FirebaseFirestore.instance
        .collection("category")
        .doc("cLzR40WWCEwKbVdYi1YV")
        .collection("shoes")
        .get();
    shoesSnapShot.docs.forEach(
      (element) {
        shoesData = Product(
            element["image"], element["name"], element["price"].toDouble());
        newList.add(shoesData);
      },
    );
    shoes = newList;
    notifyListeners();
  }

  List<Product> get getShoesList {
    return shoes;
  }

  Future<void> getShortsData() async {
    List<Product> newList = [];
    QuerySnapshot shortsSnapShot = await FirebaseFirestore.instance
        .collection("category")
        .doc("cLzR40WWCEwKbVdYi1YV")
        .collection("shorts")
        .get();
    shortsSnapShot.docs.forEach(
      (element) {
        shortsData = Product(
            element["image"], element["name"], element["price"].toDouble());
        newList.add(shortsData);
      },
    );
    shorts = newList;
    notifyListeners();
  }

  List<Product> get getShortsList {
    return shorts;
  }

  Future<void> getTracksuitData() async {
    List<Product> newList = [];
    QuerySnapshot tracksuitSnapShot = await FirebaseFirestore.instance
        .collection("category")
        .doc("cLzR40WWCEwKbVdYi1YV")
        .collection("tracksuit")
        .get();
    tracksuitSnapShot.docs.forEach(
      (element) {
        trascksuitData = Product(
            element["image"], element["name"], element["price"].toDouble());
        newList.add(trascksuitData);
      },
    );
    tracksuit = newList;
    notifyListeners();
  }

  List<Product> get getTracksuitList {
    return tracksuit;
  }

  Future<void> getGlovesData() async {
    List<Product> newList = [];
    QuerySnapshot glovesSnapShot = await FirebaseFirestore.instance
        .collection("category")
        .doc("cLzR40WWCEwKbVdYi1YV")
        .collection("gloves")
        .get();
    glovesSnapShot.docs.forEach(
      (element) {
        glovesData = Product(
            element["image"], element["name"], element["price"].toDouble());
        newList.add(glovesData);
      },
    );
    gloves = newList;
    notifyListeners();
  }

  List<Product> get getGlovesList {
    return gloves;
  }
}
