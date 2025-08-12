import 'package:Allen2/Constants/Color.dart';
import 'package:Allen2/Home/BookingData.dart';
import 'package:Allen2/Home/BookingScreen.dart';
import 'package:Allen2/Home/HomeScreen.dart';
import 'package:Allen2/LoginScreens/LoginScreen.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';

class MainScreen extends StatefulWidget {
  final int initialIndex;
  const MainScreen({Key? key, this.initialIndex = 0}) : super(key: key);

  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  late int _currentIndex;

  @override
  void initState() {
    super.initState();
    _currentIndex = widget.initialIndex;
  }

  final List<Widget> _screens = [
    const HomeScreen(),
    MyBookingScreen(bookings: BookingData.allBookings),
    Container(),
  ];

  void _showExitConfirmation() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          backgroundColor: Colors.white,
          title: const Text("تأكيد الخروج"),
          content: const Text("هل تريد الخروج من البرنامج؟"),
          actions: [
            TextButton(
              child: const Text("إلغاء", style: TextStyle(color: primary)),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            ElevatedButton(
              style: ElevatedButton.styleFrom(backgroundColor: primary),
              child: const Text("نعم", style: TextStyle(color: Colors.white)),
              onPressed: () {
                Navigator.of(context).pop();
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (context) => const LoginScreen()),
                );
              },
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final width = size.width;
    final isTablet = width > 600;

    return Scaffold(
      extendBody: true,
      body: IndexedStack(
        index: _currentIndex,
        children: _screens,
      ),
      bottomNavigationBar: CurvedNavigationBar(
        index: _currentIndex,
        height: isTablet ? 70.0 : 57.0,
        backgroundColor: Colors.transparent,
        color: primary,
        buttonBackgroundColor: primary,
        items: const <Widget>[
          Icon(Icons.home, size: 30, color: Colors.white),
          Icon(Icons.car_rental, size: 30, color: Colors.white),
          Icon(Icons.logout, size: 30, color: Colors.white),
        ],
        onTap: (index) {
          if (index == 2) {
            _showExitConfirmation();
          } else {
            setState(() {
              _currentIndex = index;
            });
          }
        },
      ),
    );
  }
}
