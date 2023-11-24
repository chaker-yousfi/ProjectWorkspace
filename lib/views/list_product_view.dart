import 'package:ecommerce_app/views/homepage_view.dart';

import '/widgets/single_product_widget.dart';
import 'package:flutter/material.dart';

class ListProductView extends StatelessWidget {
  final String name;
  const ListProductView({super.key, required this.name});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0.0,
        leading: IconButton(
          onPressed: () {
            Navigator.of(context).pushReplacement(
              MaterialPageRoute(
                builder: (context) => HomePageView(),
              ),
            );
          },
          icon: const Icon(
            Icons.arrow_back,
            color: Colors.black,
          ),
        ),
        actions: <Widget>[
          IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.search,
              color: Colors.black,
            ),
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
        margin: EdgeInsets.symmetric(
          horizontal: 5,
        ),
        child: ListView(
          children: [
            Column(
              children: <Widget>[
                Container(
                  height: 50,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: <Widget>[
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            name,
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
                SizedBox(
                  height: 10,
                ),
                Container(
                    height: 700,
                    child: GridView.count(
                      mainAxisSpacing: 10,
                      crossAxisCount: 2,
                      childAspectRatio: 0.7,
                      children: <Widget>[
                        SingleProductWidget(
                            name: "Sportwear",
                            price: 4000,
                            image: "men_sportwear_img_1.jpeg"),
                        SingleProductWidget(
                            name: "Sportwear",
                            price: 4000,
                            image: "men_sportwear_img_1.jpeg"),
                        SingleProductWidget(
                            name: "Sportwear",
                            price: 4000,
                            image: "men_sportwear_img_1.jpeg"),
                        SingleProductWidget(
                            name: "Sportwear",
                            price: 4000,
                            image: "men_sportwear_img_1.jpeg"),
                        SingleProductWidget(
                            name: "Sportwear",
                            price: 4000,
                            image: "men_sportwear_img_1.jpeg"),
                        SingleProductWidget(
                            name: "Sportwear",
                            price: 4000,
                            image: "men_sportwear_img_1.jpeg"),
                      ],
                    ))
              ],
            ),
          ],
        ),
      ),
    );
  }
}
