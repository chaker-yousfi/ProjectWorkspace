import 'package:ecommerce_app/provider/product_provider.dart';
import 'package:ecommerce_app/views/cart_view.dart';
import 'package:ecommerce_app/widgets/cardsingleproduct.dart';
import 'package:ecommerce_app/widgets/notificationbadge.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:ecommerce_app/commons/images.dart';
import 'package:provider/provider.dart';

class CheckOut extends StatefulWidget {
  @override
  State<CheckOut> createState() => _CheckOutState();
}

class _CheckOutState extends State<CheckOut> {
  late ProductProvider productProvider;

  Widget _buildBottomDetail(
      {required String startName, required String endName}) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        Text(
          startName,
          style: GoogleFonts.plusJakartaSans(
            fontSize: 15,
            fontWeight: FontWeight.w500,
          ),
        ),
        Text(
          endName,
          style: GoogleFonts.plusJakartaSans(
            fontSize: 15,
            fontWeight: FontWeight.w500,
          ),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    productProvider = Provider.of<ProductProvider>(context);
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("Checkout",
            style: GoogleFonts.plusJakartaSans(
              color: Color(0xFF1B1A1A),
              fontSize: 20,
              fontWeight: FontWeight.w600,
              letterSpacing: 0.07,
            )),
        backgroundColor: Colors.transparent,
        elevation: 0.0,
        leading: IconButton(
          // ignore: prefer_const_constructors
          icon: Icon(
            Icons.arrow_back,
            color: Colors.black,
          ),
          onPressed: () {
            // Navigator.of(context).pushReplacement(
               // MaterialPageRoute(
               //   builder: (ctx) => CartView(
              //       image: widget.image,
              //       name: widget.name,
               //       price: widget.price),
               // ),
            // );
          },
        ),
        actions: <Widget>[
         NotificationsButton(),
        ],
      ),
      bottomNavigationBar: Container(
        height: 70,
        width: 100,
        margin: EdgeInsets.symmetric(horizontal: 10),
        padding: EdgeInsets.only(bottom: 10),
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            backgroundColor: Color(0xFF1B1A1A),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15),
            ),
          ),
          onPressed: () {},
          child: Text("Buy",
              style: GoogleFonts.plusJakartaSans(
                color: Colors.white,
                fontSize: 15,
                fontWeight: FontWeight.w500,
              )),
        ),
      ),
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: 15, vertical: 15),
        child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Expanded(
                  child: Container(
                    child: ListView.builder(
                            itemCount: productProvider.getCardModelListLength,
                            itemBuilder: (ctx, index) {
                    return CardSingleProduct(
                              name: productProvider.getCardModelList[index].name,
                              image: productProvider.getCardModelList[index].image,
                              quantity:productProvider.getCardModelList[index].quantity,
                              price: productProvider.getCardModelList[index].price);
                            }),
                  ),
                ),
                Container(
                  height: 150,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[
                      
                      _buildBottomDetail(
                        startName: "Your Price",
                        endName: "20000 DZD",
                      ),
                      _buildBottomDetail(
                        startName: "Discount",
                        endName: "3%",
                      ),
                      _buildBottomDetail(
                        startName: "Shipping",
                        endName: "0 DZD",
                      ),
                      _buildBottomDetail(
                        startName: "Total",
                        endName: "20000 DZD",
                      ),
                    ],
                  ),
                )
              ],
            ),
             
       
      ),
    );
  }
}
