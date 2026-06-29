import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'screens/auth_gate.dart';
import 'screens/login_page.dart';
import 'screens/signup_page.dart';
Future<void> main() async {

  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp();

  runApp(const FashionAdvisorApp());

}

class FashionAdvisorApp extends StatelessWidget {

  const FashionAdvisorApp({super.key});

  @override
  Widget build(BuildContext context) {

    return const MaterialApp(

      debugShowCheckedModeBanner: false,

      home: AuthGate(),
      // home: const SignupPage(),

    );
//     return const MaterialApp(
//   home: Scaffold(
//     body: Center(
//       child: Text("Hello"),
//     ),
//   ),
// );

  }

}
// Future<void> main() async {
//   WidgetsFlutterBinding.ensureInitialized();

//   try {
//     await Firebase.initializeApp();
//     print("✅ Firebase initialized");
//   } catch (e) {
//     print("❌ Firebase init failed: $e");
//   }

//   runApp(
//     const MaterialApp(
//       home: Scaffold(
//         body: Center(
//           child: Text("Firebase Test"),
//         ),
//       ),
//     ),
//   );
// }
// import 'package:google_fonts/google_fonts.dart';
// import 'dart:typed_data';
// import 'package:file_picker/file_picker.dart';
// import 'models/clothing.dart';
// import 'services/api_service.dart';
// import './screens/outfit_details_page.dart';
// const Color backgroundColor = Colors.white;

// const Color blushPink = Color(0xFFF7DDE2);

// const Color darkText = Color(0xFF1F1F1F);

// const Color lightGrey = Color(0xFFF5F5F5);

// Future<void> main() async {

//   WidgetsFlutterBinding.ensureInitialized();

//   await Firebase.initializeApp();

//   runApp(
//     const FashionAdvisorApp(),
//   );

// }

// class FashionAdvisorApp extends StatelessWidget {
//   const FashionAdvisorApp({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       debugShowCheckedModeBanner: false,
//       home: Builder(
//   builder: (context) {
//     return Scaffold(
//         body: Container(
//           color: backgroundColor,
//           child: SafeArea(
//             child: Row(
//               children: [

//                 // LEFT PANEL
//                 Container(
//                   width: 75,
//                   padding: const EdgeInsets.all(12),
//                   child: Column(
//                     children: [
//                       const SizedBox(height: 20),

//                      GestureDetector(
//   onTap: () {
//     Navigator.push(
//       context,
//       MaterialPageRoute(
//         builder: (context) => const ProfilePage(),
//       ),
//     );
//   },

//   child: const CircleAvatar(
//                         radius: 40,
//                         backgroundImage: NetworkImage(
//                           "https://images.unsplash.com/photo-1494790108377-be9c29b29330",
//                         ),
//                       ),),

//                       const SizedBox(height: 20),

//                     ],
//                   ),
//                 ),

//                 // RIGHT PANEL
//                 Expanded(
//                 child : SingleChildScrollView(
//                   child: Padding(
//                     padding: const EdgeInsets.all(12),
//                     child: Column(
//                       children: [

//                         // MOOD BOX
// //                         Container(
// //                           height: 50,
// //                           width: double.infinity,
// //                          decoration: BoxDecoration(
// //   color: Colors.white,
// //   borderRadius: BorderRadius.circular(20),
// //   border: Border.all(
// //     color: Colors.grey.shade200,
// //   ),
// // ),
// //                           child:  Center(
// //                             child: Text(
// //                               "Hi! What's your mood today?",
// //                               style: GoogleFonts.cormorantGaramond(
// //   fontSize: 26,
// //   fontWeight: FontWeight.w600,
// //   color: darkText,
// // ),
// //                             ),
// //                           ),
// //                         ),

// //                         const SizedBox(height: 15),

//                         // FASHION CATALOGUE
                       
//   GestureDetector(

//     onTap: () {

//       Navigator.of(context).push(
//         MaterialPageRoute(
//           builder: (context) =>
//               const FashionCataloguePage(),
//         ),
//       );

//     },

//     child: Container(
//       width: double.infinity,
//       height : 220,
//       clipBehavior: Clip.hardEdge,

//       decoration: BoxDecoration(
//         borderRadius: BorderRadius.circular(25),
//       ),

//       child: Stack(
//         fit: StackFit.expand,

//         children: [

//           Image.network(
//             "https://images.unsplash.com/photo-1483985988355-763728e1935b",
//             fit: BoxFit.cover,
//           ),

//           Container(
//             color: Colors.black.withOpacity(0.15),
//           ),

//             Align(
//               alignment : Alignment.bottomLeft,
//               child: Padding(
//     padding: const EdgeInsets.only(
//       left: 15,
//       bottom: 15,
//     ),
//             child: Text(
//               "FASHION CATALOGUE",
//              style: GoogleFonts.cormorantGaramond(
//   color: Colors.white,
//   fontSize: 38,
//   fontWeight: FontWeight.w700,
//   letterSpacing: 1.2,
//   height: 1.0,
// ),
//             ),
//             ),
//             ),
//         ],
//       ),
//     ),
//   ),


//                         const SizedBox(height: 15),

//                         // OUTFIT CARD
//                         GestureDetector(
//                         onTap: () {
//   Navigator.push(
//     context,
//     MaterialPageRoute(
//       builder: (context) =>
//           const SuggestOutfitPage(),
//     ),
//   );
// },
//                          child : Container(
//                             width: double.infinity,
//                             height: 220,
//                             clipBehavior: Clip.hardEdge,
//                             decoration: BoxDecoration(
//                               borderRadius: BorderRadius.circular(25),
//                             ),
//                             child: Stack(
//                               fit: StackFit.expand,
//                               children: [

//                                 Image.network(
//                                   "https://images.unsplash.com/photo-1496747611176-843222e1e57c",
//                                   fit: BoxFit.cover,
//                                 ),

//                                 Container(
//                                   color: Colors.black.withOpacity(0.15),
//                                 ),

//                                 Align(
//                                   alignment: Alignment.bottomLeft,
//                                   child: Padding(
//     padding: const EdgeInsets.only(
//       left: 15,
//       bottom: 15,
//     ),
//                                   child: Text(
//                                     "SUGGEST AN OUTFIT",
//                                     style: GoogleFonts.cormorantGaramond(
//   color: Colors.white,
//   fontSize: 38,
//   fontWeight: FontWeight.w700,
//   letterSpacing: 1.2,
//   height: 1.0,
// ),
//                                   ),
//                                 ),
//                                 ),
//                               ],
//                             ),
//                           ),
//                           ),
                        

//                         const SizedBox(height: 15),

//                         // STYLE CARD
//                          GestureDetector(

//     onTap: () {

//       Navigator.push(
//         context,
//         MaterialPageRoute(
//           builder: (context) =>
//               const DiscoverStylePage(),
//         ),
//       );

//     },
//                           child: Container(
//                             width: double.infinity,
//                             height: 220,
//                             clipBehavior: Clip.hardEdge,
//                             decoration: BoxDecoration(
//                               borderRadius: BorderRadius.circular(25),
//                             ),
//                             child: Stack(
//                               fit: StackFit.expand,
//                               children: [

//                                 Image.network(
//                                   "https://images.unsplash.com/photo-1529139574466-a303027c1d8b",
//                                   fit: BoxFit.cover,
//                                 ),

//                                 Container(
//                                   color: Colors.black.withOpacity(0.15),
//                                 ),

