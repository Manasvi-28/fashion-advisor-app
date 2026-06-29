import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:fashion_advisor_ai/services/auth_service.dart';


const Color backgroundColor = Colors.white;

const Color blushPink = Color(0xFFF7DDE2);

const Color darkText = Color(0xFF1F1F1F);

const Color lightGrey = Color(0xFFF5F5F5);

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,

      appBar: AppBar(
        backgroundColor: Colors.white,
foregroundColor: darkText,
elevation: 0,
       title: Text(
  "Profile",
  style: GoogleFonts.cormorantGaramond(
    fontSize: 28,
    fontWeight: FontWeight.w600,
  ),
),
      ),

      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),

        child: Column(
          children: [

            const SizedBox(height: 10),

            const CircleAvatar(
              radius: 55,
              backgroundImage: NetworkImage(
                "https://images.unsplash.com/photo-1494790108377-be9c29b29330",
              ),
            ),

            const SizedBox(height: 15),

            const Text(
              "Manasvi",
              style: TextStyle(
                fontSize: 26,
                fontWeight: FontWeight.bold,
              ),
            ),

            const SizedBox(height: 20),

            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(16),

              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(20),
              ),

              child: const Column(
                crossAxisAlignment: CrossAxisAlignment.start,

                children: [

                  Text(
                    "Age: 20",
                    style: TextStyle(fontSize: 16),
                  ),

                  SizedBox(height: 10),

                  Text(
                    "Style Analyses: 12",
                    style: TextStyle(fontSize: 16),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 20),

            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(18),

              decoration: BoxDecoration(
                color: blushPink,
                borderRadius: BorderRadius.circular(20),
              ),

              child: const Text(
                '"Confidence is your best accessory."',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 18,
                  fontStyle: FontStyle.italic,
                ),
              ),
            ),

            const SizedBox(height: 25),

            const Align(
              alignment: Alignment.centerLeft,
              child: Text(
                "Your Fashion Preferences",
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),

            const SizedBox(height: 15),

            styleBar(
              "Old Money",
              0.65,
            ),

            const SizedBox(height: 15),

            styleBar(
              "Coquette",
              0.20,
            ),

            const SizedBox(height: 15),

            styleBar(
              "Clean Girl",
              0.15,
            ),

            const SizedBox(height: 25),

            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(16),

              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(20),
              ),

              child: const Column(
                children: [

                  Text(
                    "Saved Outfits",
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),

                  SizedBox(height: 10),

                  Text(
                    "12 Saved Looks",
                    style: TextStyle(
                      fontSize: 16,
                    ),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 30),

            SizedBox(
              width: double.infinity,

              child: ElevatedButton(
                onPressed: () {},

               style: ElevatedButton.styleFrom(
  backgroundColor: blushPink,
  foregroundColor: darkText,
),

                child: const Text(
                  "Logout",
                  style: TextStyle(
                    fontSize: 18,
                  ),
                ),
              ),
            ),
            ElevatedButton.icon(

  onPressed: () async {

    await AuthService().logout();

  },

  icon: const Icon(Icons.logout),

  label: const Text("Logout"),

)
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
          "$styleName  ${(percentage * 100).toInt()}%",
          style: const TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w600,
          ),
        ),

        const SizedBox(height: 6),

      LinearProgressIndicator(
  value: percentage,
  valueColor: const AlwaysStoppedAnimation(
  blushPink,
  ),
  backgroundColor: const Color(0xFFF1EDF4),),
      ],
    );
  }
}