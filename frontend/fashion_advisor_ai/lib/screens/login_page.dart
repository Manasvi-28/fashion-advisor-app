import 'package:flutter/material.dart';
import '../services/auth_service.dart';
import 'signup_page.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {

  final AuthService authService = AuthService();

  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  bool loading = false;

  Future<void> login() async {

    try {

      setState(() {
        loading = true;
      });

      await authService.login(
        email: emailController.text.trim(),
        password: passwordController.text,
      );

      if (mounted) {

        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text("Login Successful"),
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
        title: const Text("Login"),
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
                  loading ? null : login,

              child: loading

                  ? const CircularProgressIndicator()

                  : const Text("Login"),

            ),

            const SizedBox(height: 15),

            TextButton(

              onPressed: () async {

  try {

    await authService.resetPassword(
      email: emailController.text.trim(),
    );

    if (mounted) {

      ScaffoldMessenger.of(context).showSnackBar(

        const SnackBar(
          content: Text(
            "Password reset email sent.",
          ),
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

},

              child: const Text(
                "Forgot Password?",
              ),

            ),
            const SizedBox(height: 25),

Row(
  mainAxisAlignment: MainAxisAlignment.center,
  children: [

    const Text(
      "Don't have an account?",
    ),

    TextButton(

      onPressed: () {

        Navigator.push(

          context,

          MaterialPageRoute(
            builder: (_) => const SignupPage(),
          ),

        );

      },

      child: const Text(
        "Sign Up",
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