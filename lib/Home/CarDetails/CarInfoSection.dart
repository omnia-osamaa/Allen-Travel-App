import 'package:flutter/material.dart';
import 'package:Allen2/Constants/Color.dart';
import 'package:Allen2/Models/CarModel.dart';
import 'package:panorama_viewer/panorama_viewer.dart';

class CarInfoSection extends StatelessWidget {
  final Car car;

  const CarInfoSection({Key? key, required this.car}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final width = size.width;
    final height = size.height;

    return Container(
      width: double.infinity,
      padding: EdgeInsets.all(width * 0.025),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text('مواصفات السيارة',
              style: TextStyle(
                  fontSize: 24, fontWeight: FontWeight.bold, color: primary)),
          const SizedBox(height: 10),
          Row(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(8),
                child: Image.asset(
                  car.image,
                  height: height * 0.107,
                  width: width * 0.205,
                  fit: BoxFit.fill,
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
                        fontSize: width * 0.045,
                        color: Colors.black,
                      ),
                    ),
                    const SizedBox(height: 6),
                    Text(
                      car.code,
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: width * 0.04,
                        color: Colors.black54,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          const SizedBox(height: 16),
          
          GridView.count(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            crossAxisCount: 2,
            crossAxisSpacing: 8,
            mainAxisSpacing: 8,
            childAspectRatio: 2.2,
            children: [
              _carFeature(
                  icon: Icons.people,
                  title: 'عدد المقاعد',
                  value: '${car.seats}'),
              _carFeature(
                  icon: Icons.attach_money,
                  title: 'سعر الكيلومتر',
                  value: car.pricePerKm),
              _carFeature(
                  icon: Icons.calendar_today,
                  title: 'سنة الصنع',
                  value: car.year),
              _carFeature(
                  icon: Icons.settings, title: 'ناقل الحركة', value: car.type),
            ],
          ),
          Divider(height: 30, thickness: 1, color: Colors.grey.shade300),
          const Text('جولة داخل السيارة',
              style: TextStyle(
                  fontSize: 24, fontWeight: FontWeight.bold, color: primary)),
          const SizedBox(height: 10),
          GestureDetector(
            onTap: () {
              showDialog(
                context: context,
                builder: (_) => Dialog(
                  insetPadding: const EdgeInsets.all(12),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12)),
                  child: Stack(
                    children: [
                      const Center(child: CircularProgressIndicator()),
                      PanoramaViewer(
                        child: Image.asset('assets/img/car.png',
                            fit: BoxFit.cover),
                      ),
                    ],
                  ),
                ),
              );
            },
            child: Column(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(12),
                  child: Image.asset(
                    'assets/img/car.png',
                    height: 200,
                    width: double.infinity,
                    fit: BoxFit.cover,
                  ),
                ),
                const SizedBox(height: 8),
                const Text(
                  'اضغط على الصورة للتجربة البانورامية',
                  style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w400,
                      color: Colors.black54),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _carFeature({
    required IconData icon,
    required String title,
    required String value,
  }) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 12),
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(color: Colors.grey.shade300),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Row(
        children: [
          Icon(icon, size: 22, color: primary),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(title,
                    style: const TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.bold,
                        color: Colors.black)),
                const SizedBox(height: 4),
                Text(value,
                    style: const TextStyle(
                        fontSize: 13,
                        fontWeight: FontWeight.normal,
                        color: Colors.black54)),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
