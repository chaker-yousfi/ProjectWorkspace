import 'package:flutter/material.dart';

class CheckOut extends StatefulWidget {
  final double price;
  final String name;
  final String image;
  CheckOut({this.image = "", this.name = "", this.price = 0});
  @override
  State<CheckOut> createState() => _CheckOutState();
}

class _CheckOutState extends State<CheckOut> {
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
                    image: DecorationImage(
                        fit: BoxFit.fill,
                        image: AssetImage("images/${widget.image}"))),
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
                        "${widget.price} DZD",
                        style: TextStyle(
                            color: Colors.grey, fontWeight: FontWeight.bold),
                      ),
                      Container(
                        height: 35,
                        width: 120,
                        color: Colors.grey,
                        child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: <Widget>[
                              Text("Quantity"),
                              Text("1"),
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

  Widget _buildBottomDetail(
      {required String startName, required String endName}) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        Text(
          startName,
        ),
        Text(
          endName,
        )
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          "CheckOut Page",
          style: TextStyle(color: Colors.black),
        ),
        backgroundColor: Colors.transparent,
        elevation: 0.0,
        leading: IconButton(
          // ignore: prefer_const_constructors
          icon: Icon(
            Icons.arrow_back,
            color: Colors.black,
          ),
          onPressed: () {},
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
      bottomNavigationBar: Container(
        height: 70,
        width: 100,
        margin: EdgeInsets.symmetric(horizontal: 10),
        padding: EdgeInsets.only(bottom: 10),
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.deepPurple,
          ),
          onPressed: () {},
          child: Text(
            "Buy",
            style: TextStyle(fontSize: 18, color: Colors.white),
          ),
        ),
      ),
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: 15, vertical: 15),
        child: ListView(
          children: <Widget>[
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Column(
                 crossAxisAlignment: CrossAxisAlignment.start,
                 children: <Widget>[
                   _buildSingleCartProduct(),
                    _buildSingleCartProduct(),
                    _buildSingleCartProduct(),
                    _buildSingleCartProduct(),
                 ],
                ),
               
                Container(
                  height: 150,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[
                      _buildBottomDetail(
                        startName: "Your Price",
                        endName: "1200 DZD",
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
                        endName: "1200 DZD",
                      ),
                    ],
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
