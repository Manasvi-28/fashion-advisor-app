import 'package:flutter/material.dart';
import '../services/auth_service.dart';

class SignupPage extends StatefulWidget {
  const SignupPage({super.key});

  @override
  State<SignupPage> createState() => _SignupPageState();
}

class _SignupPageState extends State<SignupPage> {

  final AuthService authService = AuthService();

  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  bool loading = false;

  Future<void> signUp() async {

    try {

      setState(() {
        loading = true;
      });

      await authService.signUp(
        email: emailController.text.trim(),
        password: passwordController.text,
      );

      if (mounted) {

        ScaffoldMessenger.of(context).showSnackBar(

          const SnackBar(
            content: Text("Account created successfully!"),
          ),

        );

        

      }

    }

    catch (e) {

      if (mounted) {

        ScaffoldMessenger.of(context).showSnackBar(

          SnackBar(
            content: Text(e.toString()),
          ),

        );

      }

    }

    finally {

      if (mounted) {

        setState(() {
          loading = false;
        });

      }

    }

  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(

      appBar: AppBar(
        title: const Text("Create Account"),
      ),

      body: Padding(

        padding: const EdgeInsets.all(20),

        child: Column(

          children: [

            TextField(
              controller: emailController,
              decoration: const InputDecoration(
                labelText: "Email",
              ),
            ),

            const SizedBox(height: 20),

            TextField(
              controller: passwordController,
              obscureText: true,
              decoration: const InputDecoration(
                labelText: "Password",
              ),
            ),

            const SizedBox(height: 30),

            ElevatedButton(

              onPressed:
                  loading ? null : signUp,

              child: loading

                  ? const CircularProgressIndicator()

                  : const Text("Create Account"),

            ),
            const SizedBox(height: 25),

Row(
  mainAxisAlignment: MainAxisAlignment.center,
  children: [

    const Text(
      "Already have an account?",
    ),

    TextButton(

      onPressed: () {

        Navigator.pop(context);

      },

      child: const Text(
        "Login",
      ),

    ),

  ],

),

          ],

        ),

      ),

    );

  }

}