//                                 Align(
//                                   alignment: Alignment.bottomLeft,
//                                   child: Padding(
//     padding: const EdgeInsets.only(
//       left: 15,
//       bottom: 15,
//     ),
//                                   child: Text(
//                                    "DISCOVER YOUR STYLE",
//                                     style: GoogleFonts.cormorantGaramond(
//   color: Colors.white,
//   fontSize: 38,
//   fontWeight: FontWeight.w700,
//   letterSpacing: 1.2,
//   height: 1.0,
// ),
//                                   ),
//                                 ),
//                                 ),
//                               ],
//                             ),
//                           ),
//                         ),
                        

//                         const SizedBox(height: 15),
//  GestureDetector(

//     onTap: () {

//       Navigator.push(
//         context,
//         MaterialPageRoute(
//           builder: (context) =>
//               const PersonalStylistPage(),
//         ),
//       );

//     },

//     child: Container(
//       width: double.infinity,
//       height: 220,
//       clipBehavior: Clip.hardEdge,

//       decoration: BoxDecoration(
//         borderRadius: BorderRadius.circular(25),
//       ),

//       child: Stack(
//         fit: StackFit.expand,

//         children: [

//           Image.network(
//             "https://images.unsplash.com/photo-1487412720507-e7ab37603c6f",
//             fit: BoxFit.cover,
//           ),

//           Container(
//             color: Colors.black.withOpacity(0.12),
//           ),

//           Align(
//             alignment: Alignment.bottomLeft,

//             child: Padding(
//               padding: const EdgeInsets.only(
//                 left: 15,
//                 bottom: 15,
//               ),

//               child: Text(
//                 "PERSONAL STYLIST",

//                 style:
//                     GoogleFonts.cormorantGaramond(
//                   color: Colors.white,
//                   fontSize: 38,
//                   fontWeight: FontWeight.w700,
//                   height: 1,
//                 ),
//               ),
//             ),
//           ),
//         ],
//       ),
//     ),
//   ),
//                       ],
//                     ),
//                   ),
//                 ),
//                 ),
//               ],
//             ),
//           ),
//         ),
//             );
//     },
//   ),
// );
//   }
// }

// class FashionCataloguePage extends StatelessWidget {
//   const FashionCataloguePage({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: backgroundColor,

//       appBar: AppBar(
//         backgroundColor: Colors.white,
// foregroundColor: darkText,
// elevation: 0,
//         title: Text(
//   "Fashion Catalogue",
//   style: GoogleFonts.cormorantGaramond(
//     fontSize: 28,
//     fontWeight: FontWeight.w600,
//   ),
// ),
//       ),

//       body: Padding(
//         padding: const EdgeInsets.all(16),

//         child: Column(
//           children: [

//             Expanded(
//               child: Row(
//                 children: [

//                   Expanded(
//                     child: categoryCard(
//                       context,
//                       "Clothing",
//                       "https://images.unsplash.com/photo-1483985988355-763728e1935b",
//                        const ClothingPage(),
//                     ),
//                   ),

//                   const SizedBox(width: 15),

//                   Expanded(
//                     child: categoryCard(
//                       context,
//                       "Makeup",
//                       "https://images.unsplash.com/photo-1522335789203-aabd1fc54bc9",
//                        const MakeupPage(),
//                     ),
//                   ),
//                 ],
//               ),
//             ),

//             const SizedBox(height: 15),

//             Expanded(
//               child: Row(
//                 children: [

//                   Expanded(
//                     child: categoryCard(
//                       context,
//                       "Skincare",
//                       "https://images.unsplash.com/photo-1570172619644-dfd03ed5d881",
//                       const SkincarePage(),
//                     ),
//                   ),

//                   const SizedBox(width: 15),

//                   Expanded(
//                     child: categoryCard(
//                       context,
//                       "Accessories",
//                       "https://images.unsplash.com/photo-1617038220319-276d3cfab638",
//                       const AccessoriesPage(),
//                     ),
//                   ),
//                 ],
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
// Widget categoryCard(
//   BuildContext context,
//   String title,
//   String imageUrl,
//   Widget page,
// ) {
//   return GestureDetector(
//     onTap: () {

//       Navigator.push(
//         context,
//         MaterialPageRoute(
//           builder: (context) => page,
//         ),
//       );

//     },

//     child: Container(
//       clipBehavior: Clip.hardEdge,

//       decoration: BoxDecoration(
//         borderRadius: BorderRadius.circular(25),
//       ),

//       child: Stack(
//         fit: StackFit.expand,

//         children: [

//           Image.network(
//             imageUrl,
//             fit: BoxFit.cover,
//           ),

//           Container(
//             color: Colors.black.withOpacity(0.35),
//           ),

//           Center(
//             child: Text(
//               title,
//               textAlign: TextAlign.center,

//               style: const TextStyle(
//                 color: Colors.white,
//                 fontSize: 22,
//                 fontWeight: FontWeight.bold,
//               ),
//             ),
//           ),
//         ],
//       ),
//     ),
//   );
// }
// class ClothingPage extends StatefulWidget {
//   const ClothingPage({super.key});

//   @override
//   State<ClothingPage> createState() => _ClothingPageState();
// }

// class _ClothingPageState extends State<ClothingPage> {

//   String selectedCategory = "All";
//   final ApiService apiService = ApiService();

// late Future<List<Clothing>> clothingFuture;

//   final TextEditingController searchController =
//     TextEditingController();
//   @override
// void initState() {
//   super.initState();

//   clothingFuture = apiService.getAllClothing();
// }

//   @override
//   Widget build(BuildContext context) {

    

//     return Scaffold(
//       backgroundColor: backgroundColor,

//       appBar: AppBar(
//         backgroundColor: Colors.white,
// foregroundColor: darkText,
// elevation: 0,
//        title: Text(
//   "Clothing",
//   style: GoogleFonts.cormorantGaramond(
//     fontSize: 28,
//     fontWeight: FontWeight.w600,
//   ),
// ),
//       ),

//       body: Padding(
//         padding: const EdgeInsets.all(12),

//         child: Column(
//           children: [

//             TextField(
//   controller: searchController,

//   decoration: InputDecoration(
//     hintText: "Search outfits...",
//     prefixIcon: const Icon(Icons.search),
//     suffixIcon: IconButton(

//       icon: const Icon(Icons.search),

//       onPressed: () {

//         setState(() {

//           if (searchController.text.trim().isEmpty) {

//             clothingFuture =
//                 apiService.getAllClothing();

//           } else {

//             clothingFuture =
//                 apiService.searchClothing(

//                     searchController.text);

//           }

//         });

//       },

//     ),

//     filled: true,
//     fillColor: Colors.white,

//     border: OutlineInputBorder(
//       borderRadius:
//           BorderRadius.circular(20),
//     ),
//   ),
// ),

//             const SizedBox(height: 15),

//             SingleChildScrollView(
//               scrollDirection: Axis.horizontal,

//               child: Row(
//                 children: [

//                   trendChip("All"),

//                   trendChip("Old Money"),

//                   trendChip("Butter Yellow"),

//                   trendChip("Linen"),

//                   trendChip("Clean Girl"),
//                 ],
//               ),
//             ),

//             const SizedBox(height: 15),

//             Expanded(
//   child: FutureBuilder<List<Clothing>>(
//     future: clothingFuture,
//     builder: (context, snapshot) {

//       if (snapshot.connectionState ==
//           ConnectionState.waiting) {

//         return const Center(
//           child: CircularProgressIndicator(),
//         );

//       }

