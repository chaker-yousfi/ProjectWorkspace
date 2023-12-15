import 'package:ecommerce_app/commons/colors.dart';
import 'package:ecommerce_app/views/details_view.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../views/checkout.dart';

class CartView extends StatefulWidget {
  final double price;
  final String name;
  final String image;
  CartView({this.image = "", this.name = "", this.price = 0});
  @override
  State<CartView> createState() => _CartViewState();
}

class _CartViewState extends State<CartView> {
  int count = 1;

  Widget _buildSingleCartProduct() {
    return Container(
      height: 150,
      width: double.infinity,
      child: Card(
          child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Row(
            children: [
              Container(
                height: 130,
                width: 150,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    image: DecorationImage(
                        fit: BoxFit.fill, image: AssetImage(widget.image))),
              ),
              Container(
                height: 140,
                width: 200,
                child: ListTile(
                  title: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(widget.name),
                      Text("Clothing"),
                      Text(
                        "${widget.price.toString()} DZD",
                        style: GoogleFonts.plusJakartaSans(
                            color: Colors.grey, fontWeight: FontWeight.bold),
                      ),
                      Container(
                        height: 35,
                        width: 120,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(30),
                            color: Colors.grey),
                        child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: <Widget>[
                              GestureDetector(
                                child: Icon(Icons.remove),
                                onTap: () {
                                  setState(() {
                                    if (count > 1) {
                                      count--;
                                    }
                                  });
                                },
                              ),
                              Text(
                                count.toString(),
                                style:
                                    GoogleFonts.plusJakartaSans(fontSize: 18),
                              ),
                              GestureDetector(
                                child: Icon(Icons.add),
                                onTap: () {
                                  setState(() {
                                    count++;
                                  });
                                },
                              ),
                            ]),
                      ),
                    ],
                  ),
                ),
              )
            ],
          ),
        ],
      )),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: Container(
        height: 70,
        width: 100,
        margin: EdgeInsets.symmetric(horizontal: 10),
        padding: EdgeInsets.only(bottom: 10),
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            backgroundColor: buttonColor,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15),
            ),
          ),
          onPressed: () {
            Navigator.of(context).pushReplacement(MaterialPageRoute(
                builder: (ctx) => CheckOut(
                      name: widget.name,
                      price: widget.price,
                      image: widget.image,
                    )));
          },
          child: Text(
            "Continue",
            style:
                GoogleFonts.plusJakartaSans(fontSize: 18, color: Colors.white),
          ),
        ),
      ),
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          "Your Cart",
          style: GoogleFonts.plusJakartaSans(color: Colors.black),
        ),
        backgroundColor: Colors.transparent,
        elevation: 0.0,
        leading: IconButton(
          // ignore: prefer_const_constructors
          icon: Icon(
            Icons.arrow_back,
            color: Colors.black,
          ),
          onPressed: () {
            Navigator.of(context).pushReplacement(
              MaterialPageRoute(
                builder: (ctx) => DetailsView(
                    image: widget.image,
                    name: widget.name,
                    price: widget.price),
              ),
            );
          },
        ),
        actions: <Widget>[
          IconButton(
            icon: Icon(
              Icons.notifications_none,
              color: Colors.black,
            ),
            onPressed: () {},
          )
        ],
      ),
      body: ListView(
        children: <Widget>[
          _buildSingleCartProduct(),
          _buildSingleCartProduct(),
          _buildSingleCartProduct(),
          _buildSingleCartProduct(),
          _buildSingleCartProduct(),
          _buildSingleCartProduct(),
        ],
      ),
    );
  }
}
