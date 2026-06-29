import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

const Color backgroundColor = Colors.white;

const Color blushPink = Color(0xFFF7DDE2);

const Color darkText = Color(0xFF1F1F1F);

const Color lightGrey = Color(0xFFF5F5F5);

class PersonalStylistPage extends StatefulWidget {
  const PersonalStylistPage({super.key});

  @override
  State<PersonalStylistPage> createState() =>
      _PersonalStylistPageState();
}

class _PersonalStylistPageState
    extends State<PersonalStylistPage> {

  final TextEditingController controller =
      TextEditingController();

  List<Map<String, String>> messages = [
    {
      "sender": "ai",
      "text":
          "Hi! I'm your personal stylist. Ask me anything about fashion, skincare, makeup or styling ✨"
    }
  ];

  void sendMessage() {

    if (controller.text.trim().isEmpty) {
      return;
    }

    String userMessage = controller.text;

    setState(() {

      messages.add({
        "sender": "user",
        "text": userMessage,
      });

      messages.add({
        "sender": "ai",
        "text":
            "That's a great question! AI responses will be connected later.",
      });

    });

    controller.clear();
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
          "Personal Stylist",
          style:
              GoogleFonts.cormorantGaramond(
            fontSize: 30,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),

      body: Column(
        children: [

          Padding(
            padding:
                const EdgeInsets.all(16),

            child: Text(
              "Your personal fashion, beauty and styling assistant.",
              textAlign: TextAlign.center,

              style:
                  GoogleFonts.cormorantGaramond(
                fontSize: 24,
              ),
            ),
          ),

          Expanded(
            child: ListView.builder(
              itemCount: messages.length,

              itemBuilder:
                  (context, index) {

                bool isUser =
                    messages[index]["sender"] ==
                        "user";

                return Align(
                  alignment: isUser
                      ? Alignment.centerRight
                      : Alignment.centerLeft,

                  child: Container(
                    margin:
                        const EdgeInsets.symmetric(
                      horizontal: 12,
                      vertical: 6,
                    ),

                    padding:
                        const EdgeInsets.all(14),

                    constraints:
                        const BoxConstraints(
                      maxWidth: 300,
                    ),

                    decoration:
                        BoxDecoration(
                      color: isUser
                          ? blushPink
                          : const Color(0xFFF8F8F8),

  border: Border.all(
    color: Colors.grey.shade200,
  ),


                      borderRadius:
                          BorderRadius.circular(
                              20),
                    ),

                    child: Text(
                      messages[index]["text"]!,
                    ),
                  ),
                );
              },
            ),
          ),

          Padding(
            padding:
                const EdgeInsets.all(12),

            child: Row(
              children: [

                Expanded(
                  child: TextField(
                    controller: controller,

                    decoration:
                        InputDecoration(
                      hintText:
                          "Ask your stylist...",

                      border:
                          OutlineInputBorder(
                        borderRadius:
                            BorderRadius
                                .circular(
                                    20),
                      ),
                    ),
                  ),
                ),

                const SizedBox(width: 10),

                IconButton(
                  onPressed: sendMessage,

                  icon: const Icon(
                    Icons.send,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}