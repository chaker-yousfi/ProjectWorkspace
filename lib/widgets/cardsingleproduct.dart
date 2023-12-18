import 'package:ecommerce_app/model/product.dart';
import 'package:ecommerce_app/provider/product_provider.dart';
import 'package:ecommerce_app/views/cart_view.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class CardSingleProduct extends StatefulWidget {
  final String name;
  final String image;
  int quantity;
  final double price;

  CardSingleProduct(
      {super.key,
      required this.name,
      required this.image,
      required this.quantity,
      required this.price});

  @override
  State<CardSingleProduct> createState() => _CardSingleProductState();
}
late ProductProvider productProvider;

class _CardSingleProductState extends State<CardSingleProduct> {
  @override
  Widget build(BuildContext context) {
    productProvider=Provider.of<ProductProvider>(context);
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
                        fit: BoxFit.fill, image: NetworkImage(widget.image))),
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
                                    if (widget.quantity > 1) {
                                       widget.quantity--;
                                    }
                                  });
                                },
                              ),
                              Text(
                                widget.quantity.toString(),
                                style:
                                    GoogleFonts.plusJakartaSans(fontSize: 18),
                              ),
                              GestureDetector(
                                child: Icon(Icons.add),
                                onTap: () {
                                  setState(() {
                                    widget.quantity++;
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
}
