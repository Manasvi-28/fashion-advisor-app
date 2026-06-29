import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:fashion_advisor_ai/models/clothing.dart';
import 'package:fashion_advisor_ai/services/api_service.dart';
import '/screens/outfit_details_page.dart';

const Color backgroundColor = Colors.white;

const Color blushPink = Color(0xFFF7DDE2);

const Color darkText = Color(0xFF1F1F1F);

const Color lightGrey = Color(0xFFF5F5F5);
class ClothingPage extends StatefulWidget {
  const ClothingPage({super.key});

  @override
  State<ClothingPage> createState() => _ClothingPageState();
}

class _ClothingPageState extends State<ClothingPage> {

  String selectedCategory = "All";
  final ApiService apiService = ApiService();

late Future<List<Clothing>> clothingFuture;

  final TextEditingController searchController =
    TextEditingController();
  @override
void initState() {
  super.initState();

  clothingFuture = apiService.getAllClothing();
}

  @override
  Widget build(BuildContext context) {

    

    return Scaffold(
      backgroundColor: backgroundColor,

      appBar: AppBar(
        backgroundColor: Colors.white,
foregroundColor: darkText,
elevation: 0,
       title: Text(
  "Clothing",
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
  controller: searchController,

  decoration: InputDecoration(
    hintText: "Search outfits...",
    prefixIcon: const Icon(Icons.search),
    suffixIcon: IconButton(

      icon: const Icon(Icons.search),

      onPressed: () {

        setState(() {

          if (searchController.text.trim().isEmpty) {

            clothingFuture =
                apiService.getAllClothing();

          } else {

            clothingFuture =
                apiService.searchClothing(

                    searchController.text);

          }

        });

      },

    ),

    filled: true,
    fillColor: Colors.white,

    border: OutlineInputBorder(
      borderRadius:
          BorderRadius.circular(20),
    ),
  ),
),

            const SizedBox(height: 15),

            SingleChildScrollView(
              scrollDirection: Axis.horizontal,

              child: Row(
                children: [

                  trendChip("All"),

                  trendChip("Old Money"),

                  trendChip("Butter Yellow"),

                  trendChip("Linen"),

                  trendChip("Clean Girl"),
                ],
              ),
            ),

            const SizedBox(height: 15),

            Expanded(
  child: FutureBuilder<List<Clothing>>(
    future: clothingFuture,
    builder: (context, snapshot) {

      if (snapshot.connectionState ==
          ConnectionState.waiting) {

        return const Center(
          child: CircularProgressIndicator(),
        );

      }

      if (snapshot.hasError) {

        return Center(
          child: Text(
            snapshot.error.toString(),
          ),
        );

      }

      if (!snapshot.hasData ||
          snapshot.data!.isEmpty) {

        return const Center(
          child: Text("No outfits found"),
        );

      }

      final outfits = snapshot.data!;

      return GridView.builder(

        itemCount: outfits.length,

        gridDelegate:
            const SliverGridDelegateWithFixedCrossAxisCount(

          crossAxisCount: 2,

          crossAxisSpacing: 12,

          mainAxisSpacing: 12,

          childAspectRatio: 0.72,

        ),

        itemBuilder: (context, index) {

          final outfit = outfits[index];

          return GestureDetector(

            onTap: () {

              Navigator.push(

  context,

  MaterialPageRoute(

    builder: (_) =>

        OutfitDetailsPage(

      outfit: outfit,

    ),

  ),

);

            },

            child: Container(

              clipBehavior: Clip.hardEdge,

              decoration: BoxDecoration(

                borderRadius:
                    BorderRadius.circular(20),

              ),

              child: Stack(

                fit: StackFit.expand,

                children: [

                  Hero(

                    tag: outfit.id,

                    child: Image.network(

                      outfit.imageUrl,

                      fit: BoxFit.cover,

                    ),

                  ),

                  Container(

                    decoration: const BoxDecoration(

                      gradient: LinearGradient(

                        begin: Alignment.topCenter,

                        end: Alignment.bottomCenter,

                        colors: [

                          Colors.transparent,

                          Colors.black87,

                        ],

                      ),

                    ),

                  ),

                  Positioned(

                    left: 12,

                    right: 12,

                    bottom: 12,

                    child: Text(

                      outfit.title,

                      maxLines: 2,

                      overflow:
                          TextOverflow.ellipsis,

                      style: const TextStyle(

                        color: Colors.white,

                        fontSize: 16,

                        fontWeight:
                            FontWeight.bold,

                      ),

                    ),

                  ),

                ],

              ),

            ),

          );

        },

      );

    },

  ),

),
          ],
        ),
      ),
    );
  }

  Widget trendChip(String label) {

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