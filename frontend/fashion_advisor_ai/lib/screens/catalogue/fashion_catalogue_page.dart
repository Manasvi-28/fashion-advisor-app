import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'accessories_page.dart';
import 'clothing_page.dart';
import 'makeup_page.dart';
import 'skincare_page.dart';

const Color backgroundColor = Colors.white;

const Color blushPink = Color(0xFFF7DDE2);

const Color darkText = Color(0xFF1F1F1F);

const Color lightGrey = Color(0xFFF5F5F5);

class FashionCataloguePage extends StatelessWidget {
  const FashionCataloguePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,

      appBar: AppBar(
        backgroundColor: Colors.white,
foregroundColor: darkText,
elevation: 0,
        title: Text(
  "Fashion Catalogue",
  style: GoogleFonts.cormorantGaramond(
    fontSize: 28,
    fontWeight: FontWeight.w600,
  ),
),
      ),

      body: Padding(
        padding: const EdgeInsets.all(16),

        child: Column(
          children: [

            Expanded(
              child: Row(
                children: [

                  Expanded(
                    child: categoryCard(
                      context,
                      "Clothing",
                      "https://images.unsplash.com/photo-1483985988355-763728e1935b",
                       const ClothingPage(),
                    ),
                  ),

                  const SizedBox(width: 15),

                  Expanded(
                    child: categoryCard(
                      context,
                      "Makeup",
                      "https://images.unsplash.com/photo-1522335789203-aabd1fc54bc9",
                       const MakeupPage(),
                    ),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 15),

            Expanded(
              child: Row(
                children: [

                  Expanded(
                    child: categoryCard(
                      context,
                      "Skincare",
                      "https://images.unsplash.com/photo-1570172619644-dfd03ed5d881",
                      const SkincarePage(),
                    ),
                  ),

                  const SizedBox(width: 15),

                  Expanded(
                    child: categoryCard(
                      context,
                      "Accessories",
                      "https://images.unsplash.com/photo-1617038220319-276d3cfab638",
                      const AccessoriesPage(),
                    ),
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
Widget categoryCard(
  BuildContext context,
  String title,
  String imageUrl,
  Widget page,
) {
  return GestureDetector(
    onTap: () {

      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => page,
        ),
      );

    },

    child: Container(
      clipBehavior: Clip.hardEdge,

      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(25),
      ),

      child: Stack(
        fit: StackFit.expand,

        children: [

          Image.network(
            imageUrl,
            fit: BoxFit.cover,
          ),

          Container(
            color: Colors.black.withOpacity(0.35),
          ),

          Center(
            child: Text(
              title,
              textAlign: TextAlign.center,

              style: const TextStyle(
                color: Colors.white,
                fontSize: 22,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ],
      ),
    ),
  );
}