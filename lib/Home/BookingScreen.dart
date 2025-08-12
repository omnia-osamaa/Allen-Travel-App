import 'package:Allen2/Constants/Color.dart';
import 'package:flutter/material.dart';
import '../Models/CarModel.dart';

class MyBookingScreen extends StatefulWidget {
  final List<Booking> bookings;

  const MyBookingScreen({Key? key, required this.bookings}) : super(key: key);

  @override
  State<MyBookingScreen> createState() => _MyBookingScreenState();
}

class _MyBookingScreenState extends State<MyBookingScreen> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final width = size.width;
    final height = size.height;
    final isTablet = width > 600;

    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: primary,
          elevation: 0,
          iconTheme: const IconThemeData(color: Colors.white),
          automaticallyImplyLeading: true,
          title: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "حجوزاتي",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: isTablet ? 26 : 22,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Image.asset(
                "assets/img/Allens.png",
                height: height * 0.05,
              ),
            ],
          ),
        ),
        body: widget.bookings.isEmpty
            ? Center(
                child: Text(
                  'لا توجد حجوزات حالياً',
                  style: TextStyle(
                    fontSize: width * 0.045,
                    fontWeight: FontWeight.bold,
                    color: Colors.grey[600],
                  ),
                ),
              )
            : ListView.builder(
                itemCount: widget.bookings.length,
                padding: EdgeInsets.symmetric(
                    horizontal: width * 0.04, vertical: height * 0.02),
                itemBuilder: (context, index) {
                  final booking = widget.bookings[index];
                  final car = booking.car;

                  return Card(
                    elevation: 4,
                    margin: EdgeInsets.only(bottom: height * 0.02),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Padding(
                      padding: EdgeInsets.all(width * 0.035),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          ClipRRect(
                            borderRadius: BorderRadius.circular(10),
                            child: Image.asset(
                              car.image,
                              width: isTablet ? width * 0.18 : width * 0.2,
                              height: isTablet ? width * 0.18 : width * 0.2,
                              fit: BoxFit.cover,
                            ),
                          ),
                          SizedBox(width: width * 0.04),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  car.name,
                                  style: TextStyle(
                                    fontSize: width * 0.045,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                SizedBox(height: height * 0.007),
                                Text(
                                  'نوع الرحلة: ${booking.tripType}',
                                  style: TextStyle(fontSize: width * 0.035),
                                ),
                                SizedBox(height: height * 0.003),
                                Text(
                                  'تاريخ الذهاب: ${_formatDate(booking.goDate)}',
                                  style: TextStyle(fontSize: width * 0.035),
                                ),
                                if (booking.returnDate != null) ...[
                                  SizedBox(height: height * 0.003),
                                  Text(
                                    'تاريخ العودة: ${_formatDate(booking.returnDate!)}',
                                    style: TextStyle(fontSize: width * 0.035),
                                  ),
                                ],
                                SizedBox(height: height * 0.003),
                                Text(
                                  'الدفع: ${booking.fullPayment ? "كامل" : "جزئي"}',
                                  style: TextStyle(fontSize: width * 0.035),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
      ),
    );
  }

  String _formatDate(DateTime date) {
    return "${date.day}/${date.month}/${date.year}";
  }
}
