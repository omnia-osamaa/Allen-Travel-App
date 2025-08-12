import 'package:Allen2/Constants/Color.dart';
import 'package:Allen2/Models/MenueBarModel.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class EmergencyScreen extends StatelessWidget {
  void _makePhoneCall(String number) async {
    final Uri phoneUri = Uri(scheme: 'tel', path: number);
    if (await canLaunchUrl(phoneUri)) {
      await launchUrl(phoneUri);
    } else {
      print('Could not launch $number');
    }
  }

  @override
  Widget build(BuildContext context) {
    final Size screenSize = MediaQuery.of(context).size;
    final double screenWidth = screenSize.width;

    final bool isTablet = screenWidth >= 600;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: primary,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () => Navigator.pop(context),
        ),
        title: const Text(
          "الطوارئ",
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: LayoutBuilder(
        builder: (context, constraints) {
          return Padding(
            padding: EdgeInsets.symmetric(
              vertical: isTablet ? 24 : 12,
              horizontal: isTablet ? 32 : 16,
            ),
            child: ListView.builder(
              itemCount: emergencyNumbers.length,
              itemBuilder: (context, index) {
                final item = emergencyNumbers[index];
                return Card(
                  elevation: isTablet ? 6 : 3,
                  margin: EdgeInsets.symmetric(vertical: isTablet ? 12 : 8),
                  child: ListTile(
                    contentPadding: EdgeInsets.symmetric(
                      vertical: isTablet ? 16 : 8,
                      horizontal: isTablet ? 24 : 16,
                    ),
                    leading: Icon(
                      item['icon'],
                      color: primary,
                      size: isTablet ? 40 : 24,
                    ),
                    title: Text(
                      item['name'],
                      style: TextStyle(
                        fontSize: isTablet ? 24 : 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    subtitle: Text(
                      "${item['number']}",
                      style: TextStyle(fontSize: isTablet ? 20 : 14),
                    ),
                    trailing: Icon(
                      Icons.call,
                      color: Colors.green,
                      size: isTablet ? 32 : 24,
                    ),
                    onTap: () => _makePhoneCall(item['number']),
                  ),
                );
              },
            ),
          );
        },
      ),
    );
  }
}
