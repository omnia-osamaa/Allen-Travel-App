import 'package:flutter/material.dart';
import 'package:Allen2/Constants/Color.dart';

class WelcomeBanner extends StatelessWidget {
  final double width;
  final double height;

  const WelcomeBanner({
    Key? key,
    required this.width,
    required this.height,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      margin: EdgeInsets.symmetric(horizontal: width * 0.01),
      padding: EdgeInsets.symmetric(
        horizontal: width * 0.05,
        vertical: height * 0.02,
      ),
      decoration: BoxDecoration(
        color: primary,
        borderRadius: BorderRadius.circular(15),
      ),
      child: Text.rich(
        TextSpan(
          children: [
            TextSpan(
              text: "مرحباً بك ",
              style: TextStyle(
                fontSize: width * 0.045,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
            TextSpan(
              text: "Omnia\n",
              style: TextStyle(
                fontSize: width * 0.045,
                fontWeight: FontWeight.bold,
                color: yellow2,
              ),
            ),
            TextSpan(
              text: "استمتع بتجربة مريحة وآمنة مع سياراتنا المتنوعة",
              style: TextStyle(
                fontSize: width * 0.045,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
          ],
        ),
      ),
    );
  }
}