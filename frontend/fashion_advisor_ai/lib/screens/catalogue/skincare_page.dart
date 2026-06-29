import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

const Color backgroundColor = Colors.white;

const Color blushPink = Color(0xFFF7DDE2);

const Color darkText = Color(0xFF1F1F1F);

const Color lightGrey = Color(0xFFF5F5F5);
class SkincarePage extends StatefulWidget {
  const SkincarePage({super.key});

  @override
  State<SkincarePage> createState() => _SkincarePageState();
}

class _SkincarePageState extends State<SkincarePage> {

  String selectedCategory = "All";

  final List<Map<String, String>> products = [
    {
      "title": "Glass Skin Routine",
      "category": "Glass Skin",
      "image":
          "https://images.unsplash.com/photo-1570172619644-dfd03ed5d881",
    },
    {
      "title": "Hydration Essentials",
      "category": "Hydration",
      "image":
          "https://images.unsplash.com/photo-1556228578-8c89e6adf883",
    },
    {
      "title": "Acne Care",
      "category": "Acne",
      "image":
          "https://images.unsplash.com/photo-1620916566398-39f1143ab7be",
    },
    {
      "title": "Night Repair",
      "category": "Night Care",
      "image":
          "https://images.unsplash.com/photo-1612817288484-6f916006741a",
    },
    {
      "title": "Clean Girl Skin",
      "category": "Clean Girl",
      "image":
          "https://images.unsplash.com/photo-1596755389378-c31d21fd1273",
    },
  ];

  @override
  Widget build(BuildContext context) {

    List<Map<String, String>> filteredProducts;

    if (selectedCategory == "All") {
      filteredProducts = products;
    } else {
      filteredProducts = products
          .where(
            (product) =>
                product["category"] == selectedCategory,
          )
          .toList();
    }

    return Scaffold(
      backgroundColor: backgroundColor,

      appBar: AppBar(
        backgroundColor: Colors.white,
foregroundColor: darkText,
elevation: 0,
        title: Text(
  "Skincare",
  style: GoogleFonts.cormorantGaramond(
    fontSize: 28,
    fontWeight: FontWeight.w600,
  ),
),
      ),

      body: Padding(
        padding: const EdgeInsets.all(12),

        child: Column(
          children: [

            TextField(
              decoration: InputDecoration(
                hintText: "Search skincare routines...",
                prefixIcon: const Icon(Icons.search),

                filled: true,
                fillColor: Colors.white,

                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
              ),
            ),

            const SizedBox(height: 15),

            SingleChildScrollView(
              scrollDirection: Axis.horizontal,

              child: Row(
                children: [

                  skincareChip("All"),

                  skincareChip("Glass Skin"),

                  skincareChip("Hydration"),

                  skincareChip("Acne"),

                  skincareChip("Night Care"),

                  skincareChip("Clean Girl"),
                ],
              ),
            ),

            const SizedBox(height: 15),

            Expanded(
              child: GridView.builder(
                itemCount: filteredProducts.length,

                gridDelegate:
                    const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 12,
                  mainAxisSpacing: 12,
                ),

                itemBuilder: (context, index) {

                  final product = filteredProducts[index];

                  return Container(
                    clipBehavior: Clip.hardEdge,

                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                    ),

                    child: Stack(
                      fit: StackFit.expand,

                      children: [

                        Image.network(
                          product["image"]!,
                          fit: BoxFit.cover,
                        ),

                        Container(
                          color: Colors.black.withOpacity(0.3),
                        ),

                        Center(
                          child: Text(
                            product["title"]!,
                            textAlign: TextAlign.center,

                            style: const TextStyle(
                              color: Colors.white,
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget skincareChip(String label) {

    return Padding(
      padding: const EdgeInsets.only(right: 8),

      child: ChoiceChip(
        label: Text(label),

        selected: selectedCategory == label,

        onSelected: (value) {

          setState(() {
            selectedCategory = label;
          });

        },
      ),
    );
  }
}