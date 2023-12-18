import 'package:ecommerce_app/commons/images.dart';
import 'package:ecommerce_app/model/categoryicon.dart';
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
          image: NetworkImage(image!),
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

  Widget _buildShirtIcon() {
    List<CategoryIcon> shirtIcon = categoryProvider.getShirtIconList;
    List<Product> shirt = categoryProvider.getShirtList;
    return Row(
        children: shirtIcon.map((e) {
      return GestureDetector(
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
          image: e.image,
          colorCode: 0xff33dcfd,
        ),
      );
    }).toList());
  }

  Widget _buildShoesIcon() {
    List<CategoryIcon> shoesIcon = categoryProvider.getShoesIconList;
    List<Product> shoes = categoryProvider.getShoesList;
    return Row(
        children: shoesIcon.map((e) {
      return GestureDetector(
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
          image: e.image,
          colorCode: 0xff33dcfd,
        ),
      );
    }).toList());
  }

  Widget _buildShortsIcon() {
    List<CategoryIcon> shortsIcon = categoryProvider.getShortsIconList;
    List<Product> shorts = categoryProvider.getShortsList;
    return Row(
        children: shortsIcon.map((e) {
      return GestureDetector(
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
          image: e.image,
          colorCode: 0xff33dcfd,
        ),
      );
    }).toList());
  }

  Widget _buildTracksuitIcon() {
    List<CategoryIcon> tracksuitIcon = categoryProvider.getTracksuitIconList;
    List<Product> tracksuit = categoryProvider.getTracksuitList;
    return Row(
        children: tracksuitIcon.map((e) {
      return GestureDetector(
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
          image: e.image,
          colorCode: 0xff33dcfd,
        ),
      );
    }).toList());
  }

  Widget _buildGlovesIcon() {
    List<CategoryIcon> glovesIcon = categoryProvider.getGlovesIconList;
    List<Product> gloves = categoryProvider.getGlovesList;
    return Row(
        children: glovesIcon.map((e) {
      return GestureDetector(
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
          image: e.image,
          colorCode: 0xff33dcfd,
        ),
      );
    }).toList());
  }

  Widget _buildCategory() {
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
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Container(
            height: 60,
            child: Row(
              children: <Widget>[
                _buildShirtIcon(),
                _buildShoesIcon(),
                _buildShortsIcon(),
                _buildTracksuitIcon(),
                _buildGlovesIcon(),
              ],
            ),
          ),
        )
      ],
    );
  }

  Widget _buildFeature() {
    List<Product> featured = productProvider.getFeaturedList;
    List<Product> homeFeatured = productProvider.getHomeFeaturedList;

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
            children: homeFeatured.map((e) {
          return Expanded(
            child: Row(
              children: <Widget>[
                Expanded(
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(30),
                    ),
                    child: GestureDetector(
                      onTap: () {
                        Navigator.of(context).pushReplacement(MaterialPageRoute(
                            builder: (ctx) => DetailsView(
                                  image: e.image,
                                  name: e.name,
                                  price: e.price,
                                )));
                      },
                      child: SingleProductWidget(
                          name: e.name, price: e.price, image: e.image),
                    ),
                  ),
                ),

                // Container(
                //   decoration: BoxDecoration(
                //     borderRadius: BorderRadius.circular(30),
                //   ),
                //   child: GestureDetector(
                //     onTap: () {
                //       Navigator.of(context).pushReplacement(MaterialPageRoute(
                //           builder: (ctx) => DetailsView(
                //               image: e.image,
                //               name: e.name,
                //               price: e.price)));
                //     },
                //     child: SingleProductWidget(
                //         name: e.name,
                //         price: e.price,
                //         image: e.image),
                //   ),
                // ),
              ],
            ),
          );
        }).toList()),
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
          children: productProvider.getHomeNewList.map((e) {
            return Expanded(
                child: Row(
              children: <Widget>[
                Expanded(
                  child: Container(
                    child: GestureDetector(
                      onTap: () {
                        Navigator.of(context).pushReplacement(MaterialPageRoute(
                            builder: (ctx) => DetailsView(
                                  image: e.image,
                                  name: e.name,
                                  price: e.price,
                                )));
                      },
                      child: SingleProductWidget(
                          name: e.name, price: e.price, image: e.image),
                    ),
                  ),
                ),
                // GestureDetector(
                //   onTap: () {
                //     Navigator.of(context).pushReplacement(MaterialPageRoute(
                //         builder: (ctx) => DetailsView(
                //               image:e.image,
                //               name: e.name,
                //               price: e.price,
                //             )));
                //   },
                //   child: SingleProductWidget(
                //     name: e.name,
                //     price: e.price,
                //     image: e.image,
                //   ),
                // ),
              ],
            ));
          }).toList(),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    categoryProvider = Provider.of<CategoryProvider>(context);
    productProvider = Provider.of<ProductProvider>(context);
    categoryProvider.getShirtData();
    categoryProvider.getShoesData();
    categoryProvider.getShortsData();
    categoryProvider.getTracksuitData();
    categoryProvider.getGlovesData();
    productProvider.getFeaturedData();
    productProvider.getNewData();
    productProvider.getHomeFeaturedData();
    productProvider.getHomeNewData();
    categoryProvider.getShirtIconData();
    categoryProvider.getShortsIconData();
    categoryProvider.getShoesIconData();
    categoryProvider.getTracksuitIconData();
    categoryProvider.getGlovesIconData();

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
