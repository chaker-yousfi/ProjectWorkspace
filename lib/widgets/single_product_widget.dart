import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class SingleProductWidget extends StatelessWidget {
  final String image;
  final double price;
  final String name;
  const SingleProductWidget({
    super.key,
    required this.image,
    required this.price,
    required this.name,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Container(
        height: 250,
        width: 160,
        
        child: Column(
          children: <Widget>[
            Container(
              padding: EdgeInsets.symmetric(
                vertical: 10,
              ),
              child: Container(
                height: 190,
                width: 160,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(
                      20), // Rounded border for the inner Container holding the image
                  image: DecorationImage(
                    fit: BoxFit.fill,
                    image: AssetImage("images/$image"),
                  ),
                ),
              ),
            ),
            Text(
              "${price.toString()} DZD",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 17,
                color: Color(0xff9b96d6),
              ),
            ),
            Text(
              "$name",
              style: GoogleFonts.plusJakartaSans(
                color: Color(0xFF1B1A1A),
                fontSize: 15,
                fontWeight: FontWeight.w600,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
