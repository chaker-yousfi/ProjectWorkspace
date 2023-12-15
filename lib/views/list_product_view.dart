import 'package:ecommerce_app/model/product.dart';
import 'package:ecommerce_app/widgets/single_product_widget.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ListProductView extends StatelessWidget {
  final String name;
  final List<Product> snapShot;
  const ListProductView({required this.name, required this.snapShot});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0.0,
        iconTheme: IconThemeData(color: Colors.black),
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
                            style: GoogleFonts.plusJakartaSans(
                              fontSize: 18,
                              fontWeight: FontWeight.w700,
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
                    crossAxisCount: 2,
                    childAspectRatio: 0.55,
                    scrollDirection: Axis.vertical,
                    children: snapShot
                        .map(
                          (e) => SingleProductWidget(
                            image: e.image,
                            price: e.price,
                            name: e.name,
                          ),
                        )
                        .toList(),
                  ),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
