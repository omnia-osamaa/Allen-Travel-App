import 'package:flutter/material.dart';
import 'package:Allen2/Constants/Color.dart';
import 'package:Allen2/Constants/Common.dart';
import 'package:Allen2/Home/NavBar.dart';
import 'package:Allen2/LoginScreens/LoginScreen.dart';

class Signupscreen extends StatefulWidget {
  const Signupscreen({super.key});

  @override
  _SignupscreenState createState() => _SignupscreenState();
}

bool isValidPhone(String phone) {
  return RegExp(r'^01[0-9]{9}$').hasMatch(phone);
}

bool isValidPassword(String password) {
  return RegExp(r'^(?=.*[A-Z])(?=.*\d)(?=.*[!@#\$&*~]).{8,}$')
      .hasMatch(password);
}

class _SignupscreenState extends State<Signupscreen> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();
  final TextEditingController nameController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmPassController = TextEditingController();

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
                  SizedBox(height: isTablet ? 60 : 52),
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
                    "Create an Account",
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
                    "Join us and start booking your perfect ride in just a few steps.",
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
                            keyboardType: TextInputType.name,
                            controller: nameController,
                            labelText: "Name",
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
                          child: TextFormField(
                            controller: phoneController,
                            keyboardType: TextInputType.phone,
                            maxLength: 11,
                            decoration: InputDecoration(
                              counterText: "", // يخفي عداد الحروف
                              labelText: "Phone Number",
                              labelStyle: TextStyle(color: grey2),
                              prefixIcon: Icon(Icons.phone, color: grey3),
                              contentPadding: const EdgeInsets.symmetric(
                                  vertical: 16, horizontal: 12),
                              enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                                borderSide: const BorderSide(color: grey2),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                                borderSide: const BorderSide(color: primary),
                              ),
                            ),
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
                          child: PasswordTextFormFieldWidget(
                            controller: confirmPassController,
                            labelText: "Confirm Password",
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
                                String name = nameController.text.trim();
                                String phone = phoneController.text.trim();
                                String password =
                                    passwordController.text.trim();
                                String confirmPass =
                                    confirmPassController.text.trim();

                                if (name.isEmpty) {
                                  ScaffoldMessenger.of(context).showSnackBar(
                                    const SnackBar(
                                      content: Text("Please enter your name."),
                                      backgroundColor: grey2,
                                    ),
                                  );
                                  return;
                                }

                                if (phone.isEmpty) {
                                  ScaffoldMessenger.of(context).showSnackBar(
                                    const SnackBar(
                                      content: Text(
                                          "Please enter your phone number."),
                                      backgroundColor: grey2,
                                    ),
                                  );
                                  return;
                                }

                                if (!isValidPhone(phone)) {
                                  ScaffoldMessenger.of(context).showSnackBar(
                                    const SnackBar(
                                      content: Text(
                                          "Phone number must be 11 digits and start with 01."),
                                      backgroundColor: grey2,
                                    ),
                                  );
                                  return;
                                }

                                if (password.isEmpty || confirmPass.isEmpty) {
                                  ScaffoldMessenger.of(context).showSnackBar(
                                    const SnackBar(
                                      content: Text(
                                          "Please enter both password and confirm password."),
                                      backgroundColor: grey2,
                                    ),
                                  );
                                  return;
                                }

                                if (!isValidPassword(password)) {
                                  ScaffoldMessenger.of(context).showSnackBar(
                                    const SnackBar(
                                      content: Text(
                                          "Password must be at least 8 characters,\ninclude uppercase letter, number, and symbol."),
                                      backgroundColor: grey2,
                                      duration: Duration(seconds: 6),
                                    ),
                                  );
                                  return;
                                }

                                if (password != confirmPass) {
                                  ScaffoldMessenger.of(context).showSnackBar(
                                    const SnackBar(
                                      content: Text("Passwords do not match."),
                                      backgroundColor: grey2,
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
                                "Sign Up",
                                style: TextStyle(
                                    fontSize: 16, color: Colors.white),
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(height: 24),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Text("Already have an account? "),
                            GestureDetector(
                              onTap: () {
                                Navigator.pushReplacement(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          const LoginScreen()),
                                );
                              },
                              child: const Text(
                                "Login",
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
                  const SizedBox(height: 24),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
