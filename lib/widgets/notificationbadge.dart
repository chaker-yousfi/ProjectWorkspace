import 'package:flutter/material.dart';
import 'package:badges/badges.dart' as badge;
import '../provider/product_provider.dart';
import 'package:provider/provider.dart';

class NotificationsButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
      ProductProvider productProvider = Provider.of<ProductProvider>(context);

    return badge.Badge(
      position: badge.BadgePosition.custom(top: 8, start: 25),
      badgeContent: Text(productProvider.getNotificationIndex.toString()),
      child: IconButton(
        onPressed: () {
          // Add your onPressed logic here
        },
        icon: Icon(
          Icons.notifications_none,
          color: Colors.black,
        ),
      ),
    );
  }
}