//       if (snapshot.hasError) {

//         return Center(
//           child: Text(
//             snapshot.error.toString(),
//           ),
//         );

//       }

//       if (!snapshot.hasData ||
//           snapshot.data!.isEmpty) {

//         return const Center(
//           child: Text("No outfits found"),
//         );

//       }

//       final outfits = snapshot.data!;

//       return GridView.builder(

//         itemCount: outfits.length,

//         gridDelegate:
//             const SliverGridDelegateWithFixedCrossAxisCount(

//           crossAxisCount: 2,

//           crossAxisSpacing: 12,

//           mainAxisSpacing: 12,

//           childAspectRatio: 0.72,

//         ),

//         itemBuilder: (context, index) {

//           final outfit = outfits[index];

//           return GestureDetector(

//             onTap: () {

//               Navigator.push(

//   context,

//   MaterialPageRoute(

//     builder: (_) =>

//         OutfitDetailsPage(

//       outfit: outfit,

//     ),

//   ),

// );

//             },

//             child: Container(

//               clipBehavior: Clip.hardEdge,

//               decoration: BoxDecoration(

//                 borderRadius:
//                     BorderRadius.circular(20),

//               ),

//               child: Stack(

//                 fit: StackFit.expand,

//                 children: [

//                   Hero(

//                     tag: outfit.id,

//                     child: Image.network(

//                       outfit.imageUrl,

//                       fit: BoxFit.cover,

//                     ),

//                   ),

//                   Container(

//                     decoration: const BoxDecoration(

//                       gradient: LinearGradient(

//                         begin: Alignment.topCenter,

//                         end: Alignment.bottomCenter,

//                         colors: [

//                           Colors.transparent,

//                           Colors.black87,

//                         ],

//                       ),

//                     ),

//                   ),

//                   Positioned(

//                     left: 12,

//                     right: 12,

//                     bottom: 12,

//                     child: Text(

//                       outfit.title,

//                       maxLines: 2,

//                       overflow:
//                           TextOverflow.ellipsis,

//                       style: const TextStyle(

//                         color: Colors.white,

//                         fontSize: 16,

//                         fontWeight:
//                             FontWeight.bold,

//                       ),

//                     ),

//                   ),

//                 ],

//               ),

//             ),

//           );

//         },

//       );

//     },

//   ),

// ),
//           ],
//         ),
//       ),
//     );
//   }

//   Widget trendChip(String label) {

//     return Padding(
//       padding: const EdgeInsets.only(right: 8),

//       child: ChoiceChip(
//         label: Text(label),

//         selected: selectedCategory == label,

//         onSelected: (value) {

//           setState(() {
//             selectedCategory = label;
//           });

//         },
//       ),
//     );
//   }
// }
// class MakeupPage extends StatefulWidget {
//   const MakeupPage({super.key});

//   @override
//   State<MakeupPage> createState() => _MakeupPageState();
// }

// class _MakeupPageState extends State<MakeupPage> {

//   String selectedCategory = "All";

//   final List<Map<String, String>> looks = [
//     {
//       "title": "Soft Glam",
//       "category": "Soft Glam",
//       "image":
//           "https://images.unsplash.com/photo-1522335789203-aabd1fc54bc9",
//     },
//     {
//       "title": "Glass Skin",
//       "category": "Glass Skin",
//       "image":
//           "https://images.unsplash.com/photo-1487412720507-e7ab37603c6f",
//     },
//     {
//       "title": "Latte Makeup",
//       "category": "Latte",
//       "image":
//           "https://images.unsplash.com/photo-1512496015851-a90fb38ba796",
//     },
//     {
//       "title": "Cherry Cola Lips",
//       "category": "Cherry Cola",
//       "image":
//           "https://images.unsplash.com/photo-1496747611176-843222e1e57c",
//     },
//     {
//       "title": "Clean Girl Makeup",
//       "category": "Clean Girl",
//       "image":
//           "https://images.unsplash.com/photo-1515886657613-9f3515b0c78f",
//     },
//   ];

//   @override
//   Widget build(BuildContext context) {

//     List<Map<String, String>> filteredLooks;

//     if (selectedCategory == "All") {
//       filteredLooks = looks;
//     } else {
//       filteredLooks = looks
//           .where(
//             (look) =>
//                 look["category"] == selectedCategory,
//           )
//           .toList();
//     }

//     return Scaffold(
//       backgroundColor: backgroundColor,

//       appBar: AppBar(
//         backgroundColor: Colors.white,
// foregroundColor: darkText,
// elevation: 0,
//         title: Text(
//   "Makeup",
//   style: GoogleFonts.cormorantGaramond(
//     fontSize: 28,
//     fontWeight: FontWeight.w600,
//   ),
// ),
//       ),

//       body: Padding(
//         padding: const EdgeInsets.all(12),

//         child: Column(
//           children: [

//             TextField(
//               decoration: InputDecoration(
//                 hintText: "Search makeup looks...",
//                 prefixIcon: const Icon(Icons.search),

//                 filled: true,
//                 fillColor: Colors.white,

//                 border: OutlineInputBorder(
//                   borderRadius: BorderRadius.circular(20),
//                 ),
//               ),
//             ),

//             const SizedBox(height: 15),

//             SingleChildScrollView(
//               scrollDirection: Axis.horizontal,

//               child: Row(
//                 children: [

//                   makeupChip("All"),

//                   makeupChip("Soft Glam"),

//                   makeupChip("Glass Skin"),

//                   makeupChip("Latte"),

//                   makeupChip("Cherry Cola"),

//                   makeupChip("Clean Girl"),
//                 ],
//               ),
//             ),

//             const SizedBox(height: 15),

//             Expanded(
//               child: GridView.builder(
//                 itemCount: filteredLooks.length,

//                 gridDelegate:
//                     const SliverGridDelegateWithFixedCrossAxisCount(
//                   crossAxisCount: 2,
//                   crossAxisSpacing: 12,
//                   mainAxisSpacing: 12,
//                 ),

//                 itemBuilder: (context, index) {

//                   final look = filteredLooks[index];

//                   return Container(
//                     clipBehavior: Clip.hardEdge,

//                     decoration: BoxDecoration(
//                       borderRadius: BorderRadius.circular(20),
//                     ),

//                     child: Stack(
//                       fit: StackFit.expand,

//                       children: [

//                         Image.network(
//                           look["image"]!,
//                           fit: BoxFit.cover,
//                         ),

//                         Container(
//                           color: Colors.black.withOpacity(0.3),
//                         ),

//                         Center(
//                           child: Text(
//                             look["title"]!,
//                             textAlign: TextAlign.center,

//                             style: const TextStyle(
//                               color: Colors.white,
//                               fontSize: 18,
//                               fontWeight: FontWeight.bold,
//                             ),
//                           ),
//                         ),
//                       ],
//                     ),
//                   );
//                 },
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }

//   Widget makeupChip(String label) {

//     return Padding(
//       padding: const EdgeInsets.only(right: 8),

//       child: ChoiceChip(
//         label: Text(label),

//         selected: selectedCategory == label,

//         onSelected: (value) {

//           setState(() {
//             selectedCategory = label;
//           });

//         },
//       ),
//     );
//   }
// }

// class SkincarePage extends StatefulWidget {
//   const SkincarePage({super.key});

//   @override
//   State<SkincarePage> createState() => _SkincarePageState();
// }

// class _SkincarePageState extends State<SkincarePage> {

//   String selectedCategory = "All";

