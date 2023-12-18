import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ecommerce_app/model/cardmodel.dart';
import 'package:ecommerce_app/model/product.dart';
import 'package:flutter/material.dart';

class ProductProvider with ChangeNotifier {
  List<Product> featured = [];
  late Product featuredData;
  List<CardModel> cardModelList = [];
  late CardModel cardModel;

  void getCardData({
    required String name,
    required String image,
    required int quantity,
    required double price,
  }) {
    cardModel =
        CardModel(name: name, image: image, price: price, quantity: quantity);
    cardModelList.add(cardModel);
  }

  List<CardModel> get getCardModelList {
    return List.from(cardModelList);
  }

  int get getCardModelListLength {
    return cardModelList.length;
  }

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
            image: element["image"],
            name: element["name"],
            price: element["price"].toDouble());
        newList.add(featuredData);
      },
    );
    featured = newList;
  }

  List<Product> homeFeatured = [];
  late Product homeFeaturedData;
  Future<void> getHomeFeaturedData() async {
    List<Product> newList = [];
    QuerySnapshot featuredSnapShot =
        await FirebaseFirestore.instance.collection("homefeatured").get();
    for (var element in featuredSnapShot.docs) {
      featuredData = Product(
          image: element["image"],
          name: element["name"],
          price: element["price"].toDouble());
      newList.add(featuredData);
    }
    homeFeatured = newList;
    notifyListeners();
  }

  List<Product> homeNew = [];
  late Product homeNewData;
  Future<void> getHomeNewData() async {
    List<Product> newList = [];
    QuerySnapshot featuredSnapShot =
        await FirebaseFirestore.instance.collection("homenew").get();
    for (var element in featuredSnapShot.docs) {
      featuredData = Product(
          image: element["image"],
          name: element["name"],
          price: element["price"].toDouble());
      newList.add(featuredData);
    }
    homeNew = newList;
    notifyListeners();
  }

  List<Product> get getHomeNewList {
    return homeNew;
  }

  List<Product> get getHomeFeaturedList {
    return homeFeatured;
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
          image: element["image"],
          name: element["name"],
          price: element["price"].toDouble(),
        );
        newList.add(newData);
      },
    );
    newproduct = newList;
    notifyListeners();
  }

  List<Product> get getNewList {
    return newproduct;
  }

  List<String> notificationList = [];

  void addNotification(String notificaion) {
    notificationList.add(notificaion);
  }

  int get getNotificationIndex {
    return notificationList.length;
  }
}
