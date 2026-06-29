import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

const Color backgroundColor = Colors.white;

const Color blushPink = Color(0xFFF7DDE2);

const Color darkText = Color(0xFF1F1F1F);

const Color lightGrey = Color(0xFFF5F5F5);
class StyleResultsPage extends StatelessWidget {
  const StyleResultsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,

      appBar: AppBar(
        backgroundColor: Colors.white,
foregroundColor: darkText,
elevation: 0,
       title: Text(
  "Your Style Analysis",
  style: GoogleFonts.cormorantGaramond(
    fontSize: 28,
    fontWeight: FontWeight.w600,
  ),
),
      ),

      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),

        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,

          children: [

            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(20),

              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(25),
              ),

              child: Column(
                children: [

                  const Text(
                    "Your Dominant Style",
                    style: TextStyle(
                      fontSize: 18,
                    ),
                  ),

                  const SizedBox(height: 10),

                  const Text(
                    "👑 Old Money",
                    style: TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                    ),
                  ),

                  const SizedBox(height: 10),

                  const Text(
                    "65% Match",
                    style: TextStyle(
                      fontSize: 20,
                      color: Colors.purple,
                    ),
                  ),

                  const SizedBox(height: 15),

                  const Text(
                    "You gravitate towards timeless silhouettes, neutral tones, elegance and understated luxury.",
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
            ),

            const SizedBox(height: 25),

            const Text(
              "Style Breakdown",
              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
              ),
            ),

            const SizedBox(height: 15),

            styleBar("Old Money", 0.65),

            const SizedBox(height: 15),

            styleBar("Coquette", 0.20),

            const SizedBox(height: 15),

            styleBar("Clean Girl", 0.15),

            const SizedBox(height: 25),

            const Text(
              "Recommended Styles For You",
              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
              ),
            ),

            const SizedBox(height: 15),

            recommendationCard(
              "Parisian Chic",
              "https://images.unsplash.com/photo-1496747611176-843222e1e57c",
            ),

            const SizedBox(height: 15),

            recommendationCard(
              "Quiet Luxury",
              "https://images.unsplash.com/photo-1483985988355-763728e1935b",
            ),

            const SizedBox(height: 15),

            recommendationCard(
              "Minimal Elegance",
              "https://images.unsplash.com/photo-1529139574466-a303027c1d8b",
            ),

            const SizedBox(height: 25),

            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(20),

              decoration: BoxDecoration(
                color: blushPink,
                borderRadius: BorderRadius.circular(20),
              ),

              child: const Text(
                "\"Structured blazers, neutral palettes and classic accessories will complement your fashion preferences beautifully.\"",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 16,
                  fontStyle: FontStyle.italic,
                ),
              ),
            ),

            const SizedBox(height: 25),
          ],
        ),
      ),
    );
  }

  static Widget styleBar(
    String styleName,
    double percentage,
  ) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,

      children: [

        Text(
          "$styleName ${(percentage * 100).toInt()}%",
          style: const TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),

        const SizedBox(height: 5),

        LinearProgressIndicator(
  value: percentage,
  valueColor: const AlwaysStoppedAnimation(
    blushPink,
  ),
  backgroundColor: const Color(0xFFF1EDF4),),
      ],
    );
  }

  static Widget recommendationCard(
    String title,
    String imageUrl,
  ) {
    return Container(
      height: 180,
      clipBehavior: Clip.hardEdge,

      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
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
              style: const TextStyle(
                color: Colors.white,
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ],
      ),
    );
  }
}