//   final List<Map<String, String>> products = [
//     {
//       "title": "Glass Skin Routine",
//       "category": "Glass Skin",
//       "image":
//           "https://images.unsplash.com/photo-1570172619644-dfd03ed5d881",
//     },
//     {
//       "title": "Hydration Essentials",
//       "category": "Hydration",
//       "image":
//           "https://images.unsplash.com/photo-1556228578-8c89e6adf883",
//     },
//     {
//       "title": "Acne Care",
//       "category": "Acne",
//       "image":
//           "https://images.unsplash.com/photo-1620916566398-39f1143ab7be",
//     },
//     {
//       "title": "Night Repair",
//       "category": "Night Care",
//       "image":
//           "https://images.unsplash.com/photo-1612817288484-6f916006741a",
//     },
//     {
//       "title": "Clean Girl Skin",
//       "category": "Clean Girl",
//       "image":
//           "https://images.unsplash.com/photo-1596755389378-c31d21fd1273",
//     },
//   ];

//   @override
//   Widget build(BuildContext context) {

//     List<Map<String, String>> filteredProducts;

//     if (selectedCategory == "All") {
//       filteredProducts = products;
//     } else {
//       filteredProducts = products
//           .where(
//             (product) =>
//                 product["category"] == selectedCategory,
//           )
//           .toList();
//     }

//     return Scaffold(
//       backgroundColor: backgroundColor,

//       appBar: AppBar(
//         backgroundColor: Colors.white,
// foregroundColor: darkText,
// elevation: 0,
//         title: Text(
//   "Skincare",
//   style: GoogleFonts.cormorantGaramond(
//     fontSize: 28,
//     fontWeight: FontWeight.w600,
//   ),
// ),
//       ),

//       body: Padding(
//         padding: const EdgeInsets.all(12),

//         child: Column(
//           children: [

//             TextField(
//               decoration: InputDecoration(
//                 hintText: "Search skincare routines...",
//                 prefixIcon: const Icon(Icons.search),

//                 filled: true,
//                 fillColor: Colors.white,

//                 border: OutlineInputBorder(
//                   borderRadius: BorderRadius.circular(20),
//                 ),
//               ),
//             ),

//             const SizedBox(height: 15),

//             SingleChildScrollView(
//               scrollDirection: Axis.horizontal,

//               child: Row(
//                 children: [

//                   skincareChip("All"),

//                   skincareChip("Glass Skin"),

//                   skincareChip("Hydration"),

//                   skincareChip("Acne"),

//                   skincareChip("Night Care"),

//                   skincareChip("Clean Girl"),
//                 ],
//               ),
//             ),

//             const SizedBox(height: 15),

//             Expanded(
//               child: GridView.builder(
//                 itemCount: filteredProducts.length,

//                 gridDelegate:
//                     const SliverGridDelegateWithFixedCrossAxisCount(
//                   crossAxisCount: 2,
//                   crossAxisSpacing: 12,
//                   mainAxisSpacing: 12,
//                 ),

//                 itemBuilder: (context, index) {

//                   final product = filteredProducts[index];

//                   return Container(
//                     clipBehavior: Clip.hardEdge,

//                     decoration: BoxDecoration(
//                       borderRadius: BorderRadius.circular(20),
//                     ),

//                     child: Stack(
//                       fit: StackFit.expand,

//                       children: [

//                         Image.network(
//                           product["image"]!,
//                           fit: BoxFit.cover,
//                         ),

//                         Container(
//                           color: Colors.black.withOpacity(0.3),
//                         ),

//                         Center(
//                           child: Text(
//                             product["title"]!,
//                             textAlign: TextAlign.center,

//                             style: const TextStyle(
//                               color: Colors.white,
//                               fontSize: 18,
//                               fontWeight: FontWeight.bold,
//                             ),
//                           ),
//                         ),
//                       ],
//                     ),
//                   );
//                 },
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }

//   Widget skincareChip(String label) {

//     return Padding(
//       padding: const EdgeInsets.only(right: 8),

//       child: ChoiceChip(
//         label: Text(label),

//         selected: selectedCategory == label,

//         onSelected: (value) {

//           setState(() {
//             selectedCategory = label;
//           });

//         },
//       ),
//     );
//   }
// }

// class AccessoriesPage extends StatefulWidget {
//   const AccessoriesPage({super.key});

//   @override
//   State<AccessoriesPage> createState() => _AccessoriesPageState();
// }

// class _AccessoriesPageState extends State<AccessoriesPage> {

//   String selectedCategory = "All";

//   final List<Map<String, String>> accessories = [
//     {
//       "title": "Gold Jewellery",
//       "category": "Jewellery",
//       "image":
//           "https://images.unsplash.com/photo-1617038220319-276d3cfab638",
//     },
//     {
//       "title": "Statement Bags",
//       "category": "Bags",
//       "image":
//           "https://images.unsplash.com/photo-1584917865442-de89df76afd3",
//     },
//     {
//       "title": "Luxury Watches",
//       "category": "Watches",
//       "image":
//           "https://images.unsplash.com/photo-1523170335258-f5ed11844a49",
//     },
//     {
//       "title": "Summer Sunglasses",
//       "category": "Sunglasses",
//       "image":
//           "https://images.unsplash.com/photo-1511499767150-a48a237f0083",
//     },
//     {
//       "title": "Minimalist Accessories",
//       "category": "Minimalist",
//       "image":
//           "https://images.unsplash.com/photo-1573408301185-9146fe634ad0",
//     },
//   ];

//   @override
//   Widget build(BuildContext context) {

//     List<Map<String, String>> filteredAccessories;

//     if (selectedCategory == "All") {
//       filteredAccessories = accessories;
//     } else {
//       filteredAccessories = accessories
//           .where(
//             (item) =>
//                 item["category"] == selectedCategory,
//           )
//           .toList();
//     }

//     return Scaffold(
//       backgroundColor: backgroundColor,

//       appBar: AppBar(
//         backgroundColor: Colors.white,
// foregroundColor: darkText,
// elevation: 0,
//         title: Text(
//   "Accessories",
//   style: GoogleFonts.cormorantGaramond(
//     fontSize: 28,
//     fontWeight: FontWeight.w600,
//   ),
// ),
//       ),

//       body: Padding(
//         padding: const EdgeInsets.all(12),

//         child: Column(
//           children: [

//             TextField(
//               decoration: InputDecoration(
//                 hintText: "Search accessories...",
//                 prefixIcon: const Icon(Icons.search),

//                 filled: true,
//                 fillColor: Colors.white,

//                 border: OutlineInputBorder(
//                   borderRadius: BorderRadius.circular(20),
//                 ),
//               ),
//             ),

//             const SizedBox(height: 15),

//             SingleChildScrollView(
//               scrollDirection: Axis.horizontal,

//               child: Row(
//                 children: [

//                   accessoriesChip("All"),

//                   accessoriesChip("Jewellery"),

//                   accessoriesChip("Bags"),

//                   accessoriesChip("Watches"),

//                   accessoriesChip("Sunglasses"),

//                   accessoriesChip("Minimalist"),
//                 ],
//               ),
//             ),

//             const SizedBox(height: 15),

//             Expanded(
//               child: GridView.builder(
//                 itemCount: filteredAccessories.length,

//                 gridDelegate:
//                     const SliverGridDelegateWithFixedCrossAxisCount(
//                   crossAxisCount: 2,
//                   crossAxisSpacing: 12,
//                   mainAxisSpacing: 12,
//                 ),

//                 itemBuilder: (context, index) {

