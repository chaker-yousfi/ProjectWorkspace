import 'package:ecommerce_app/views/homepage_view.dart';
import 'package:ecommerce_app/views/login_view.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:provider/provider.dart';
import 'firebase_options.dart';
import 'package:ecommerce_app/provider/product_provider.dart';
import 'package:ecommerce_app/provider/category_provider.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(MyApp());
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
      debugShowCheckedModeBanner: false,
      home: MultiProvider(
        providers: [
          ListenableProvider<ProductProvider>(
            create: (ctx) => ProductProvider(),
          ),
          ListenableProvider<CategoryProvider>(
            create: (ctx) => CategoryProvider(),
          ),
        ],
        child: StreamBuilder(
          stream: FirebaseAuth.instance.authStateChanges(),
          builder: (ctx, snapShot) {
            if (snapShot.hasData) {
              return HomePageView();
            } else {
              return LoginView();
            }
          },
        ),
      ),
    );
  }
}
