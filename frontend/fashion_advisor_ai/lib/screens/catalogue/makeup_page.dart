import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

const Color backgroundColor = Colors.white;

const Color blushPink = Color(0xFFF7DDE2);

const Color darkText = Color(0xFF1F1F1F);

const Color lightGrey = Color(0xFFF5F5F5);
class MakeupPage extends StatefulWidget {
  const MakeupPage({super.key});

  @override
  State<MakeupPage> createState() => _MakeupPageState();
}

class _MakeupPageState extends State<MakeupPage> {

  String selectedCategory = "All";

  final List<Map<String, String>> looks = [
    {
      "title": "Soft Glam",
      "category": "Soft Glam",
      "image":
          "https://images.unsplash.com/photo-1522335789203-aabd1fc54bc9",
    },
    {
      "title": "Glass Skin",
      "category": "Glass Skin",
      "image":
          "https://images.unsplash.com/photo-1487412720507-e7ab37603c6f",
    },
    {
      "title": "Latte Makeup",
      "category": "Latte",
      "image":
          "https://images.unsplash.com/photo-1512496015851-a90fb38ba796",
    },
    {
      "title": "Cherry Cola Lips",
      "category": "Cherry Cola",
      "image":
          "https://images.unsplash.com/photo-1496747611176-843222e1e57c",
    },
    {
      "title": "Clean Girl Makeup",
      "category": "Clean Girl",
      "image":
          "https://images.unsplash.com/photo-1515886657613-9f3515b0c78f",
    },
  ];

  @override
  Widget build(BuildContext context) {

    List<Map<String, String>> filteredLooks;

    if (selectedCategory == "All") {
      filteredLooks = looks;
    } else {
      filteredLooks = looks
          .where(
            (look) =>
                look["category"] == selectedCategory,
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
  "Makeup",
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
                hintText: "Search makeup looks...",
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

                  makeupChip("All"),

                  makeupChip("Soft Glam"),

                  makeupChip("Glass Skin"),

                  makeupChip("Latte"),

                  makeupChip("Cherry Cola"),

                  makeupChip("Clean Girl"),
                ],
              ),
            ),

            const SizedBox(height: 15),

            Expanded(
              child: GridView.builder(
                itemCount: filteredLooks.length,

                gridDelegate:
                    const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 12,
                  mainAxisSpacing: 12,
                ),

                itemBuilder: (context, index) {

                  final look = filteredLooks[index];

                  return Container(
                    clipBehavior: Clip.hardEdge,

                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                    ),

                    child: Stack(
                      fit: StackFit.expand,

                      children: [

                        Image.network(
                          look["image"]!,
                          fit: BoxFit.cover,
                        ),

                        Container(
                          color: Colors.black.withOpacity(0.3),
                        ),

                        Center(
                          child: Text(
                            look["title"]!,
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

  Widget makeupChip(String label) {

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