//                   final item = filteredAccessories[index];

//                   return Container(
//                     clipBehavior: Clip.hardEdge,

//                     decoration: BoxDecoration(
//                       borderRadius: BorderRadius.circular(20),
//                     ),

//                     child: Stack(
//                       fit: StackFit.expand,

//                       children: [

//                         Image.network(
//                           item["image"]!,
//                           fit: BoxFit.cover,
//                         ),

//                         Container(
//                           color: Colors.black.withOpacity(0.3),
//                         ),

//                         Center(
//                           child: Text(
//                             item["title"]!,
//                             textAlign: TextAlign.center,

//                             style: const TextStyle(
//                               color: Colors.white,
//                               fontSize: 18,
//                               fontWeight: FontWeight.bold,
//                             ),
//                           ),
//                         ),
//                       ],
//                     ),
//                   );
//                 },
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }

//   Widget accessoriesChip(String label) {

//     return Padding(
//       padding: const EdgeInsets.only(right: 8),

//       child: ChoiceChip(
//         label: Text(label),

//         selected: selectedCategory == label,

//         onSelected: (value) {

//           setState(() {
//             selectedCategory = label;
//           });

//         },
//       ),
//     );
//   }
// }
// class ProfilePage extends StatelessWidget {
//   const ProfilePage({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: backgroundColor,

//       appBar: AppBar(
//         backgroundColor: Colors.white,
// foregroundColor: darkText,
// elevation: 0,
//        title: Text(
//   "Profile",
//   style: GoogleFonts.cormorantGaramond(
//     fontSize: 28,
//     fontWeight: FontWeight.w600,
//   ),
// ),
//       ),

//       body: SingleChildScrollView(
//         padding: const EdgeInsets.all(20),

//         child: Column(
//           children: [

//             const SizedBox(height: 10),

//             const CircleAvatar(
//               radius: 55,
//               backgroundImage: NetworkImage(
//                 "https://images.unsplash.com/photo-1494790108377-be9c29b29330",
//               ),
//             ),

//             const SizedBox(height: 15),

//             const Text(
//               "Manasvi",
//               style: TextStyle(
//                 fontSize: 26,
//                 fontWeight: FontWeight.bold,
//               ),
//             ),

//             const SizedBox(height: 20),

//             Container(
//               width: double.infinity,
//               padding: const EdgeInsets.all(16),

//               decoration: BoxDecoration(
//                 color: Colors.white,
//                 borderRadius: BorderRadius.circular(20),
//               ),

//               child: const Column(
//                 crossAxisAlignment: CrossAxisAlignment.start,

//                 children: [

//                   Text(
//                     "Age: 20",
//                     style: TextStyle(fontSize: 16),
//                   ),

//                   SizedBox(height: 10),

//                   Text(
//                     "Style Analyses: 12",
//                     style: TextStyle(fontSize: 16),
//                   ),
//                 ],
//               ),
//             ),

//             const SizedBox(height: 20),

//             Container(
//               width: double.infinity,
//               padding: const EdgeInsets.all(18),

//               decoration: BoxDecoration(
//                 color: blushPink,
//                 borderRadius: BorderRadius.circular(20),
//               ),

//               child: const Text(
//                 '"Confidence is your best accessory."',
//                 textAlign: TextAlign.center,
//                 style: TextStyle(
//                   fontSize: 18,
//                   fontStyle: FontStyle.italic,
//                 ),
//               ),
//             ),

//             const SizedBox(height: 25),

//             const Align(
//               alignment: Alignment.centerLeft,
//               child: Text(
//                 "Your Fashion Preferences",
//                 style: TextStyle(
//                   fontSize: 20,
//                   fontWeight: FontWeight.bold,
//                 ),
//               ),
//             ),

//             const SizedBox(height: 15),

//             styleBar(
//               "Old Money",
//               0.65,
//             ),

//             const SizedBox(height: 15),

//             styleBar(
//               "Coquette",
//               0.20,
//             ),

//             const SizedBox(height: 15),

//             styleBar(
//               "Clean Girl",
//               0.15,
//             ),

//             const SizedBox(height: 25),

//             Container(
//               width: double.infinity,
//               padding: const EdgeInsets.all(16),

//               decoration: BoxDecoration(
//                 color: Colors.white,
//                 borderRadius: BorderRadius.circular(20),
//               ),

//               child: const Column(
//                 children: [

//                   Text(
//                     "Saved Outfits",
//                     style: TextStyle(
//                       fontSize: 18,
//                       fontWeight: FontWeight.bold,
//                     ),
//                   ),

//                   SizedBox(height: 10),

//                   Text(
//                     "12 Saved Looks",
//                     style: TextStyle(
//                       fontSize: 16,
//                     ),
//                   ),
//                 ],
//               ),
//             ),

//             const SizedBox(height: 30),

//             SizedBox(
//               width: double.infinity,

//               child: ElevatedButton(
//                 onPressed: () {},

//                style: ElevatedButton.styleFrom(
//   backgroundColor: blushPink,
//   foregroundColor: darkText,
// ),

//                 child: const Text(
//                   "Logout",
//                   style: TextStyle(
//                     fontSize: 18,
//                   ),
//                 ),
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }

//   static Widget styleBar(
//     String styleName,
//     double percentage,
//   ) {
//     return Column(
//       crossAxisAlignment: CrossAxisAlignment.start,

//       children: [

//         Text(
//           "$styleName  ${(percentage * 100).toInt()}%",
//           style: const TextStyle(
//             fontSize: 16,
//             fontWeight: FontWeight.w600,
//           ),
//         ),

//         const SizedBox(height: 6),

//       LinearProgressIndicator(
//   value: percentage,
//   valueColor: const AlwaysStoppedAnimation(
//   blushPink,
//   ),
//   backgroundColor: const Color(0xFFF1EDF4),),
//       ],
//     );
//   }
// }
// class DiscoverStylePage extends StatefulWidget {
//   const DiscoverStylePage({super.key});

//   @override
//   State<DiscoverStylePage> createState() =>
//       _DiscoverStylePageState();
// }
// class _DiscoverStylePageState
//     extends State<DiscoverStylePage> {

  
//   bool showResults = false;
//   List<Uint8List> uploadedImages = [];
//   Future<void> pickImage() async {

//   FilePickerResult? result =
//       await FilePicker.platform.pickFiles(
//     type: FileType.image,
//   );

//   if (result != null) {

//     setState(() {

//       uploadedImages.add(
//         result.files.first.bytes!,
//       );

//     });

//   }
// }


//   @override
//   Widget build(BuildContext context) {

//     return Scaffold(
//       backgroundColor: backgroundColor,

//       appBar: AppBar(
//         backgroundColor: Colors.white,
// foregroundColor: darkText,
// elevation: 0,
//           title: Text(
//   "Discover Your Style",
//   style: GoogleFonts.cormorantGaramond(
//     fontSize: 28,
//     fontWeight: FontWeight.w600,
//   ),
// ),
//       ),
      
//        body:  SingleChildScrollView( 
//         child : Padding(
//         padding: const EdgeInsets.all(16),

//         child: Column(
//           children: [

//             Container(
//               width: double.infinity,
//               padding: const EdgeInsets.all(20),

//               decoration: BoxDecoration(
//                 color: Colors.white,
//                 borderRadius:
//                     BorderRadius.circular(20),
//               ),

//               child: const Text(
//                 "Upload at least 5 outfit photos so I can analyze your fashion style.",
//                 textAlign: TextAlign.center,
//                 style: TextStyle(
//                   fontSize: 16,
//                 ),
//               ),
//             ),

