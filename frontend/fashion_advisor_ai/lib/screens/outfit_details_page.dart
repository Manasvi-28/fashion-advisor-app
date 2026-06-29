import 'package:flutter/material.dart';
  import '../models/clothing.dart';
  import '../services/api_service.dart';
  import 'package:google_fonts/google_fonts.dart';
  const Color backgroundColor = Colors.white;
class OutfitDetailsPage extends StatefulWidget {

  final Clothing outfit;

  const OutfitDetailsPage({

    super.key,

    required this.outfit,

  });

  @override
  State<OutfitDetailsPage> createState() =>
      _OutfitDetailsPageState();

}
class _OutfitDetailsPageState
    extends State<OutfitDetailsPage> {

  final ApiService apiService = ApiService();

  @override
  void initState() {

    super.initState();

    apiService.incrementView(
      widget.outfit.id,
    );

  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(

      backgroundColor: backgroundColor,

      body: SafeArea(

        child: SingleChildScrollView(

          child: Column(

            crossAxisAlignment:
                CrossAxisAlignment.start,

            children: [

              // image
              Hero(

  tag: widget.outfit.id,

  child: ClipRRect(

    borderRadius:

        const BorderRadius.only(

      bottomLeft:
          Radius.circular(25),

      bottomRight:
          Radius.circular(25),

    ),

    child: Image.network(

      widget.outfit.imageUrl,

      height: 420,

      width: double.infinity,

      fit: BoxFit.contain,

    ),

  ),

),

              // title
              Padding(

  padding:

      const EdgeInsets.all(18),

  child: Text(

    widget.outfit.title,

    style:

        GoogleFonts.cormorantGaramond(

      fontSize: 34,

      fontWeight:
          FontWeight.bold,

    ),

  ),

),

              // description
              Padding(

  padding:
      const EdgeInsets.symmetric(

    horizontal: 18,

  ),

  child: Text(

    "${widget.outfit.targetAudience} • "

    "${widget.outfit.mainCategory}",

    style:

        GoogleFonts.poppins(

      color: Colors.grey,

      fontSize: 15,

    ),

  ),

),  Wrap(

  children:

      widget.outfit.styleTags

          .map(buildChip)

          .toList(),

),

              // chips
              

            ],

          ),

        ),

      ),

    );

  }
  Widget buildChip(String text) {

  return Container(

    margin:

        const EdgeInsets.only(

      right: 8,

      bottom: 8,

    ),

    padding:

        const EdgeInsets.symmetric(

      horizontal: 14,

      vertical: 8,

    ),

    decoration: BoxDecoration(

      color: Colors.white,

      borderRadius:
          BorderRadius.circular(20),

    ),

    child: Text(text),

  );

}

}