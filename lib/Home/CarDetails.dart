import 'package:Allen2/Home/CarDetails/BookingOptions.dart';
import 'package:Allen2/Home/CarDetails/CarBookingHeader.dart';
import 'package:Allen2/Home/CarDetails/CarInfoSection.dart';
import 'package:Allen2/Home/CarDetails/Location.dart';
import 'package:Allen2/Home/Payment.dart';
import 'package:Allen2/Models/CarModel.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class CarBookingScreen extends StatefulWidget {
  final Car car;

  const CarBookingScreen({Key? key, required this.car}) : super(key: key);

  @override
  State<CarBookingScreen> createState() => _CarBookingScreenState();
}

class _CarBookingScreenState extends State<CarBookingScreen> {
  GoogleMapController? mapController;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final width = size.width;

    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        backgroundColor: Colors.white,
        body: SafeArea(
          child: SingleChildScrollView(
            child: Column(
              children: [
                CarBookingHeader(
                  onMapCreated: (controller) => mapController = controller,
                ),
                Padding(
                  padding: EdgeInsets.all(width * 0.05),
                  child: Column(
                    children: [
                      const LocationInputs(),
                      CarInfoSection(car: widget.car),
                      BookingOptions(
                        car: widget.car,
                        onProceedToPayment: (booking) {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) =>
                                  PaymentScreen(booking: booking),
                            ),
                          );
                        },
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