//             const SizedBox(height: 20),

//             ElevatedButton.icon(

//   onPressed: uploadedImages.length >= 5
//       ? null
//       : pickImage,

//   icon: const Icon(
//     Icons.add_a_photo,
//   ),

//   label: Text(
//     uploadedImages.length >= 5
//         ? "5 Photos Added"
//         : "Add Photo",
//   ),
// ),

//             const SizedBox(height: 15),

//             Text(
//   "${uploadedImages.length} / 5 Photos Uploaded",

//               style: const TextStyle(
//                 fontSize: 18,
//               ),
//             ),

//             const SizedBox(height: 20),

//              GridView.builder(
//   shrinkWrap: true,
//   physics: const NeverScrollableScrollPhysics(),

//   itemCount: uploadedImages.length,

//   gridDelegate:
//       const SliverGridDelegateWithFixedCrossAxisCount(
//     crossAxisCount: 3,
//     crossAxisSpacing: 10,
//     mainAxisSpacing: 10,
//   ),

//   itemBuilder: (context, index) {

//     return ClipRRect(
//       borderRadius:
//           BorderRadius.circular(15),

//       child: Image.memory(
//         uploadedImages[index],
//         fit: BoxFit.cover,
//       ),
//     );
//   },
// ),
            

//             const SizedBox(height: 15),

//             ElevatedButton(
//               onPressed: uploadedImages.length < 5
//     ? null
//     : () {

//         Navigator.push(
//           context,
//           MaterialPageRoute(
//             builder: (context) =>
//                 const StyleResultsPage(),
//           ),
//         );

//       },

//               child: const Text(
//                 "Analyze My Style",
//               ),
//             ),

//             const SizedBox(height: 15),

//             if (showResults)

//               Container(
//                 width: double.infinity,
//                 padding:
//                     const EdgeInsets.all(20),

//                 decoration: BoxDecoration(
//                   color: Colors.white,
//                   borderRadius:
//                       BorderRadius.circular(
//                           20),
//                 ),

//                 child: Column(
//                   children: [

//                     const Text(
//                       "Your Style Profile",
//                       style: TextStyle(
//                         fontSize: 22,
//                         fontWeight:
//                             FontWeight.bold,
//                       ),
//                     ),

//                     const SizedBox(height: 20),

//                     styleBar(
//                       "Old Money",
//                       0.65,
//                     ),

//                     const SizedBox(height: 15),

//                     styleBar(
//                       "Coquette",
//                       0.20,
//                     ),

//                     const SizedBox(height: 15),

//                     styleBar(
//                       "Clean Girl",
//                       0.15,
//                     ),

//                     const SizedBox(height: 20),

//                     const Text(
//                       "\"Elegance never goes out of style.\"",
//                       textAlign:
//                           TextAlign.center,
//                     ),
//                   ],
//                 ),
//               ),
//           ],
//         ),
//       ),
//        ),
//     );
//   }

//   Widget styleBar(
//     String styleName,
//     double percentage,
//   ) {

//     return Column(
//       crossAxisAlignment:
//           CrossAxisAlignment.start,

//       children: [

//         Text(
//           "$styleName ${(percentage * 100).toInt()}%",
//         ),

//         const SizedBox(height: 5),

//         LinearProgressIndicator(
//           value: percentage,
//           minHeight: 10,
//           borderRadius:
//               BorderRadius.circular(20),
//         ),
//       ],
//     );
//   }
// }
// class StyleResultsPage extends StatelessWidget {
//   const StyleResultsPage({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: backgroundColor,

//       appBar: AppBar(
//         backgroundColor: Colors.white,
// foregroundColor: darkText,
// elevation: 0,
//        title: Text(
//   "Your Style Analysis",
//   style: GoogleFonts.cormorantGaramond(
//     fontSize: 28,
//     fontWeight: FontWeight.w600,
//   ),
// ),
//       ),

//       body: SingleChildScrollView(
//         padding: const EdgeInsets.all(16),

//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,

//           children: [

//             Container(
//               width: double.infinity,
//               padding: const EdgeInsets.all(20),

//               decoration: BoxDecoration(
//                 color: Colors.white,
//                 borderRadius: BorderRadius.circular(25),
//               ),

//               child: Column(
//                 children: [

//                   const Text(
//                     "Your Dominant Style",
//                     style: TextStyle(
//                       fontSize: 18,
//                     ),
//                   ),

//                   const SizedBox(height: 10),

//                   const Text(
//                     "👑 Old Money",
//                     style: TextStyle(
//                       fontSize: 30,
//                       fontWeight: FontWeight.bold,
//                     ),
//                   ),

//                   const SizedBox(height: 10),

//                   const Text(
//                     "65% Match",
//                     style: TextStyle(
//                       fontSize: 20,
//                       color: Colors.purple,
//                     ),
//                   ),

//                   const SizedBox(height: 15),

//                   const Text(
//                     "You gravitate towards timeless silhouettes, neutral tones, elegance and understated luxury.",
//                     textAlign: TextAlign.center,
//                   ),
//                 ],
//               ),
//             ),

//             const SizedBox(height: 25),

//             const Text(
//               "Style Breakdown",
//               style: TextStyle(
//                 fontSize: 22,
//                 fontWeight: FontWeight.bold,
//               ),
//             ),

//             const SizedBox(height: 15),

//             styleBar("Old Money", 0.65),

//             const SizedBox(height: 15),

//             styleBar("Coquette", 0.20),

//             const SizedBox(height: 15),

//             styleBar("Clean Girl", 0.15),

//             const SizedBox(height: 25),

//             const Text(
//               "Recommended Styles For You",
//               style: TextStyle(
//                 fontSize: 22,
//                 fontWeight: FontWeight.bold,
//               ),
//             ),

//             const SizedBox(height: 15),

//             recommendationCard(
//               "Parisian Chic",
//               "https://images.unsplash.com/photo-1496747611176-843222e1e57c",
//             ),

//             const SizedBox(height: 15),

//             recommendationCard(
//               "Quiet Luxury",
//               "https://images.unsplash.com/photo-1483985988355-763728e1935b",
//             ),

//             const SizedBox(height: 15),

//             recommendationCard(
//               "Minimal Elegance",
//               "https://images.unsplash.com/photo-1529139574466-a303027c1d8b",
//             ),

//             const SizedBox(height: 25),

//             Container(
//               width: double.infinity,
//               padding: const EdgeInsets.all(20),

//               decoration: BoxDecoration(
//                 color: blushPink,
//                 borderRadius: BorderRadius.circular(20),
//               ),

//               child: const Text(
//                 "\"Structured blazers, neutral palettes and classic accessories will complement your fashion preferences beautifully.\"",
//                 textAlign: TextAlign.center,
//                 style: TextStyle(
//                   fontSize: 16,
//                   fontStyle: FontStyle.italic,
//                 ),
//               ),
//             ),

//             const SizedBox(height: 25),
//           ],
//         ),
//       ),
//     );
//   }

//   static Widget styleBar(
//     String styleName,
//     double percentage,
//   ) {
//     return Column(
//       crossAxisAlignment: CrossAxisAlignment.start,

//       children: [

//         Text(
//           "$styleName ${(percentage * 100).toInt()}%",
//           style: const TextStyle(
//             fontWeight: FontWeight.bold,
//           ),
//         ),

//         const SizedBox(height: 5),

