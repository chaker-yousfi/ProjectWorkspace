import 'package:ecommerce_app/views/details_view.dart';
import 'package:ecommerce_app/views/homepage_view.dart';
import 'package:ecommerce_app/views/list_product_view.dart';
import 'package:ecommerce_app/views/login_view.dart';
import 'package:ecommerce_app/views/sign_up_view.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
<<<<<<< HEAD
          // primaryColor: Color(0xff746bc9),
          // scaffoldBackgroundColor: Colors.white,
          // visualDensity: VisualDensity.adaptivePlatformDensity,
        ),
        home:  DetailsView());
=======
            // primaryColor: Color(0xff746bc9),
            // scaffoldBackgroundColor: Colors.white,
            // visualDensity: VisualDensity.adaptivePlatformDensity,
            ),
        home: HomePageView());
>>>>>>> a1dc68fae3c6dcb24e0b6f011fa2e69f4a3770f6
  }
}
