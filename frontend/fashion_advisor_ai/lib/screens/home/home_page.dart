import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../catalogue/fashion_catalogue_page.dart';
import '../discover/discover_style_page.dart';
import '../recommend/suggest_outfit_page.dart';
import '../stylist/personal_stylist_page.dart';
import 'profile_page.dart';
import 'package:fashion_advisor_ai/services/auth_service.dart';

const Color backgroundColor = Colors.white;

const Color blushPink = Color(0xFFF7DDE2);

const Color darkText = Color(0xFF1F1F1F);

const Color lightGrey = Color(0xFFF5F5F5);
  final AuthService authService = AuthService();
class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: backgroundColor,
        child: SafeArea(
          child: Row(
            children: [

              //-----------------------------
              // LEFT PANEL
              //-----------------------------
              Container(
                width: 75,
                padding: const EdgeInsets.all(12),
                child: Column(
                  children: [

                    const SizedBox(height: 20),

                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (_) => const ProfilePage(),
                          ),
                        );
                      },
                      child: const CircleAvatar(
                        radius: 40,
                        backgroundImage: NetworkImage(
                          "https://images.unsplash.com/photo-1494790108377-be9c29b29330",
                        ),
                      ),
                    ),
                  
                  ],
                ),
              ),

              //-----------------------------
              // RIGHT PANEL
              //-----------------------------
              Expanded(
                child: SingleChildScrollView(
                  padding: const EdgeInsets.all(12),
                  child: Column(
                    children: [

                      homeCard(
                        context: context,
                        title: "FASHION CATALOGUE",
                        image:
                            "https://images.unsplash.com/photo-1483985988355-763728e1935b",
                        page: const FashionCataloguePage(),
                      ),

                      const SizedBox(height: 15),

                      homeCard(
                        context: context,
                        title: "SUGGEST AN OUTFIT",
                        image:
                            "https://images.unsplash.com/photo-1496747611176-843222e1e57c",
                        page: const SuggestOutfitPage(),
                      ),

                      const SizedBox(height: 15),

                      homeCard(
                        context: context,
                        title: "DISCOVER YOUR STYLE",
                        image:
                            "https://images.unsplash.com/photo-1529139574466-a303027c1d8b",
                        page: const DiscoverStylePage(),
                      ),

                      const SizedBox(height: 15),

                      homeCard(
                        context: context,
                        title: "PERSONAL STYLIST",
                        image:
                            "https://images.unsplash.com/photo-1487412720507-e7ab37603c6f",
                        page: const PersonalStylistPage(),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget homeCard({

    required BuildContext context,
    required String title,
    required String image,
    required Widget page,

  }) {

    return GestureDetector(

      onTap: () {

        Navigator.push(

          context,

          MaterialPageRoute(
            builder: (_) => page,
          ),

        );

      },

      child: Container(

        width: double.infinity,
        height: 220,

        clipBehavior: Clip.hardEdge,

        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(25),
        ),

        child: Stack(

          fit: StackFit.expand,

          children: [

            Image.network(
              image,
              fit: BoxFit.cover,
            ),

            Container(
              color: Colors.black.withOpacity(0.15),
            ),

            Align(

              alignment: Alignment.bottomLeft,

              child: Padding(

                padding: const EdgeInsets.only(
                  left: 15,
                  bottom: 15,
                ),

                child: Text(

                  title,

                  style: GoogleFonts.cormorantGaramond(

                    color: Colors.white,
                    fontSize: 38,
                    fontWeight: FontWeight.w700,
                    letterSpacing: 1.2,
                    height: 1,

                  ),

                ),

              ),

            ),

          ],

        ),

      ),

    );

  }

}