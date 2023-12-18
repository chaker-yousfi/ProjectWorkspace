import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ecommerce_app/model/categoryicon.dart';
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
  List<CategoryIcon> shirtIcon = [];
  late CategoryIcon shirtIconData;
  List<CategoryIcon> shoesIcon = [];
  late CategoryIcon shoesIconData;
  List<CategoryIcon> shortsIcon = [];
  late CategoryIcon shortsIconData;
  List<CategoryIcon> tracksuitIcon = [];
  late CategoryIcon tracksuitIconData;
  List<CategoryIcon> glovesIcon = [];
  late CategoryIcon glovesIconData;

  Future<void> getShirtIconData() async {
    List<CategoryIcon> newList = [];
    QuerySnapshot shirtIconSnapShot = await FirebaseFirestore.instance
        .collection("categoryicon")
        .doc("GhKATQuB0ozBMgaiwTfM")
        .collection("shirts")
        .get();
    shirtIconSnapShot.docs.forEach(
      (element) {
        shirtIconData = CategoryIcon(element["image"]);
        newList.add(shirtIconData);
      },
    );
    shirtIcon = newList;
    notifyListeners();
  }

  List<CategoryIcon> get getShirtIconList {
    return shirtIcon;
  }

  Future<void> getShoesIconData() async {
    List<CategoryIcon> newList = [];
    QuerySnapshot shoesIconSnapShot = await FirebaseFirestore.instance
        .collection("categoryicon")
        .doc("GhKATQuB0ozBMgaiwTfM")
        .collection("shoes")
        .get();
    shoesIconSnapShot.docs.forEach(
      (element) {
        shoesIconData = CategoryIcon(element["image"]);
        newList.add(shoesIconData);
      },
    );
    shoesIcon = newList;
    notifyListeners();
  }

  List<CategoryIcon> get getShoesIconList {
    return shoesIcon;
  }

  Future<void> getShortsIconData() async {
    List<CategoryIcon> newList = [];
    QuerySnapshot shortsIconSnapShot = await FirebaseFirestore.instance
        .collection("categoryicon")
        .doc("GhKATQuB0ozBMgaiwTfM")
        .collection("shorts")
        .get();
    shortsIconSnapShot.docs.forEach(
      (element) {
        shortsIconData = CategoryIcon(element["image"]);
        newList.add(shortsIconData);
      },
    );
    shortsIcon = newList;
    notifyListeners();
  }

  List<CategoryIcon> get getShortsIconList {
    return shortsIcon;
  }

  Future<void> getTracksuitIconData() async {
    List<CategoryIcon> newList = [];
    QuerySnapshot tracksuitIconSnapShot = await FirebaseFirestore.instance
        .collection("categoryicon")
        .doc("GhKATQuB0ozBMgaiwTfM")
        .collection("tracksuit")
        .get();
    tracksuitIconSnapShot.docs.forEach(
      (element) {
        tracksuitIconData = CategoryIcon(element["image"]);
        newList.add(tracksuitIconData);
      },
    );
    tracksuitIcon = newList;
    notifyListeners();
  }

  List<CategoryIcon> get getTracksuitIconList {
    return tracksuitIcon;
  }

  Future<void> getGlovesIconData() async {
    List<CategoryIcon> newList = [];
    QuerySnapshot glovesIconSnapShot = await FirebaseFirestore.instance
        .collection("categoryicon")
        .doc("GhKATQuB0ozBMgaiwTfM")
        .collection("gloves")
        .get();
    glovesIconSnapShot.docs.forEach(
      (element) {
        glovesIconData = CategoryIcon(element["image"]);
        newList.add(glovesIconData);
      },
    );
    glovesIcon = newList;
    notifyListeners();
  }

  List<CategoryIcon> get getGlovesIconList {
    return glovesIcon;
  }

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
            image:element["image"], name:element["name"], price:element["price"].toDouble() );
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
            image:element["image"], name  :element["name"], price:element["price"].toDouble());
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
            image:element["image"], name:element["name"], price:element["price"].toDouble());
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
            image:element["image"], name:element["name"], price:element["price"].toDouble());
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
            image:element["image"], name:element["name"], price:element["price"].toDouble());
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
