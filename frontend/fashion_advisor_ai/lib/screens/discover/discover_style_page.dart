import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:file_picker/file_picker.dart';
import 'dart:typed_data';
import 'style_results_page.dart';

const Color backgroundColor = Colors.white;

const Color blushPink = Color(0xFFF7DDE2);

const Color darkText = Color(0xFF1F1F1F);

const Color lightGrey = Color(0xFFF5F5F5);

class DiscoverStylePage extends StatefulWidget {
  const DiscoverStylePage({super.key});

  @override
  State<DiscoverStylePage> createState() =>
      _DiscoverStylePageState();
}
class _DiscoverStylePageState
    extends State<DiscoverStylePage> {

  
  bool showResults = false;
  List<Uint8List> uploadedImages = [];
  Future<void> pickImage() async {

  FilePickerResult? result =
      await FilePicker.platform.pickFiles(
    type: FileType.image,
  );

  if (result != null) {

    setState(() {

      uploadedImages.add(
        result.files.first.bytes!,
      );

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
  "Discover Your Style",
  style: GoogleFonts.cormorantGaramond(
    fontSize: 28,
    fontWeight: FontWeight.w600,
  ),
),
      ),
      
       body:  SingleChildScrollView( 
        child : Padding(
        padding: const EdgeInsets.all(16),

        child: Column(
          children: [

            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(20),

              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius:
                    BorderRadius.circular(20),
              ),

              child: const Text(
                "Upload at least 5 outfit photos so I can analyze your fashion style.",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 16,
                ),
              ),
            ),

            const SizedBox(height: 20),

            ElevatedButton.icon(

  onPressed: uploadedImages.length >= 5
      ? null
      : pickImage,

  icon: const Icon(
    Icons.add_a_photo,
  ),

  label: Text(
    uploadedImages.length >= 5
        ? "5 Photos Added"
        : "Add Photo",
  ),
),

            const SizedBox(height: 15),

            Text(
  "${uploadedImages.length} / 5 Photos Uploaded",

              style: const TextStyle(
                fontSize: 18,
              ),
            ),

            const SizedBox(height: 20),

             GridView.builder(
  shrinkWrap: true,
  physics: const NeverScrollableScrollPhysics(),

  itemCount: uploadedImages.length,

  gridDelegate:
      const SliverGridDelegateWithFixedCrossAxisCount(
    crossAxisCount: 3,
    crossAxisSpacing: 10,
    mainAxisSpacing: 10,
  ),

  itemBuilder: (context, index) {

    return ClipRRect(
      borderRadius:
          BorderRadius.circular(15),

      child: Image.memory(
        uploadedImages[index],
        fit: BoxFit.cover,
      ),
    );
  },
),
            

            const SizedBox(height: 15),

            ElevatedButton(
              onPressed: uploadedImages.length < 5
    ? null
    : () {

        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) =>
                const StyleResultsPage(),
          ),
        );

      },

              child: const Text(
                "Analyze My Style",
              ),
            ),

            const SizedBox(height: 15),

            if (showResults)

              Container(
                width: double.infinity,
                padding:
                    const EdgeInsets.all(20),

                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius:
                      BorderRadius.circular(
                          20),
                ),

                child: Column(
                  children: [

                    const Text(
                      "Your Style Profile",
                      style: TextStyle(
                        fontSize: 22,
                        fontWeight:
                            FontWeight.bold,
                      ),
                    ),

                    const SizedBox(height: 20),

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

                    const SizedBox(height: 20),

                    const Text(
                      "\"Elegance never goes out of style.\"",
                      textAlign:
                          TextAlign.center,
                    ),
                  ],
                ),
              ),
          ],
        ),
      ),
       ),
    );
  }

  Widget styleBar(
    String styleName,
    double percentage,
  ) {

    return Column(
      crossAxisAlignment:
          CrossAxisAlignment.start,

      children: [

        Text(
          "$styleName ${(percentage * 100).toInt()}%",
        ),

        const SizedBox(height: 5),

        LinearProgressIndicator(
          value: percentage,
          minHeight: 10,
          borderRadius:
              BorderRadius.circular(20),
        ),
      ],
    );
  }
}