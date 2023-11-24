import 'package:flutter/material.dart';

class DetailsView extends StatefulWidget {
  @override
  State<DetailsView> createState() => _DetailsViewState();
}

class _DetailsViewState extends State<DetailsView> {
  int count = 1;
  Widget _buildSizeProduct({required String name}) {
    return Container(
      height: 60,
      width: 60,
      color: Color(0xfff2f2f2),
      child: Center(
        child: Text(
          name,
          style: TextStyle(
            fontSize: 17,
          ),
        ),
      ),
    );
  }

  Widget _buildColorProduct({required Color color}) {
    return Container(
      height: 60,
      width: 60,
      color: color,
    );
  }

  final TextStyle myStyle = TextStyle(
    fontSize: 18,
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
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
      body: Container(
        child: ListView(
          children: <Widget>[
            Column(
              children: <Widget>[
                Center(
                  child: Container(
                    width: 300,
                    child: Card(
                      child: Container(
                        padding: EdgeInsets.all(15),
                        child: Container(
                          height: 200,
                          decoration: BoxDecoration(
                              image: DecorationImage(
                            fit: BoxFit.fill,
                            image: AssetImage('images/men_sportwear_img_1.jpeg'),
                          )),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            Container(
              padding: EdgeInsets.symmetric(vertical: 20, horizontal: 20),
              child: Column(
                children: <Widget>[
                  Container(
                    height: 80,
                    child: Row(
                      children: <Widget>[
                        Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Text("Men SportWear", style: myStyle),
                            Text(
                              " 4000 DZD",
                              style: TextStyle(
                                color: Color(0xff9b96d6),
                                fontSize: 18,
                              ),
                            ),
                            Text("Description", style: myStyle),
                          ],
                        ),
                      ],
                    ),
                  ),
                  Container(
                    height: 190,
                    child: Wrap(
                      children: <Widget>[
                        Text(
                          "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.",
                          style: TextStyle(
                            fontSize: 14,
                          ),
                        )
                      ],
                    ),
                  ),
                  Text("Size", style: myStyle),
                  SizedBox(
                    height: 15,
                  ),
                  Container(
                    width: 350,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: <Widget>[
                        _buildSizeProduct(name: "S"),
                        _buildSizeProduct(name: "M"),
                        _buildSizeProduct(name: "L"),
                        _buildSizeProduct(name: "XL"),
                        _buildSizeProduct(name: "XXL")
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  Text(
                    "Color",
                    style: TextStyle(
                      fontSize: 18,
                    ),
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
                  SizedBox(
                    height: 15,
                  ),
                  Text("Quantity", style: myStyle),
                  SizedBox(
                    height: 15,
                  ),
                  Container(
                    height: 40,
                    width: 100,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(30),
                      color: Colors.cyan,
                    ),
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
                  Container(
                    height: 60,
                    width: double.infinity,
                    child:ElevatedButton(
                            onPressed: () {
                              
                            },
                            style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.pink),
                            child: Text("Check Out",style: myStyle,)),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
