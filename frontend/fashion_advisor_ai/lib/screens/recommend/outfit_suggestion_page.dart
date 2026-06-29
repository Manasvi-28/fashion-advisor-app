import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

const Color backgroundColor = Colors.white;

const Color blushPink = Color(0xFFF7DDE2);

const Color darkText = Color(0xFF1F1F1F);

const Color lightGrey = Color(0xFFF5F5F5);

class OutfitSuggestionPage extends StatelessWidget {
  const OutfitSuggestionPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,

      appBar: AppBar(
        backgroundColor: Colors.white,
        foregroundColor: darkText,
        elevation: 0,

        title: Text(
          "Your Outfit",
          style: GoogleFonts.cormorantGaramond(
            fontSize: 30,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),

      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),

        child: Column(
          crossAxisAlignment:
              CrossAxisAlignment.start,

          children: [

            Text(
              "Recommended For You",
              style:
                  GoogleFonts.cormorantGaramond(
                fontSize: 32,
                fontWeight: FontWeight.w600,
              ),
            ),

            const SizedBox(height: 20),

            recommendationCard(
              "Bottom",
              "Beige Wide-Leg Trousers",
              "https://images.unsplash.com/photo-1483985988355-763728e1935b",
            ),

            const SizedBox(height: 20),

            recommendationCard(
              "Shoes",
              "Brown Leather Loafers",
              "https://images.unsplash.com/photo-1542291026-7eec264c27ff",
            ),

            const SizedBox(height: 20),

            recommendationCard(
              "Accessories",
              "Gold Watch & Pearl Earrings",
              "https://images.unsplash.com/photo-1523170335258-f5ed11844a49",
            ),

            const SizedBox(height: 20),

            recommendationCard(
              "Makeup",
              "Rosy Nude Lip & Soft Brown Eye Look",
              "https://images.unsplash.com/photo-1512496015851-a90fb38ba796",
            ),

            const SizedBox(height: 30),

            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(20),

              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius:
                    BorderRadius.circular(20),
              ),

              child: Column(
                children: [

                  Text(
                    "Stylist Tip ✨",
                    style:
                        GoogleFonts.cormorantGaramond(
                      fontSize: 26,
                      fontWeight: FontWeight.w600,
                    ),
                  ),

                  const SizedBox(height: 10),

                  const Text(
                    "Neutral tones and structured pieces create an elegant and timeless appearance. Add simple gold accessories for a polished finish.",
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget recommendationCard(
    String title,
    String item,
    String imageUrl,
  ) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius:
            BorderRadius.circular(20),
      ),

      

          child : Padding(
            padding:
                const EdgeInsets.all(16),

            child: Column(
              crossAxisAlignment:
                  CrossAxisAlignment.start,

              children: [

                Text(
                  title,
                  style:
                      GoogleFonts.cormorantGaramond(
                    fontSize: 26,
                    fontWeight: FontWeight.w600,
                  ),
                ),

                const SizedBox(height: 8),

                ClipRRect(
            borderRadius:
                const BorderRadius.vertical(
              top: Radius.circular(20),
            ),

            child: Image.network(
              imageUrl,
              height: 220,
              width: double.infinity,
              fit: BoxFit.cover,
            ),
          ),

           const SizedBox(height: 8),

                Text(
                  item,
                  style: const TextStyle(
                    fontSize: 16,
                  ),
                ),
              ],
            ),
          ),
      );
  }
}