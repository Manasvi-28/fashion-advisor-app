import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:file_picker/file_picker.dart';
import 'dart:typed_data';
import 'outfit_suggestion_page.dart';

const Color backgroundColor = Colors.white;

const Color blushPink = Color(0xFFF7DDE2);

const Color darkText = Color(0xFF1F1F1F);

const Color lightGrey = Color(0xFFF5F5F5);
class SuggestOutfitPage extends StatefulWidget {
  const SuggestOutfitPage({super.key});

  @override
  State<SuggestOutfitPage> createState() =>
      _SuggestOutfitPageState();
}

class _SuggestOutfitPageState
    extends State<SuggestOutfitPage> {

  String selectedType = "Top";
  String selectedOccasion = "College";
  String selectedMood = "Old Money";
  String selectedWeather = "Mild";
  Uint8List? selectedImage;

Future<void> pickImage() async {

  FilePickerResult? result =
      await FilePicker.platform.pickFiles(
    type: FileType.image,
  );

  if (result != null) {

    setState(() {

      selectedImage =
          result.files.first.bytes;

    });

  }
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
          "Suggest An Outfit",
          style:
              GoogleFonts.cormorantGaramond(
            fontSize: 30,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),

      body: SingleChildScrollView(
        padding:
            const EdgeInsets.all(20),

        child: Column(
          crossAxisAlignment:
              CrossAxisAlignment.start,

          children: [

            Text(
              "Upload a clothing item and get styling recommendations.",
              style: GoogleFonts.cormorantGaramond(
                fontSize: 24,
              ),
            ),

            const SizedBox(height: 30),

            sectionTitle("What are you uploading?"),

            const SizedBox(height: 12),

            Wrap(
              spacing: 10,
              children: [

                customChip(
                  "Top",
                  selectedType,
                  (value) {
                    setState(() {
                      selectedType = value;
                    });
                  },
                ),

                customChip(
                  "Bottom",
                  selectedType,
                  (value) {
                    setState(() {
                      selectedType = value;
                    });
                  },
                ),

                customChip(
                  "Full Outfit",
                  selectedType,
                  (value) {
                    setState(() {
                      selectedType = value;
                    });
                  },
                ),
              ],
            ),

            const SizedBox(height: 30),

            sectionTitle("Upload Photo"),

            const SizedBox(height: 12),

         GestureDetector(

  onTap: pickImage,

  child: Container(
    height: 220,
    width: double.infinity,

    decoration: BoxDecoration(
      color: Colors.white,

      borderRadius:
          BorderRadius.circular(20),

      border: Border.all(
        color: Colors.grey.shade300,
      ),
    ),

    child: selectedImage == null

        ? Column(
            mainAxisAlignment:
                MainAxisAlignment.center,

            children: [

              const Icon(
                Icons.add_photo_alternate_outlined,
                size: 50,
              ),

              const SizedBox(height: 10),

              Text(
                "Upload Clothing Photo",
                style:
                    GoogleFonts.cormorantGaramond(
                  fontSize: 24,
                ),
              ),
            ],
          )

        : ClipRRect(
            borderRadius:
                BorderRadius.circular(20),

            child: Image.memory(
              selectedImage!,
              fit: BoxFit.cover,
              width: double.infinity,
            ),
          ),
  ),
),

            const SizedBox(height: 30),

            sectionTitle("Occasion"),

            const SizedBox(height: 12),

            Wrap(
              spacing: 10,
              runSpacing: 10,
              children: [

                occasionChip("College"),
                occasionChip("Date"),
                occasionChip("Party"),
                occasionChip("Interview"),
                occasionChip("Wedding"),
                occasionChip("Casual"),
              ],
            ),

            const SizedBox(height: 30),

            sectionTitle("Mood"),

            const SizedBox(height: 12),

            Wrap(
              spacing: 10,
              runSpacing: 10,

              children: [

                moodChip("Old Money"),
                moodChip("Clean Girl"),
                moodChip("Coquette"),
                moodChip("Minimal"),
                moodChip("Elegant"),
                moodChip("Streetwear"),
              ],
            ),

            const SizedBox(height: 30),

            sectionTitle("Weather"),

            const SizedBox(height: 12),

            Wrap(
              spacing: 10,

              children: [

                weatherChip("Hot"),
                weatherChip("Mild"),
                weatherChip("Cold"),
                weatherChip("Rainy"),
              ],
            ),

            const SizedBox(height: 40),

            SizedBox(
              width: double.infinity,

              child:ElevatedButton(
  onPressed: selectedImage == null
      ? null
      : () {

          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) =>
                  const OutfitSuggestionPage(),
            ),
          );

        },

                style: ElevatedButton.styleFrom(
                  backgroundColor: blushPink,

                  padding:
                      const EdgeInsets.symmetric(
                    vertical: 18,
                  ),
                ),

                child: Text(
                  "Generate Outfit",

                  style:
                      GoogleFonts.cormorantGaramond(
                    fontSize: 24,
                    color: darkText,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget sectionTitle(String title) {
    return Text(
      title,
      style: GoogleFonts.cormorantGaramond(
        fontSize: 28,
        fontWeight: FontWeight.w600,
      ),
    );
  }

  Widget customChip(
    String label,
    String selectedValue,
    Function(String) onSelected,
  ) {
    return ChoiceChip(
      label: Text(label),

      selected: selectedValue == label,

      onSelected: (_) {
        onSelected(label);
      },
    );
  }

  Widget occasionChip(String label) {
    return customChip(
      label,
      selectedOccasion,
      (value) {
        setState(() {
          selectedOccasion = value;
        });
      },
    );
  }

  Widget moodChip(String label) {
    return customChip(
      label,
      selectedMood,
      (value) {
        setState(() {
          selectedMood = value;
        });
      },
    );
  }

  Widget weatherChip(String label) {
    return customChip(
      label,
      selectedWeather,
      (value) {
        setState(() {
          selectedWeather = value;
        });
      },
    );
  }
}