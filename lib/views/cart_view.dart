import 'package:ecommerce_app/commons/colors.dart';
import 'package:ecommerce_app/views/checkout.dart';
import 'package:ecommerce_app/views/details_view.dart';
import 'package:ecommerce_app/widgets/cardsingleproduct.dart';
import 'package:ecommerce_app/widgets/notificationbadge.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../provider/product_provider.dart';
import 'package:provider/provider.dart';

class CartView extends StatefulWidget {
  @override
  State<CartView> createState() => _CartViewState();
}

late ProductProvider productProvider;

class _CartViewState extends State<CartView> {
  @override
  Widget build(BuildContext context) {
    productProvider = Provider.of<ProductProvider>(context);
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
            productProvider.addNotification("Notification");
            Navigator.of(context).pushReplacement(
                MaterialPageRoute(builder: (ctx) => CheckOut()));
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
          icon: Icon(
            Icons.arrow_back,
            color: Colors.black,
          ),
          onPressed: () {
            // Navigator.of(context).pushReplacement(
            //   MaterialPageRoute(
            //     builder: (ctx) => DetailsView(
            //         image: widget.image,
            //         name: widget.name,
            //         price: widget.price),
            //   ),
            // );
          },
        ),
        actions: <Widget>[
          NotificationsButton(),
        ],
      ),
      body: ListView.builder(
        itemCount: productProvider.getCardModelListLength,
        itemBuilder: (ctx, index) => CardSingleProduct(
          name: productProvider.getCardModelList[index].name,
          image: productProvider.getCardModelList[index].image,
          quantity: productProvider.getCardModelList[index].quantity,
          price: productProvider.getCardModelList[index].price,
        ),
      ),
    );
  }
}
