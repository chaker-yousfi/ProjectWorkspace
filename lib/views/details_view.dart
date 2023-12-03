import 'package:ecommerce_app/commons/colors.dart';
import 'package:ecommerce_app/commons/images.dart';
import 'package:ecommerce_app/views/cart_view.dart';
import 'package:ecommerce_app/views/homepage_view.dart';
import 'package:ecommerce_app/widgets/mybutton_widget.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class DetailsView extends StatefulWidget {
  final String name;
  final String image;
  final double price;
  // ignore: use_key_in_widget_constructors
  DetailsView({required this.image, required this.name, required this.price});
  @override
  State<DetailsView> createState() => _DetailsViewState();
}

class _DetailsViewState extends State<DetailsView> {
  int count = 1;
  Widget _buildSizeProduct({required String name}) {
    return Container(
      height: 60,
      width: 60,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(70), color: Color(0xfff2f2f2)),
      child: Center(
        child: Text(
          name,
          style: TextStyle(fontSize: 19, fontWeight: FontWeight.w400),
        ),
      ),
    );
  }

  Widget _buildColorProduct({required Color color}) {
    return Container(
      decoration:
          BoxDecoration(borderRadius: BorderRadius.circular(70), color: color),
      height: 60,
      width: 60,
    );
  }

  final TextStyle myStyle = TextStyle(
    fontSize: 18,
  );

  Widget _buildImage() {
    return Center(
      child: Container(
        width: 380,
        height: 290,
        child: Card(
          child: Container(
            margin: EdgeInsets.all(0),
            child: Container(
              height: 200,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                image: DecorationImage(
                  fit: BoxFit.cover,
                  image: AssetImage(widget.image),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildNameToDescriptionPart() {
    return Container(
      height: 100,
      child: Row(
        children: <Widget>[
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Row(
                children: [
                  Text(widget.name,
                      style: GoogleFonts.plusJakartaSans(
                          fontSize: 20, fontWeight: FontWeight.w800)),
                  SizedBox(width: 60),
                  Text(
                    widget.price.toString() + "DZD",
                    style: TextStyle(
                        color: Color(0xff9b96d6),
                        fontSize: 18,
                        fontWeight: FontWeight.w800),
                  ),
                ],
              ),
              Text("Description",
                  style: GoogleFonts.plusJakartaSans(
                      fontSize: 20, fontWeight: FontWeight.w800)),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildDescription() {
    return Container(
      height: 250,
      child: Wrap(
        children: <Widget>[
          Text(
            "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.",
            style: GoogleFonts.plusJakartaSans(
              fontSize: 13,
            ),
          )
        ],
      ),
    );
  }

  Widget _buildSizePart() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text("Size",
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.w800)),
        SizedBox(
          height: 15,
        ),
        Container(
          width: 350,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: <Widget>[
              _buildSizeProduct(name: "40"),
              _buildSizeProduct(name: "40.5"),
              _buildSizeProduct(name: "41"),
              _buildSizeProduct(name: "42"),
              _buildSizeProduct(name: "44")
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildColorPart() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        SizedBox(
          height: 15,
        ),
        Text(
          "Color",
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.w800),
        ),
        SizedBox(
          height: 15,
        ),
        Container(
          width: 350,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: <Widget>[
              _buildColorProduct(color: Colors.blue),
              _buildColorProduct(color: Colors.green),
              _buildColorProduct(color: Colors.yellow),
              _buildColorProduct(color: Colors.cyan),
              _buildColorProduct(color: Colors.brown)
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildQuantityPart() {
    return Row(
      children: [
        Column(
<<<<<<< HEAD
          crossAxisAlignment: CrossAxisAlignment.start,

=======
          crossAxisAlignment: CrossAxisAlignment.center,
>>>>>>> a158b6775d7868f9d2702943430d25a7e7f16ee3
          children: <Widget>[
            SizedBox(
              height: 15,
            ),
<<<<<<< HEAD
            Text("Quantity", style: myStyle),
=======
            Text("Quantity",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.w800)),
>>>>>>> a158b6775d7868f9d2702943430d25a7e7f16ee3
            SizedBox(
              height: 15,
            ),
            Container(
              height: 40,
              width: 100,
              decoration: BoxDecoration(
<<<<<<< HEAD
                borderRadius: BorderRadius.circular(30),
                color: Colors.cyan,
              ),
=======
                  borderRadius: BorderRadius.circular(30),
                  color: Color(0xff9b96d6)),
>>>>>>> a158b6775d7868f9d2702943430d25a7e7f16ee3
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
                      style: myStyle,
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
      ],
    );
  }

  // Widget _buildButtonPart() {
  //   return Container(
  //     height: 60,
  //     width: double.infinity,
  //     child: ElevatedButton(
  //         onPressed: () {
  //           Navigator.of(context).pushReplacement(
  //             MaterialPageRoute(
  //               builder: (ctx) => CartView(
  //                 image: widget.image,
  //                 name: widget.name,
  //                 price: widget.price,
  //               ),
  //             ),
  //           );
  //         },
  //         style: ElevatedButton.styleFrom(backgroundColor: buttonColor),
  //         child: Text(
  //           "Check Out",
  //           style: TextStyle(color: Colors.white, fontSize: 18),
  //         )),
  //   );
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          widget.name,
          style: GoogleFonts.plusJakartaSans(
              color: Colors.black, fontWeight: FontWeight.w600),
        ),
        backgroundColor: Colors.transparent,
        elevation: 0.0,
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back,
            color: Colors.black,
          ),
          onPressed: () {
            Navigator.of(context).pushReplacement(
              MaterialPageRoute(
                builder: (ctx) => HomePageView(),
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
      body: Container(
        child: ListView(
          children: <Widget>[
            Column(
              children: <Widget>[
                _buildImage(),
              ],
            ),
            Container(
              padding: EdgeInsets.symmetric(vertical: 20, horizontal: 20),
              child: Column(
                children: <Widget>[
                  _buildNameToDescriptionPart(),
                  _buildDescription(),
                  _buildSizePart(),
                  _buildColorPart(),
                  _buildQuantityPart(),
                  SizedBox(
                    height: 15,
                  ),
                  MyButton(
                    name: "Checkout",
                    onPressed: () {
                      Navigator.of(context).pushReplacement(
                        MaterialPageRoute(
                          builder: (ctx) => CartView(
                            image: widget.image,
                            name: widget.name,
                            price: widget.price,
                          ),
                        ),
                      );
                    },
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
