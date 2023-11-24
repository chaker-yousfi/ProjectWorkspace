import 'package:flutter/material.dart';

class HomePageView extends StatelessWidget {
  final GlobalKey<ScaffoldState> _key = GlobalKey<ScaffoldState>();
  // const HomePageView({super.key});
  Widget _buildFeaturedProduct({String? name, double? price, String? image}) {
    return Card(
      child: Container(
        height: 250,
        width: 180,
        child: Column(
          children: <Widget>[
            Container(
              height: 190,
              width: 160,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage("images/$image"),
                ),

                // image:DecorationImage(image: ),
              ),
            ),
            Text(
              "$price DZD",
              style: const TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 17,
                color: Color(0xff9b96d6),
              ),
            ),
            Text(
              ("$name"),
              style: const TextStyle(
                fontSize: 17,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildProductCategory({required String? image, required colorCode}) {
    return CircleAvatar(
      maxRadius: 45,
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
                    _buildFeaturedProduct(
                        name: "Sportwear",
                        price: 4000,
                        image: "men_sportwear_img_1.jpeg"),
                    _buildFeaturedProduct(
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
      drawer: const Drawer(),
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
            onPressed: () {},
            icon: const Icon(Icons.notifications_none, color: Colors.black),
          ),
          IconButton(
            icon: const Icon(
              Icons.send,
              color: Colors.black,
            ),
            onPressed: () {},
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
                Container(
                  height: 120,
                  width: double.infinity,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      TextFormField(
                        decoration: InputDecoration(
                          prefixIcon: const Icon(Icons.search),
                          hintText: "Search",
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(30),
                          ),
                        ),
                      ),
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
                            _buildFeaturedProduct(
                                name: "Sportwear",
                                price: 4000,
                                image: "men_sportwear_img_1.jpeg"),
                            _buildFeaturedProduct(
                                name: "Sportwear",
                                price: 4000,
                                image: "men_sportwear_img_1.jpeg"),
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
                Container(
                  height: 70,
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
                      Text(
                        "Categories",
                        style: TextStyle(
                          fontSize: 17,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
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
                            _buildFeaturedProduct(
                                name: "Sportwear",
                                price: 4000,
                                image: "men_sportwear_img_1.jpeg"),
                            _buildFeaturedProduct(
                                name: "Sportwear",
                                price: 4000,
                                image: "men_sportwear_img_1.jpeg"),
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
                Container(
                  height: 70,
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
                      Text(
                        "Categories",
                        style: TextStyle(
                          fontSize: 17,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
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
              ],
            ),
          ],
        ),
      ),
    );
  }
}
