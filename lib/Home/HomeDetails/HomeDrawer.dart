import 'package:Allen2/MenuBar/AboutUs.dart';
import 'package:Allen2/MenuBar/Emergency.dart';
import 'package:Allen2/MenuBar/Notification.dart';
import 'package:flutter/material.dart';
import 'package:Allen2/Constants/Color.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:share_plus/share_plus.dart';

class HomeDrawer extends StatelessWidget {
  final double width;
  final double height;

  const HomeDrawer({
    Key? key,
    required this.width,
    required this.height,
  }) : super(key: key);

  void _launchPhoneCall() async {
    final Uri uri = Uri(scheme: 'tel', path: '01094221157');
    if (await canLaunchUrl(uri)) {
      await launchUrl(uri);
    } else {
      debugPrint("تعذر فتح الاتصال");
    }
  }

  void _launchRateApp() async {
    const url = "https://play.google.com/store/apps/details?id=com.example.app";
    if (await canLaunchUrl(Uri.parse(url))) {
      await launchUrl(Uri.parse(url), mode: LaunchMode.externalApplication);
    }
  }

  void _shareApp() {
    Share.share(
      "جرّب تطبيق Allen Travel 🚗📱\nhttps://play.google.com/store/apps/details?id=com.example.app",
    );
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width * 0.6,
      child: Drawer(
        backgroundColor: Colors.white,
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            // Header
            Container(
              height: height * 0.12,
              padding: EdgeInsets.all(width * 0.04),
              alignment: Alignment.centerRight,
              color: primary,
              child: Text(
                'القائمة',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: width * 0.06,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),

            // About Us
            ListTile(
              leading: const Icon(Icons.info_outline, color: primary),
              title: const Text('من نحن'),
              onTap: () => Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const AboutUsView()),
              ),
            ),
            const Divider(),

            // Notifications
            ListTile(
              leading: const Icon(Icons.notifications, color: primary),
              title: const Text('الإشعارات'),
              onTap: () => Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => const NotificationsView()),
              ),
            ),
            const Divider(),

            // Emergency
            ListTile(
              leading: const Icon(Icons.warning_amber_rounded, color: primary),
              title: const Text('الطوارئ'),
              onTap: () => Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => EmergencyScreen()),
              ),
            ),
            const Divider(),

            // Contact Us
            ListTile(
              leading: const Icon(Icons.phone, color: primary),
              title: const Text('اتصل بنا'),
              onTap: _launchPhoneCall,
            ),
            const Divider(),

            // Rate App
            ListTile(
              leading: const Icon(Icons.star_rate, color: primary),
              title: const Text('قيّم التطبيق'),
              onTap: _launchRateApp,
            ),
            const Divider(),

            // Share App
            ListTile(
              leading: const Icon(Icons.share, color: primary),
              title: const Text('مشاركة التطبيق'),
              onTap: _shareApp,
            ),

            // Exit / Logout
          ],
        ),
      ),
    );
  }
}
