import 'package:ecommerce_app/commons/images.dart';
import 'package:ecommerce_app/provider/category_provider.dart';
import 'package:ecommerce_app/provider/product_provider.dart';
import 'package:ecommerce_app/views/cart_view.dart';
import 'package:ecommerce_app/views/details_view.dart';
import 'package:flutter/material.dart';
import 'package:lecle_flutter_carousel_pro/lecle_flutter_carousel_pro.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import '/views/list_product_view.dart';
import '/widgets/single_product_widget.dart';
import '../model/product.dart';

class HomePageView extends StatefulWidget {
  static const String pageRoute = "/homepageview";
  @override
  State<HomePageView> createState() => _HomePageViewState();
}

late CategoryProvider categoryProvider;
late ProductProvider productProvider;
Product? mcaData;
Product? dumbbleData;
Product? psgData;
Product? barcaData;
var featureSnapShot;
var newProductSnapShot;
var shirt;
var shoes;
var shorts;
var tracksuit;
var gloves;

class _HomePageViewState extends State<HomePageView> {
  final GlobalKey<ScaffoldState> _key = GlobalKey<ScaffoldState>();

  // const HomePageView({super.key});
  Widget _buildProductCategory({required String? image, required colorCode}) {
    return CircleAvatar(
      maxRadius: 40,
      backgroundColor: Color(colorCode),
      child: Container(
        height: 40,
        child: Image(
          color: Colors.white,
          image: AssetImage(image!),
        ),
      ),
      // backgroundImage: AssetImage("images/$image"),
    );
  }

