import 'package:flutter/material.dart';
import 'package:Allen2/Constants/Color.dart';

class LocationInputs extends StatelessWidget {
  const LocationInputs({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'موقعك الحالي',
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w600,
            color: Colors.black87,
          ),
        ),
        const SizedBox(height: 8),
        TextFormField(
          decoration: InputDecoration(
            hintText: 'أدخل موقعك الحالي',
            prefixIcon: const Icon(Icons.my_location, color: primary),
            filled: true,
            fillColor: const Color(0xFFF5F7FA),
            contentPadding: const EdgeInsets.symmetric(
                horizontal: 16, vertical: 14),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: const BorderSide(color: Color(0xFFE8ECF4)),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: const BorderSide(color: primary, width: 1.5),
            ),
          ),
        ),
        const SizedBox(height: 16),
        const Text(
          'الوجهة',
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w600,
            color: Colors.black87,
          ),
        ),
        const SizedBox(height: 8),
        TextFormField(
          decoration: InputDecoration(
            hintText: 'أدخل وجهتك',
            prefixIcon: const Icon(Icons.location_on, color: primary),
            filled: true,
            fillColor: const Color(0xFFF5F7FA),
            contentPadding: const EdgeInsets.symmetric(
                horizontal: 16, vertical: 14),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: const BorderSide(color: Color(0xFFE8ECF4)),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: const BorderSide(color: primary, width: 1.5),
            ),
          ),
        ),
        const SizedBox(height: 24),
      ],
    );
  }
}