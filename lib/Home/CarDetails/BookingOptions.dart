import 'package:Allen2/Home/NavBar.dart';
import 'package:flutter/material.dart';
import 'package:Allen2/Constants/Color.dart';
import 'package:Allen2/Models/CarModel.dart';

class BookingOptions extends StatefulWidget {
  final Car car;
  final Function(Booking) onProceedToPayment;

  const BookingOptions({
    Key? key,
    required this.car,
    required this.onProceedToPayment,
  }) : super(key: key);

  @override
  _BookingOptionsState createState() => _BookingOptionsState();
}

class _BookingOptionsState extends State<BookingOptions> {
  String tripType = 'ذهاب فقط';
  DateTime? goDate;
  DateTime? returnDate;
  bool fullPayment = true;

  void _selectDate({required bool isReturn}) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime.now(),
      lastDate: DateTime(2100),
      builder: (context, child) {
        return Theme(
          data: Theme.of(context).copyWith(
            dialogBackgroundColor: Colors.white, // لون خلفية الكاليندر
            colorScheme: ColorScheme.light(
              primary: primary, // لون الخط والزر الأساسي
              onPrimary: Colors.white, // لون النص على الزر الأساسي
              onSurface: Colors.black, // لون النص العام
            ),
            textButtonTheme: TextButtonThemeData(
              style: TextButton.styleFrom(
                foregroundColor: primary, // لون زر "إلغاء" و"موافق"
              ),
            ),
          ),
          child: child!,
        );
      },
    );

    if (picked != null) {
      if (isReturn) {
        if (goDate != null && picked.isBefore(goDate!)) {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content: Text('تاريخ العودة لا يمكن أن يكون قبل تاريخ الذهاب'),
              backgroundColor: grey2,
              duration: Duration(seconds: 4),
            ),
          );
          return;
        }
        setState(() => returnDate = picked);
      } else {
        setState(() {
          goDate = picked;
          if (returnDate != null && returnDate!.isBefore(goDate!)) {
            returnDate = null;
          }
        });
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Divider(height: 30, thickness: 1, color: Colors.grey.shade300),
        Align(
          alignment: Alignment.centerRight,
          child: const Text('معلومات اضافيه',
              style: TextStyle(
                  fontSize: 24, fontWeight: FontWeight.bold, color: primary)),
        ),
        const SizedBox(height: 16),
        DropdownButtonFormField<String>(
          value: tripType,
          isExpanded: true,
          icon: const Icon(Icons.arrow_drop_down, color: primary),
          dropdownColor: Colors.white,
          decoration: InputDecoration(
            labelText: 'نوع الرحلة',
            filled: true,
            fillColor: const Color(0xFFF5F7FA),
            labelStyle: const TextStyle(
                fontFamily: 'Cabin',
                fontSize: 16,
                fontWeight: FontWeight.w500,
                color: grey2),
            contentPadding:
                const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: const BorderSide(color: Color(0xFFE8ECF4)),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: const BorderSide(color: primary, width: 1.5),
            ),
          ),
          style: const TextStyle(
              fontSize: 15, fontWeight: FontWeight.w600, color: Colors.black),
          borderRadius: BorderRadius.circular(12),
          items: ['ذهاب فقط', 'ذهاب وعودة']
              .map((e) => DropdownMenuItem<String>(
                    value: e,
                    child: Row(
                      children: [
                        const Icon(Icons.directions_car,
                            color: primary, size: 20),
                        const SizedBox(width: 10),
                        Text(e, style: const TextStyle(fontSize: 14)),
                      ],
                    ),
                  ))
              .toList(),
          onChanged: (val) => setState(() {
            tripType = val!;
            if (tripType == 'ذهاب فقط') returnDate = null;
          }),
        ),
        const SizedBox(height: 20),
        InkWell(
          onTap: () => _selectDate(isReturn: false),
          child: InputDecorator(
            decoration: InputDecoration(
              labelText: 'تاريخ الذهاب',
              filled: true,
              fillColor: const Color(0xFFF5F7FA),
              prefixIcon: const Icon(Icons.calendar_today, color: primary),
              labelStyle: const TextStyle(
                  fontSize: 16, fontWeight: FontWeight.w500, color: grey2),
              contentPadding:
                  const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
                borderSide: const BorderSide(color: primary, width: 1.5),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
                borderSide: const BorderSide(color: primary, width: 1.5),
              ),
            ),
            child: Text(
              goDate == null
                  ? 'اختر تاريخاً'
                  : "${goDate!.day.toString().padLeft(2, '0')} / ${goDate!.month.toString().padLeft(2, '0')} / ${goDate!.year}",
              style: const TextStyle(
                  fontSize: 15, fontWeight: FontWeight.normal, color: grey2),
            ),
          ),
        ),
        if (tripType == 'ذهاب وعودة') ...[
          const SizedBox(height: 16),
          InkWell(
            onTap: () => _selectDate(isReturn: true),
            child: InputDecorator(
              decoration: InputDecoration(
                labelText: 'تاريخ العودة',
                filled: true,
                fillColor: const Color(0xFFF5F7FA),
                prefixIcon: const Icon(Icons.calendar_today, color: primary),
                labelStyle: const TextStyle(
                    fontSize: 16, fontWeight: FontWeight.w500, color: grey2),
                contentPadding:
                    const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                  borderSide: const BorderSide(color: primary, width: 1.5),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                  borderSide: const BorderSide(color: Colors.white, width: 1.5),
                ),
              ),
              child: Text(
                returnDate == null
                    ? 'اختر تاريخاً'
                    : "${returnDate!.day.toString().padLeft(2, '0')} / ${returnDate!.month.toString().padLeft(2, '0')} / ${returnDate!.year}",
                style: const TextStyle(
                    fontSize: 15, fontWeight: FontWeight.normal, color: grey2),
              ),
            ),
          ),
        ],
        const SizedBox(height: 16),
        Align(
          alignment: Alignment.centerRight,
          child: const Text('نسبه الدفع:',
              style: TextStyle(
                  fontSize: 24, fontWeight: FontWeight.bold, color: primary)),
        ),
        Row(
          children: [
            Radio<bool>(
              value: true,
              groupValue: fullPayment,
              activeColor: primary,
              onChanged: (val) => setState(() => fullPayment = val!),
            ),
            const Text('دفع كامل (%100)',
                style: TextStyle(
                    fontSize: 16, fontWeight: FontWeight.w500, color: grey2)),
            Radio<bool>(
              value: false,
              groupValue: fullPayment,
              activeColor: primary,
              onChanged: (val) => setState(() => fullPayment = val!),
            ),
            const Text('دفع جزئي (%50)',
                style: TextStyle(
                    fontSize: 16, fontWeight: FontWeight.w500, color: grey2)),
          ],
        ),
        const SizedBox(height: 16),
        _priceRow('المبلغ الإجمالي', 'EGP 0.00'),
        _priceRow('المبلغ المطلوب دفعه', 'EGP 0.00'),
        const SizedBox(height: 16),
        Row(
          children: [
            Expanded(
              child: OutlinedButton.icon(
                icon: const Icon(Icons.calendar_today),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => MainScreen(),
                    ),
                  );
                },
                label: const Text('حجز لاحق'),
                style: OutlinedButton.styleFrom(
                  backgroundColor: grey3.withOpacity(0.3),
                  foregroundColor: grey2,
                  side: BorderSide.none,
                ),
              ),
            ),
            const SizedBox(width: 8),
            Expanded(
              child: ElevatedButton.icon(
                onPressed: () {
                  if (goDate == null) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        content: Text('من فضلك اختر تاريخ الذهاب قبل المتابعة'),
                        backgroundColor: grey2,
                      ),
                    );
                    return;
                  }

                  final booking = Booking(
                    car: widget.car,
                    tripType: tripType,
                    goDate: goDate!,
                    returnDate: returnDate,
                    fullPayment: fullPayment,
                  );
                  widget.onProceedToPayment(booking);
                },
                icon: const Icon(Icons.payment),
                label: const Text('الدفع الآن'),
                style: ElevatedButton.styleFrom(
                  backgroundColor: primary,
                  foregroundColor: Colors.white,
                  side: BorderSide.none,
                ),
              ),
            ),
          ],
        ),
        const SizedBox(height: 16),
      ],
    );
  }

  Widget _priceRow(String title, String price) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(price,
              style:
                  const TextStyle(fontWeight: FontWeight.bold, color: primary)),
          Text(title),
        ],
      ),
    );
  }
}
