import 'package:ecommerce_app/views/cart_view.dart';
import 'package:ecommerce_app/views/login_view.dart';
import 'package:ecommerce_app/views/sign_up_view.dart';
import 'package:ecommerce_app/views/welcome_view.dart';
import 'package:ecommerce_app/views/homepage_view.dart';
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
            // primaryColor: Color(0xff746bc9),
            // scaffoldBackgroundColor: Colors.white,
            // visualDensity: VisualDensity.adaptivePlatformDensity,
            ),
<<<<<<< HEAD
        home: WelcomeView());
=======
        home: WelcomeView(),
        routes: {
          HomePageView.pageRoute: (ctx) => HomePageView(),
        });
>>>>>>> a158b6775d7868f9d2702943430d25a7e7f16ee3
  }
}
