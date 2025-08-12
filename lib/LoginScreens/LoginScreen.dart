import 'package:flutter/material.dart';
import 'package:Allen2/Constants/Color.dart';
import 'package:Allen2/Constants/Common.dart';
import 'package:Allen2/Home/NavBar.dart';
import 'package:Allen2/LoginScreens/SignupScreen.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

bool isValidPassword(String password) {
  return RegExp(r'^(?=.*[A-Z])(?=.*\d)(?=.*[!@#\$&*~]).{8,}$')
      .hasMatch(password);
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    final screenWidth = screenSize.width;
    final isTablet = screenWidth > 600;

    return Scaffold(
      backgroundColor: Colors.white,
      body: LayoutBuilder(
        builder: (context, constraints) {
          return Center(
            child: SingleChildScrollView(
              padding: EdgeInsets.symmetric(
                horizontal: isTablet ? screenWidth * 0.2 : 24,
                vertical: 24,
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    width: isTablet ? 120 : 100,
                    height: isTablet ? 120 : 100,
                    margin: const EdgeInsets.only(bottom: 24),
                    decoration: const BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage("assets/img/Allens.png"),
                        fit: BoxFit.contain,
                      ),
                    ),
                  ),
                  Text(
                    "Login to your\naccount",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: isTablet ? 36 : 32,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                      height: 1.2,
                    ),
                  ),
                  const SizedBox(height: 12),
                  Text(
                    "Easily book the perfect car for your journey — fast, reliable, and hassle-free",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: isTablet ? 20 : 18,
                      color: Colors.grey,
                    ),
                  ),
                  const SizedBox(height: 30),
                  Container(
                    padding: const EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(9),
                      boxShadow: const [
                        BoxShadow(
                          color: Colors.black12,
                          blurRadius: 9,
                          offset: Offset(0, 5),
                        )
                      ],
                    ),
                    child: Column(
                      children: [
                        const SizedBox(height: 20),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 20),
                          child: TextFormFieldWidget(
                            keyboardType: TextInputType.emailAddress,
                            controller: emailController,
                            labelText: "Username",
                            labelColor: grey2,
                            prefixIcon: Icons.person,
                            textColor: Colors.black,
                            contentPadding: const EdgeInsets.symmetric(
                                vertical: 16, horizontal: 12),
                          ),
                        ),
                        const SizedBox(height: 20),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 20),
                          child: PasswordTextFormFieldWidget(
                            controller: passwordController,
                            labelText: "Password",
                            labelColor: grey2,
                            prefixIcon: Icons.lock,
                            suffixIcon: Icons.visibility,
                            textColor: Colors.black,
                          ),
                        ),
                        const SizedBox(height: 20),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 20),
                          child: SizedBox(
                            width: double.infinity,
                            child: ElevatedButton(
                              onPressed: () {
                                String email = emailController.text.trim();
                                String password =
                                    passwordController.text.trim();

                                if (email.isEmpty) {
                                  ScaffoldMessenger.of(context).showSnackBar(
                                    const SnackBar(
                                      content:
                                          Text("Please enter your username."),
                                      backgroundColor: grey2,
                                    ),
                                  );
                                  return;
                                }

                                if (password.isEmpty) {
                                  ScaffoldMessenger.of(context).showSnackBar(
                                    const SnackBar(
                                      content:
                                          Text("Please enter your password."),
                                      backgroundColor: grey2,
                                    ),
                                  );
                                  return;
                                }

                                if (!isValidPassword(password)) {
                                  ScaffoldMessenger.of(context).showSnackBar(
                                    const SnackBar(
                                      content: Text(
                                        "Password must be at least 8 characters,\ninclude uppercase letter, number, and symbol.",
                                      ),
                                      backgroundColor: grey2,
                                      duration: Duration(seconds: 6),
                                    ),
                                  );
                                  return;
                                }

                                Navigator.pushReplacement(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => MainScreen()),
                                );
                              },
                              style: ElevatedButton.styleFrom(
                                backgroundColor: primary,
                                padding:
                                    const EdgeInsets.symmetric(vertical: 14),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10),
                                ),
                              ),
                              child: const Text(
                                "Login",
                                style: TextStyle(
                                    fontSize: 16, color: Colors.white),
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(height: 30),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Text("Don't have an account? "),
                            GestureDetector(
                              onTap: () {
                                Navigator.pushReplacement(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          const Signupscreen()),
                                );
                              },
                              child: const Text(
                                "Sign up",
                                style: TextStyle(
                                  color: primary,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 10),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