  bool homeColor = true;
  bool cartColor = false;
  bool aboutUsColor = false;
  bool contactUsColor = false;
  Widget _buildMyDrawer() {
    return Drawer(
      child: ListView(
        children: [
          UserAccountsDrawerHeader(
            accountName: Text(
              "loukmane",
              style: GoogleFonts.plusJakartaSans(
                  color: Colors.black,
                  fontSize: 18,
                  fontWeight: FontWeight.w700),
            ),
            currentAccountPicture: CircleAvatar(
                backgroundImage: AssetImage('assets/images/sport.png')),
            decoration: BoxDecoration(
              color: Color(0xfff2f2f2),
            ),
            accountEmail: Text(
              "loukmane@email.com",
              style: GoogleFonts.plusJakartaSans(
                  color: Colors.black,
                  fontSize: 14,
                  fontWeight: FontWeight.w400),
            ),
          ),
          ListTile(
            selected: homeColor,
            enabled: true,
            onTap: () {
              setState(() {
                homeColor = true;
                cartColor = false;
                aboutUsColor = false;
                contactUsColor = false;
              });
            },
            leading: Icon(Icons.home),
            title: Text(
              "Home",
              style: GoogleFonts.plusJakartaSans(
                  color: Colors.black,
                  fontSize: 14,
                  fontWeight: FontWeight.w400),
            ),
          ),
          ListTile(
            selected: cartColor,
            onTap: () {
              Navigator.of(context).pushReplacement(
                  MaterialPageRoute(builder: (ctx) => CartView()));
              setState(() {
                homeColor = false;
                cartColor = true;
                aboutUsColor = false;
                contactUsColor = false;
              });
            },
            leading: Icon(Icons.shopping_cart),
            title: Text(
              "Cart",
              style: GoogleFonts.plusJakartaSans(
                  color: Colors.black,
                  fontSize: 14,
                  fontWeight: FontWeight.w400),
            ),
          ),
          ListTile(
            selected: aboutUsColor,
            onTap: () {
              setState(() {
                homeColor = false;
                cartColor = false;
                aboutUsColor = true;
                contactUsColor = false;
              });
            },
            leading: Icon(Icons.info),
            title: Text(
              "About us",
              style: GoogleFonts.plusJakartaSans(
                  color: Colors.black,
                  fontSize: 14,
                  fontWeight: FontWeight.w400),
            ),
          ),
          ListTile(
            selected: contactUsColor,
            onTap: () {
              setState(() {
                homeColor = false;
                cartColor = false;
                aboutUsColor = false;
                contactUsColor = true;
              });
            },
            leading: Icon(Icons.mail),
            title: Text(
              "Contact us",
              style: GoogleFonts.plusJakartaSans(
                  color: Colors.black,
                  fontSize: 14,
                  fontWeight: FontWeight.w400),
            ),
          ),
          ListTile(
            onTap: () {},
            leading: Icon(Icons.exit_to_app),
            title: Text(
              "Logout",
              style: GoogleFonts.plusJakartaSans(
                  color: Colors.black,
                  fontSize: 14,
                  fontWeight: FontWeight.w400),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildImageSlider() {
    return Container(
      height: 200,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(
            24), // Adjust the value to change the roundness
        border: Border.all(
          color: Colors.transparent, // Border color
          width: 1, // Border width
        ),
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(
            24), // Match the same roundness as the outer container
        child: Carousel(
          showIndicator: false,
          dotColor: Colors.white,
          autoplay: true,
          // dotBgColor: Colors.pinkAccent,
          // dotIncreaseSize: 10,
          // dotIncreasedColor: Colors.blue,
          dotSize: 20,
          images: [
            AssetImage(homepageImage_1),
            AssetImage(homepageImage_2),
          ],
        ),
      ),
    );
  }

  Widget _buildCategory() {
    List<Product> shirt = categoryProvider.getShirtList;
    List<Product> shoes = categoryProvider.getShoesList;
    List<Product> shorts = categoryProvider.getShortsList;
    List<Product> tracksuit = categoryProvider.getTracksuitList;
    List<Product> gloves = categoryProvider.getGlovesList;

    return Column(
      children: <Widget>[
        Container(
          height: 50,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text("Categories",
                  style: GoogleFonts.plusJakartaSans(
                    fontSize: 20,
                    color: Color(0xFF1B1A1A),
                    fontWeight: FontWeight.w700,
                  )),
              // Text(
              //   "See All",
              //   style: TextStyle(
              //     fontSize: 17,
              //     fontWeight: FontWeight.bold,
              //   ),
              // ),
            ],
          ),
        ),
        Container(
          height: 60,
          child: Row(
            children: <Widget>[
              GestureDetector(
                onTap: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (ctx) => ListProductView(
                        name: "Football Shirts",
                        snapShot: shirt,
                      ),
                    ),
                  );
                },
                child: _buildProductCategory(
                  image: categoryImage_1,
                  colorCode: 0xff33dcfd,
                ),
              ),
              GestureDetector(
                onTap: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (ctx) => ListProductView(
                        name: "Football Shoes",
                        snapShot: shoes,
                      ),
                    ),
                  );
                },
                child: _buildProductCategory(
                  image: categoryImage_2,
                  colorCode: 0xff33dcfd,
                ),
              ),
              GestureDetector(
                onTap: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (ctx) => ListProductView(
                        name: "Football Shorts",
                        snapShot: shorts,
                      ),
                    ),
                  );
                },
                child: _buildProductCategory(
                  image: categoryImage_3,
                  colorCode: 0xff33dcfd,
                ),
              ),
              GestureDetector(
                onTap: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (ctx) => ListProductView(
                        name: "Tracksuits",
                        snapShot: tracksuit,
                      ),
                    ),
                  );
                },
                child: _buildProductCategory(
                  image: categoryImage_4,
                  colorCode: 0xff33dcfd,
                ),
              ),
              GestureDetector(
                onTap: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (ctx) => ListProductView(
                        name: "GK Gloves",
                        snapShot: gloves,
                      ),
                    ),
                  );
                },
                child: _buildProductCategory(
                  image: categoryImage_5,
                  colorCode: 0xff33dcfd,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildFeature() {
    List<Product> featured = productProvider.getFeaturedList;

    return Column(
      children: <Widget>[
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              "Featured Products",
              style: GoogleFonts.plusJakartaSans(
                color: Color(0xFF1B1A1A),
                fontSize: 20,
                fontWeight: FontWeight.w700,
              ),
            ),
            GestureDetector(
              onTap: () {
                Navigator.of(context).pushReplacement(
                  MaterialPageRoute(
                    builder: (contetx) => ListProductView(
                      name: "Featured Products",
                      snapShot: featured,
                    ),
                  ),
                );
              },
              child: Text(
                "SEE ALL",
                style: GoogleFonts.plusJakartaSans(
                  color: Color(0xff9b96d6),
                  fontSize: 20,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ),
          ],
        ),
        Row(
          children: <Widget>[
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(30),
              ),
              child: GestureDetector(
                onTap: () {
                  Navigator.of(context).pushReplacement(MaterialPageRoute(
                      builder: (ctx) => DetailsView(
                          image: mcaData!.image,
                          name: mcaData!.name,
                          price: mcaData!.price)));
                },
                child: SingleProductWidget(
                    name: mcaData!.name,
                    price: mcaData!.price,
                    image: mcaData!.image),
              ),
            ),
            GestureDetector(
              onTap: () {
                Navigator.of(context).pushReplacement(MaterialPageRoute(
                    builder: (ctx) => DetailsView(
                        image: dumbbleData!.image,
                        name: dumbbleData!.name,
                        price: dumbbleData!.price)));
              },
              child: SingleProductWidget(
                  name: dumbbleData!.name,
                  price: dumbbleData!.price,
                  image: dumbbleData!.image),
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildProducts() {
    List<Product> newProduct = productProvider.getNewList;
    return Column(
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
                    "New Products",
                    style: GoogleFonts.plusJakartaSans(
                      color: Color(0xFF1B1A1A),
                      fontSize: 20,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.of(context).pushReplacement(
                        MaterialPageRoute(
                          builder: (context) => ListProductView(
                            name: "New Products",
                            snapShot: newProduct,
                          ),
                        ),
                      );
                    },
                    child: Text(
                      "SEE ALL",
                      style: GoogleFonts.plusJakartaSans(
                        color: Color(0xff9b96d6),
                        fontSize: 20,
                        fontWeight: FontWeight.w700,
                      ),
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
                    GestureDetector(
                      onTap: () {
                        Navigator.of(context).pushReplacement(MaterialPageRoute(
                            builder: (ctx) => DetailsView(
                                  image: barcaData!.image,
                                  name: barcaData!.name,
                                  price: barcaData!.price,
                                )));
                      },
                      child: SingleProductWidget(
                          name: barcaData!.name,
                          price: barcaData!.price,
                          image: barcaData!.image),
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.of(context).pushReplacement(MaterialPageRoute(
                            builder: (ctx) => DetailsView(
                                  image: psgData!.image,
                                  name: psgData!.name,
                                  price: psgData!.price,
                                )));
                      },
                      child: SingleProductWidget(
                        name: psgData!.name,
                        price: psgData!.price,
                        image: psgData!.image,
                      ),
                    ),
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
    categoryProvider = Provider.of<CategoryProvider>(context);
    categoryProvider.getShirtData();
    categoryProvider.getShoesData();
    categoryProvider.getShortsData();
    categoryProvider.getTracksuitData();
    categoryProvider.getGlovesData();
    productProvider = Provider.of<ProductProvider>(context);
    productProvider.getFeaturedData();
    productProvider.getNewData();

    return Scaffold(
      key: _key,
      drawer: _buildMyDrawer(),
      appBar: AppBar(
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
            icon: const Icon(
              Icons.search,
              color: Colors.black,
            ),
            onPressed: () {},
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
        height: double.infinity,
        width: double.infinity,
        margin: const EdgeInsets.symmetric(horizontal: 20),
        child: ListView(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                _buildImageSlider(),
                _buildCategory(),
                SizedBox(
                  height: 20,
                ),
                _buildFeature(),
                _buildProducts(),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