//         LinearProgressIndicator(
//   value: percentage,
//   valueColor: const AlwaysStoppedAnimation(
//     blushPink,
//   ),
//   backgroundColor: const Color(0xFFF1EDF4),),
//       ],
//     );
//   }

//   static Widget recommendationCard(
//     String title,
//     String imageUrl,
//   ) {
//     return Container(
//       height: 180,
//       clipBehavior: Clip.hardEdge,

//       decoration: BoxDecoration(
//         borderRadius: BorderRadius.circular(20),
//       ),

//       child: Stack(
//         fit: StackFit.expand,

//         children: [

//           Image.network(
//             imageUrl,
//             fit: BoxFit.cover,
//           ),

//           Container(
//             color: Colors.black.withOpacity(0.35),
//           ),

//           Center(
//             child: Text(
//               title,
//               style: const TextStyle(
//                 color: Colors.white,
//                 fontSize: 24,
//                 fontWeight: FontWeight.bold,
//               ),
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }
// class PersonalStylistPage extends StatefulWidget {
//   const PersonalStylistPage({super.key});

//   @override
//   State<PersonalStylistPage> createState() =>
//       _PersonalStylistPageState();
// }

// class _PersonalStylistPageState
//     extends State<PersonalStylistPage> {

//   final TextEditingController controller =
//       TextEditingController();

//   List<Map<String, String>> messages = [
//     {
//       "sender": "ai",
//       "text":
//           "Hi! I'm your personal stylist. Ask me anything about fashion, skincare, makeup or styling ✨"
//     }
//   ];

//   void sendMessage() {

//     if (controller.text.trim().isEmpty) {
//       return;
//     }

//     String userMessage = controller.text;

//     setState(() {

//       messages.add({
//         "sender": "user",
//         "text": userMessage,
//       });

//       messages.add({
//         "sender": "ai",
//         "text":
//             "That's a great question! AI responses will be connected later.",
//       });

//     });

//     controller.clear();
//   }

//   @override
//   Widget build(BuildContext context) {

//     return Scaffold(
//       backgroundColor: backgroundColor,

//       appBar: AppBar(
//         backgroundColor: Colors.white,
//         foregroundColor: darkText,
//         elevation: 0,

//         title: Text(
//           "Personal Stylist",
//           style:
//               GoogleFonts.cormorantGaramond(
//             fontSize: 30,
//             fontWeight: FontWeight.w600,
//           ),
//         ),
//       ),

//       body: Column(
//         children: [

//           Padding(
//             padding:
//                 const EdgeInsets.all(16),

//             child: Text(
//               "Your personal fashion, beauty and styling assistant.",
//               textAlign: TextAlign.center,

//               style:
//                   GoogleFonts.cormorantGaramond(
//                 fontSize: 24,
//               ),
//             ),
//           ),

//           Expanded(
//             child: ListView.builder(
//               itemCount: messages.length,

//               itemBuilder:
//                   (context, index) {

//                 bool isUser =
//                     messages[index]["sender"] ==
//                         "user";

//                 return Align(
//                   alignment: isUser
//                       ? Alignment.centerRight
//                       : Alignment.centerLeft,

//                   child: Container(
//                     margin:
//                         const EdgeInsets.symmetric(
//                       horizontal: 12,
//                       vertical: 6,
//                     ),

//                     padding:
//                         const EdgeInsets.all(14),

//                     constraints:
//                         const BoxConstraints(
//                       maxWidth: 300,
//                     ),

//                     decoration:
//                         BoxDecoration(
//                       color: isUser
//                           ? blushPink
//                           : const Color(0xFFF8F8F8),

//   border: Border.all(
//     color: Colors.grey.shade200,
//   ),


//                       borderRadius:
//                           BorderRadius.circular(
//                               20),
//                     ),

//                     child: Text(
//                       messages[index]["text"]!,
//                     ),
//                   ),
//                 );
//               },
//             ),
//           ),

//           Padding(
//             padding:
//                 const EdgeInsets.all(12),

//             child: Row(
//               children: [

//                 Expanded(
//                   child: TextField(
//                     controller: controller,

//                     decoration:
//                         InputDecoration(
//                       hintText:
//                           "Ask your stylist...",

//                       border:
//                           OutlineInputBorder(
//                         borderRadius:
//                             BorderRadius
//                                 .circular(
//                                     20),
//                       ),
//                     ),
//                   ),
//                 ),

//                 const SizedBox(width: 10),

//                 IconButton(
//                   onPressed: sendMessage,

//                   icon: const Icon(
//                     Icons.send,
//                   ),
//                 ),
//               ],
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }
// class SuggestOutfitPage extends StatefulWidget {
//   const SuggestOutfitPage({super.key});

//   @override
//   State<SuggestOutfitPage> createState() =>
//       _SuggestOutfitPageState();
// }

// class _SuggestOutfitPageState
//     extends State<SuggestOutfitPage> {

//   String selectedType = "Top";
//   String selectedOccasion = "College";
//   String selectedMood = "Old Money";
//   String selectedWeather = "Mild";
//   Uint8List? selectedImage;

// Future<void> pickImage() async {

//   FilePickerResult? result =
//       await FilePicker.platform.pickFiles(
//     type: FileType.image,
//   );

//   if (result != null) {

//     setState(() {

//       selectedImage =
//           result.files.first.bytes;

//     });

//   }
// }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: backgroundColor,

//       appBar: AppBar(
//         backgroundColor: Colors.white,
//         foregroundColor: darkText,
//         elevation: 0,

//         title: Text(
//           "Suggest An Outfit",
//           style:
//               GoogleFonts.cormorantGaramond(
//             fontSize: 30,
//             fontWeight: FontWeight.w600,
//           ),
//         ),
//       ),

//       body: SingleChildScrollView(
//         padding:
//             const EdgeInsets.all(20),

//         child: Column(
//           crossAxisAlignment:
//               CrossAxisAlignment.start,

//           children: [

//             Text(
//               "Upload a clothing item and get styling recommendations.",
//               style: GoogleFonts.cormorantGaramond(
//                 fontSize: 24,
//               ),
//             ),

//             const SizedBox(height: 30),

//             sectionTitle("What are you uploading?"),

//             const SizedBox(height: 12),

//             Wrap(
//               spacing: 10,
//               children: [

//                 customChip(
//                   "Top",
//                   selectedType,
//                   (value) {
//                     setState(() {
//                       selectedType = value;
//                     });
//                   },
//                 ),

//                 customChip(
//                   "Bottom",
//                   selectedType,
//                   (value) {
//                     setState(() {
//                       selectedType = value;
//                     });
//                   },
//                 ),

//                 customChip(
//                   "Full Outfit",
//                   selectedType,
//                   (value) {
//                     setState(() {
//                       selectedType = value;
//                     });
//                   },
//                 ),
//               ],
//             ),

//             const SizedBox(height: 30),

//             sectionTitle("Upload Photo"),

//             const SizedBox(height: 12),

//          GestureDetector(

//   onTap: pickImage,

//   child: Container(
//     height: 220,
//     width: double.infinity,

//     decoration: BoxDecoration(
//       color: Colors.white,

//       borderRadius:
//           BorderRadius.circular(20),

//       border: Border.all(
//         color: Colors.grey.shade300,
//       ),
//     ),

//     child: selectedImage == null

//         ? Column(
//             mainAxisAlignment:
//                 MainAxisAlignment.center,

//             children: [

//               const Icon(
//                 Icons.add_photo_alternate_outlined,
//                 size: 50,
//               ),

