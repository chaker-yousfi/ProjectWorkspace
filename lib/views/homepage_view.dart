<<<<<<< HEAD
import 'package:ecommerce_app/views/details_view.dart';
import 'package:ecommerce_app/views/list_product_view.dart';
import 'package:ecommerce_app/widgets/single_product_widget.dart';
=======
import '/views/list_product_view.dart';
import '/widgets/single_product_widget.dart';
>>>>>>> 7d79f13581817dcfd9f8add9d4e3f754464f7cfb
import 'package:flutter/material.dart';
import 'package:lecle_flutter_carousel_pro/lecle_flutter_carousel_pro.dart';

class HomePageView extends StatefulWidget {
  @override
  State<HomePageView> createState() => _HomePageViewState();
}

class _HomePageViewState extends State<HomePageView> {
  final GlobalKey<ScaffoldState> _key = GlobalKey<ScaffoldState>();

  // const HomePageView({super.key});
  Widget _buildProductCategory({required String? image, required colorCode}) {
    return CircleAvatar(
      maxRadius: 40,
      backgroundColor: Color(colorCode),
      child: Container(
        height: 40,
        child: Image(
          color: Colors.white,
          image: AssetImage("images/$image"),
        ),
      ),
      // backgroundImage: AssetImage("images/$image"),
    );
  }

  bool homeColor = true;
  bool cartColor = false;
  bool aboutUsColor = false;
  bool contactUsColor = false;

