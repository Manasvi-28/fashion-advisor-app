import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

const Color backgroundColor = Colors.white;

const Color blushPink = Color(0xFFF7DDE2);

const Color darkText = Color(0xFF1F1F1F);

const Color lightGrey = Color(0xFFF5F5F5);
class AccessoriesPage extends StatefulWidget {
  const AccessoriesPage({super.key});

  @override
  State<AccessoriesPage> createState() => _AccessoriesPageState();
}

class _AccessoriesPageState extends State<AccessoriesPage> {

  String selectedCategory = "All";

  final List<Map<String, String>> accessories = [
    {
      "title": "Gold Jewellery",
      "category": "Jewellery",
      "image":
          "https://images.unsplash.com/photo-1617038220319-276d3cfab638",
    },
    {
      "title": "Statement Bags",
      "category": "Bags",
      "image":
          "https://images.unsplash.com/photo-1584917865442-de89df76afd3",
    },
    {
      "title": "Luxury Watches",
      "category": "Watches",
      "image":
          "https://images.unsplash.com/photo-1523170335258-f5ed11844a49",
    },
    {
      "title": "Summer Sunglasses",
      "category": "Sunglasses",
      "image":
          "https://images.unsplash.com/photo-1511499767150-a48a237f0083",
    },
    {
      "title": "Minimalist Accessories",
      "category": "Minimalist",
      "image":
          "https://images.unsplash.com/photo-1573408301185-9146fe634ad0",
    },
  ];

  @override
  Widget build(BuildContext context) {

    List<Map<String, String>> filteredAccessories;

    if (selectedCategory == "All") {
      filteredAccessories = accessories;
    } else {
      filteredAccessories = accessories
          .where(
            (item) =>
                item["category"] == selectedCategory,
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
  "Accessories",
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
                hintText: "Search accessories...",
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

                  accessoriesChip("All"),

                  accessoriesChip("Jewellery"),

                  accessoriesChip("Bags"),

                  accessoriesChip("Watches"),

                  accessoriesChip("Sunglasses"),

                  accessoriesChip("Minimalist"),
                ],
              ),
            ),

            const SizedBox(height: 15),

            Expanded(
              child: GridView.builder(
                itemCount: filteredAccessories.length,

                gridDelegate:
                    const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 12,
                  mainAxisSpacing: 12,
                ),

                itemBuilder: (context, index) {

                  final item = filteredAccessories[index];

                  return Container(
                    clipBehavior: Clip.hardEdge,

                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                    ),

                    child: Stack(
                      fit: StackFit.expand,

                      children: [

                        Image.network(
                          item["image"]!,
                          fit: BoxFit.cover,
                        ),

                        Container(
                          color: Colors.black.withOpacity(0.3),
                        ),

                        Center(
                          child: Text(
                            item["title"]!,
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

  Widget accessoriesChip(String label) {

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