//               const SizedBox(height: 10),

//               Text(
//                 "Upload Clothing Photo",
//                 style:
//                     GoogleFonts.cormorantGaramond(
//                   fontSize: 24,
//                 ),
//               ),
//             ],
//           )

//         : ClipRRect(
//             borderRadius:
//                 BorderRadius.circular(20),

//             child: Image.memory(
//               selectedImage!,
//               fit: BoxFit.cover,
//               width: double.infinity,
//             ),
//           ),
//   ),
// ),

//             const SizedBox(height: 30),

//             sectionTitle("Occasion"),

//             const SizedBox(height: 12),

//             Wrap(
//               spacing: 10,
//               runSpacing: 10,
//               children: [

//                 occasionChip("College"),
//                 occasionChip("Date"),
//                 occasionChip("Party"),
//                 occasionChip("Interview"),
//                 occasionChip("Wedding"),
//                 occasionChip("Casual"),
//               ],
//             ),

//             const SizedBox(height: 30),

//             sectionTitle("Mood"),

//             const SizedBox(height: 12),

//             Wrap(
//               spacing: 10,
//               runSpacing: 10,

//               children: [

//                 moodChip("Old Money"),
//                 moodChip("Clean Girl"),
//                 moodChip("Coquette"),
//                 moodChip("Minimal"),
//                 moodChip("Elegant"),
//                 moodChip("Streetwear"),
//               ],
//             ),

//             const SizedBox(height: 30),

//             sectionTitle("Weather"),

//             const SizedBox(height: 12),

//             Wrap(
//               spacing: 10,

//               children: [

//                 weatherChip("Hot"),
//                 weatherChip("Mild"),
//                 weatherChip("Cold"),
//                 weatherChip("Rainy"),
//               ],
//             ),

//             const SizedBox(height: 40),

//             SizedBox(
//               width: double.infinity,

//               child:ElevatedButton(
//   onPressed: selectedImage == null
//       ? null
//       : () {

//           Navigator.push(
//             context,
//             MaterialPageRoute(
//               builder: (context) =>
//                   const OutfitSuggestionPage(),
//             ),
//           );

//         },

//                 style: ElevatedButton.styleFrom(
//                   backgroundColor: blushPink,

//                   padding:
//                       const EdgeInsets.symmetric(
//                     vertical: 18,
//                   ),
//                 ),

//                 child: Text(
//                   "Generate Outfit",

//                   style:
//                       GoogleFonts.cormorantGaramond(
//                     fontSize: 24,
//                     color: darkText,
//                   ),
//                 ),
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }

//   Widget sectionTitle(String title) {
//     return Text(
//       title,
//       style: GoogleFonts.cormorantGaramond(
//         fontSize: 28,
//         fontWeight: FontWeight.w600,
//       ),
//     );
//   }

//   Widget customChip(
//     String label,
//     String selectedValue,
//     Function(String) onSelected,
//   ) {
//     return ChoiceChip(
//       label: Text(label),

//       selected: selectedValue == label,

//       onSelected: (_) {
//         onSelected(label);
//       },
//     );
//   }

//   Widget occasionChip(String label) {
//     return customChip(
//       label,
//       selectedOccasion,
//       (value) {
//         setState(() {
//           selectedOccasion = value;
//         });
//       },
//     );
//   }

//   Widget moodChip(String label) {
//     return customChip(
//       label,
//       selectedMood,
//       (value) {
//         setState(() {
//           selectedMood = value;
//         });
//       },
//     );
//   }

//   Widget weatherChip(String label) {
//     return customChip(
//       label,
//       selectedWeather,
//       (value) {
//         setState(() {
//           selectedWeather = value;
//         });
//       },
//     );
//   }
// }
// class OutfitSuggestionPage extends StatelessWidget {
//   const OutfitSuggestionPage({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: backgroundColor,

//       appBar: AppBar(
//         backgroundColor: Colors.white,
//         foregroundColor: darkText,
//         elevation: 0,

//         title: Text(
//           "Your Outfit",
//           style: GoogleFonts.cormorantGaramond(
//             fontSize: 30,
//             fontWeight: FontWeight.w600,
//           ),
//         ),
//       ),

//       body: SingleChildScrollView(
//         padding: const EdgeInsets.all(16),

//         child: Column(
//           crossAxisAlignment:
//               CrossAxisAlignment.start,

//           children: [

//             Text(
//               "Recommended For You",
//               style:
//                   GoogleFonts.cormorantGaramond(
//                 fontSize: 32,
//                 fontWeight: FontWeight.w600,
//               ),
//             ),

//             const SizedBox(height: 20),

//             recommendationCard(
//               "Bottom",
//               "Beige Wide-Leg Trousers",
//               "https://images.unsplash.com/photo-1483985988355-763728e1935b",
//             ),

//             const SizedBox(height: 20),

//             recommendationCard(
//               "Shoes",
//               "Brown Leather Loafers",
//               "https://images.unsplash.com/photo-1542291026-7eec264c27ff",
//             ),

//             const SizedBox(height: 20),

//             recommendationCard(
//               "Accessories",
//               "Gold Watch & Pearl Earrings",
//               "https://images.unsplash.com/photo-1523170335258-f5ed11844a49",
//             ),

//             const SizedBox(height: 20),

//             recommendationCard(
//               "Makeup",
//               "Rosy Nude Lip & Soft Brown Eye Look",
//               "https://images.unsplash.com/photo-1512496015851-a90fb38ba796",
//             ),

//             const SizedBox(height: 30),

//             Container(
//               width: double.infinity,
//               padding: const EdgeInsets.all(20),

//               decoration: BoxDecoration(
//                 color: Colors.white,
//                 borderRadius:
//                     BorderRadius.circular(20),
//               ),

//               child: Column(
//                 children: [

//                   Text(
//                     "Stylist Tip ✨",
//                     style:
//                         GoogleFonts.cormorantGaramond(
//                       fontSize: 26,
//                       fontWeight: FontWeight.w600,
//                     ),
//                   ),

//                   const SizedBox(height: 10),

//                   const Text(
//                     "Neutral tones and structured pieces create an elegant and timeless appearance. Add simple gold accessories for a polished finish.",
//                     textAlign: TextAlign.center,
//                   ),
//                 ],
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }

//   Widget recommendationCard(
//     String title,
//     String item,
//     String imageUrl,
//   ) {
//     return Container(
//       decoration: BoxDecoration(
//         color: Colors.white,
//         borderRadius:
//             BorderRadius.circular(20),
//       ),

      

//           child : Padding(
//             padding:
//                 const EdgeInsets.all(16),

//             child: Column(
//               crossAxisAlignment:
//                   CrossAxisAlignment.start,

//               children: [

//                 Text(
//                   title,
//                   style:
//                       GoogleFonts.cormorantGaramond(
//                     fontSize: 26,
//                     fontWeight: FontWeight.w600,
//                   ),
//                 ),

//                 const SizedBox(height: 8),

//                 ClipRRect(
//             borderRadius:
//                 const BorderRadius.vertical(
//               top: Radius.circular(20),
//             ),

//             child: Image.network(
//               imageUrl,
//               height: 220,
//               width: double.infinity,
//               fit: BoxFit.cover,
//             ),
//           ),

//            const SizedBox(height: 8),

//                 Text(
//                   item,
//                   style: const TextStyle(
//                     fontSize: 16,
//                   ),
//                 ),
//               ],
//             ),
//           ),
//       );
//   }
// }
