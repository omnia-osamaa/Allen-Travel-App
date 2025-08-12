import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class CarBookingHeader extends StatelessWidget {
  final Function(GoogleMapController) onMapCreated;

  const CarBookingHeader({Key? key, required this.onMapCreated})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: 350,
          child: GoogleMap(
            onMapCreated: onMapCreated,
            initialCameraPosition: const CameraPosition(
              target: LatLng(30.0444, 31.2357),
              zoom: 12,
            ),
          ),
        ),
        const SizedBox(height: 16),
      ],
    );
  }
}
