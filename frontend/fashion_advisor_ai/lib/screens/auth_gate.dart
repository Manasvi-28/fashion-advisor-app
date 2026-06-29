import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

import 'login_page.dart';
import './home/home_page.dart';

class AuthGate extends StatelessWidget {

  const AuthGate({super.key});

  @override
  Widget build(BuildContext context) {

    return StreamBuilder<User?>(

      stream: FirebaseAuth.instance.authStateChanges(),

      builder: (context, snapshot) {

        //-----------------------------------
        // Waiting
        //-----------------------------------

        if (snapshot.connectionState ==
            ConnectionState.waiting) {

          return const Scaffold(

            body: Center(

              child: CircularProgressIndicator(),

            ),

          );

        }

        //-----------------------------------
        // Logged In
        //-----------------------------------

        if (snapshot.hasData) {

          return const HomePage();

        }
//         if (snapshot.hasData) {
//   return const Scaffold(
//     body: Center(
//       child: Text("Logged In Successfully"),
//     ),
//   );
// }

        //-----------------------------------
        // Not Logged In
        //-----------------------------------

        return const LoginPage();

      },

    );

  }

}