  Widget _buildProductSection() {
    return Column(
      children: <Widget>[
        Container(
          height: 50,
          child: const Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Featured Products",
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    "See All",
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
        Row(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Row(
                  children: <Widget>[
                    SingleProductWidget(
                        name: "Sportwear",
                        price: 4000,
                        image: "men_sportwear_img_1.jpeg"),
                    SingleProductWidget(
                        name: "Sportwear",
                        price: 4000,
                        image: "men_sportwear_img_1.jpeg"),
                  ],
                ),
              ],
            ),
          ],
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _key,
      drawer: Drawer(
        child: ListView(
          children: [
            UserAccountsDrawerHeader(
              accountName: Text(
                "loukmane",
                style: TextStyle(
                  color: Colors.black,
                ),
              ),
              currentAccountPicture:
                  CircleAvatar(backgroundImage: AssetImage('images/sport.png')),
              decoration: BoxDecoration(
                color: Color(0xfff2f2f2),
              ),
              accountEmail: Text(
                "loukmane@email.com",
                style: TextStyle(
                  color: Colors.black,
                ),
              ),
            ),
            ListTile(
              selected: homeColor,
              enabled: true,
              onTap: () {
                setState(() {
                  homeColor = true;
                  cartColor = false;
                  aboutUsColor = false;
                  contactUsColor = false;
                });
              },
              leading: Icon(Icons.home),
              title: Text("Home"),
            ),
            ListTile(
              selected: cartColor,
              onTap: () {
                setState(() {
                  homeColor = false;
                  cartColor = true;
                  aboutUsColor = false;
                  contactUsColor = false;
                });
              },
              leading: Icon(Icons.shopping_cart),
              title: Text("Cart"),
            ),
            ListTile(
              selected: aboutUsColor,
              onTap: () {
                setState(() {
                  homeColor = false;
                  cartColor = false;
                  aboutUsColor = true;
                  contactUsColor = false;
                });
              },
              leading: Icon(Icons.info),
              title: Text("About us"),
            ),
            ListTile(
              selected: contactUsColor,
              onTap: () {
                setState(() {
                  homeColor = false;
                  cartColor = false;
                  aboutUsColor = false;
                  contactUsColor = true;
                });
              },
              leading: Icon(Icons.mail),
              title: Text("Contact us"),
            ),
            ListTile(
              onTap: () {},
              leading: Icon(Icons.exit_to_app),
              title: Text("Logout"),
            ),
          ],
        ),
      ),
      appBar: AppBar(
        title: const Text(
          "Home Page",
          style: TextStyle(
            color: Colors.black,
          ),
        ),
        centerTitle: true,
        elevation: 0.0,
        backgroundColor: Colors.grey[100],
        leading: IconButton(
          icon: const Icon(
            Icons.menu,
            color: Colors.black,
          ),
          onPressed: () {
            _key.currentState?.openDrawer();
          },
        ),
        actions: <Widget>[
          IconButton(
            icon: const Icon(
              Icons.search,
              color: Colors.black,
            ),
            onPressed: () {},
          ),
          IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.notifications_none,
              color: Colors.black,
            ),
          ),
        ],
      ),
      body: Container(
        height: double.infinity,
        width: double.infinity,
        margin: const EdgeInsets.symmetric(horizontal: 20),
        child: ListView(
          children: [
            Column(
              children: <Widget>[
                Column(
                  children: <Widget>[
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Container(
                          height: 240,
                          child: Carousel(
                            showIndicator: false,
                            dotColor: Colors.white,
                            autoplay: true,
                            // dotBgColor: Colors.pinkAccent,
                            // dotIncreaseSize: 10,
                            // dotIncreasedColor: Colors.blue,
                            dotSize: 20,
                            images: [
                              AssetImage('images/sport.png'),
                              AssetImage('images/men_sportwear_img_1.jpeg'),
                            ],
                          ),
                        ),
                        Container(
                          height: 50,
                          child: const Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                "Categories",
                                style: TextStyle(
                                  fontSize: 17,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              // Text(
                              //   "See All",
                              //   style: TextStyle(
                              //     fontSize: 17,
                              //     fontWeight: FontWeight.bold,
                              //   ),
                              // ),
                            ],
                          ),
                        ),
                        Container(
                          height: 60,
                          child: Row(
                            children: <Widget>[
                              _buildProductCategory(
                                image: "sport.png",
                                colorCode: 0xff33dcfd,
                              ),
                              _buildProductCategory(
                                image: "sport.png",
                                colorCode: 0xff33dcfd,
                              ),
                              _buildProductCategory(
                                image: "sport.png",
                                colorCode: 0xff33dcfd,
                              ),
                              _buildProductCategory(
                                image: "sport.png",
                                colorCode: 0xff33dcfd,
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "Featured Products",
                              style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            GestureDetector(
                              onTap: () {
                                Navigator.of(context).pushReplacement(
                                  MaterialPageRoute(
                                    builder: (contetx) => ListProductView(
                                        name: "Featured Products"),
                                  ),
                                );
                              },
                              child: Text(
                                "See All",
                                style: TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ],
                        ),
                        Row(
                          children: <Widget>[
                            GestureDetector(
                              onTap: () {
                                Navigator.of(context).pushReplacement(
                                    MaterialPageRoute(
                                        builder: (ctx) => DetailsView(
                                            image: "men_sportwear_img_1.jpeg",
                                            name: "Sportwear",
                                            price: 4000)));
                              },
                              child: SingleProductWidget(
                                  name: "Sportwear",
                                  price: 4000,
                                  image: "men_sportwear_img_1.jpeg"),
                            ),
                            GestureDetector(
                              onTap: () {
                                Navigator.of(context).pushReplacement(
                                    MaterialPageRoute(
                                        builder: (ctx) => DetailsView(
                                            image: "men_sportwear_img_1.jpeg",
                                            name: "Sportwear",
                                            price: 4000)));
                              },
                              child: SingleProductWidget(
                                  name: "Sportwear",
                                  price: 4000,
                                  image: "men_sportwear_img_1.jpeg"),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
                Container(
                  height: 50,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: <Widget>[
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "New Products",
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          GestureDetector(
                            onTap: () {
                              Navigator.of(context).pushReplacement(
                                MaterialPageRoute(
                                  builder: (context) =>
                                      ListProductView(name: "New Products"),
                                ),
                              );
                            },
                            child: Text(
                              "See All",
                              style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                Row(
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Row(
                          children: <Widget>[
                            GestureDetector(onTap: () {
                                Navigator.of(context).pushReplacement(
                                    MaterialPageRoute(
                                        builder: (ctx) => DetailsView(
                                            image: "men_sportwear_img_1.jpeg",
                                            name: "Sportwear",
                                            price: 4000)));
                              },
                              child: SingleProductWidget(
                                  name: "Sportwear",
                                  price: 4000,
                                  image: "men_sportwear_img_1.jpeg"),
                            ),
                            GestureDetector(
                              onTap: () {
                                Navigator.of(context).pushReplacement(
                                    MaterialPageRoute(
                                        builder: (ctx) => DetailsView(
                                            image: "men_sportwear_img_1.jpeg",
                                            name: "Sportwear",
                                            price: 4000)));
                              },
                              child: SingleProductWidget(
                                  name: "Sportwear",
                                  price: 4000,
                                  image: "men_sportwear_img_1.jpeg"),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
