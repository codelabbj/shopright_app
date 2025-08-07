import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../utils/customs_text_field_widget.dart';
// le fichier du widget ci-dessus

class SignUpPage extends StatelessWidget {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmPasswordController = TextEditingController();

  SignUpPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: ListView(
          children: [
            Image.asset(
              "assets/logo/srtc.png",
              width: 80,
              height: 80,
              color: Colors.black,
            ),
            const SizedBox(height: 50),
            Text(
              'Sign Up For Free',
              style: GoogleFonts.montserrat(
                fontSize: 26,
                fontWeight: FontWeight.w700,
                color: Colors.black,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 30),
            CustomTextFormField(
              label: 'User Name',
              hintText: 'Masud Rana Palash',
              icon: Icons.person,
              controller: nameController,
            ),
            CustomTextFormField(
              label: 'Email Address',
              hintText: 'exemple@gmail.com',
              icon: Icons.email,
              controller: emailController,
            ),
            CustomTextFormField(
              label: 'Password',
              hintText: '123456',
              icon: Icons.lock,
              isPassword: true,
              controller: passwordController,
            ),
            CustomTextFormField(
              label: 'Confirm Password',
              hintText: '123456',
              icon: Icons.lock,
              isPassword: true,
              controller: confirmPasswordController,
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Color(0xFFFF5722),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(24),
                ),
                padding: const EdgeInsets.symmetric(vertical: 16),
              ),
              onPressed: () {
                // Logique d'inscription
              },
              child: const Text(
                'Sign Up',
                style: TextStyle(fontSize: 16, color: Colors.white),
              ),
            ),
            const SizedBox(height: 16),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Expanded(
                    flex: 2,
                    child: Divider(
                      color: Colors.grey[400],
                    )),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8.0),
                  child: Center(
                    child: Text(
                      "Or",
                      style: GoogleFonts.montserrat(
                        color: Colors.grey[400],
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
                Expanded(flex: 2, child: Divider(color: Colors.grey[400])),
              ],
            ),
            const SizedBox(
              height: 15,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Already have an account? ",
                  style: Theme.of(context).textTheme.labelMedium,
                ),
                GestureDetector(
                  onTap: () {
                    // Naviguer vers la page de connexion
                  },
                  child: Text(
                    "Sign In.",
                    style: GoogleFonts.montserrat(
                      color: Color(0xFFFF5722),
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
