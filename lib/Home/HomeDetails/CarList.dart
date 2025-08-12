import 'package:flutter/material.dart';
import 'package:Allen2/Constants/Color.dart';
import 'package:Allen2/Models/CarModel.dart';
import 'package:Allen2/Home/CarDetails.dart';

class CarList extends StatelessWidget {
  final List<Car> cars;
  final bool isTablet;
  final double width;
  final double height;

  const CarList({
    Key? key,
    required this.cars,
    required this.isTablet,
    required this.width,
    required this.height,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      itemCount: cars.length,
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: isTablet ? 2 : 1,
        childAspectRatio: isTablet ? 2 : 1.65,
        crossAxisSpacing: 10,
        mainAxisSpacing: 10,
      ),
      itemBuilder: (context, index) {
        final car = cars[index];
        return Container(
          decoration: BoxDecoration(
            border: Border.all(color: primary, width: 1.5),
            borderRadius: BorderRadius.circular(12),
          ),
          padding: EdgeInsets.all(width * 0.025),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(8),
                child: Image.asset(
                  car.image,
                  height: height * 0.17,
                  width: width * 0.3,
                  fit: BoxFit.cover,
                ),
              ),
              SizedBox(width: width * 0.03),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      car.name,
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: width * 0.04,
                        color: Colors.black,
                      ),
                    ),
                    SizedBox(height: height * 0.005),
                    Text(
                      car.model,
                      style: TextStyle(
                        fontSize: width * 0.035,
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: height * 0.005),
                    Row(
                      children: [
                        const Icon(Icons.settings, color: primary, size: 18),
                        SizedBox(width: width * 0.01),
                        Text(
                          car.type,
                          style: TextStyle(
                            fontSize: width * 0.03,
                            color: grey3,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: height * 0.005),
                    Row(
                      children: [
                        const Icon(Icons.event_seat, color: primary, size: 18),
                        SizedBox(width: width * 0.01),
                        Text(
                          '${car.seats} مقعد',
                          style: TextStyle(
                            fontSize: width * 0.03,
                            color: grey3,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: height * 0.005),
                    Row(
                      children: [
                        const Icon(Icons.price_change, color: primary, size: 18),
                        SizedBox(width: width * 0.01),
                        Text(
                          '${car.pricePerKm} /EGP',
                          style: TextStyle(
                            fontSize: width * 0.035,
                            color: primary,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                    const Spacer(),
                    Align(
                      alignment: Alignment.bottomLeft,
                      child: ElevatedButton(
                        onPressed: () => Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (_) => CarBookingScreen(car: car),
                          ),
                        ),
                        style: ElevatedButton.styleFrom(
                          backgroundColor: primary,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12),
                          ),
                        ),
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Text(
                              "المزيد",
                              style: TextStyle(
                                color: yellow2,
                                fontSize: width * 0.035,
                              ),
                            ),
                            const SizedBox(width: 4),
                            const Icon(
                              Icons.arrow_forward,
                              color: yellow2,
                              size: 16,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}