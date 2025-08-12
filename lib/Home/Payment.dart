import 'package:Allen2/Constants/Color.dart';
import 'package:Allen2/Constants/Common.dart';
import 'package:Allen2/Home/BookingData.dart';
import 'package:Allen2/Home/NavBar.dart';
import 'package:Allen2/Models/CarModel.dart';
import 'package:flutter/material.dart';

class PaymentScreen extends StatefulWidget {
  final Booking booking;

  const PaymentScreen({super.key, required this.booking});

  @override
  State<PaymentScreen> createState() => _PaymentScreenState();
}

class _PaymentScreenState extends State<PaymentScreen>
    with SingleTickerProviderStateMixin {
  bool isWalletSelected = true;
  final phoneController = TextEditingController();
  final cardNumberController = TextEditingController();
  final expiryDateController = TextEditingController();
  final cvvController = TextEditingController();

  late AnimationController _animationController;
  late Animation<double> _fadeAnimation;

  @override
  void initState() {
    super.initState();

    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 500),
    );

    _fadeAnimation = Tween<double>(begin: 0, end: 1).animate(
      CurvedAnimation(parent: _animationController, curve: Curves.easeIn),
    );

    _animationController.forward();
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  void _confirmPayment(VoidCallback onConfirm) {
    showDialog(
      context: context,
      builder: (ctx) => AlertDialog(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        backgroundColor: Colors.white,
        title: Text("تأكيد الدفع"),
        content: Text("هل أنت متأكد أنك تريد متابعة عملية الدفع؟"),
        actions: [
          TextButton(
            child: Text("إلغاء", style: TextStyle(color: primary)),
            onPressed: () => Navigator.pop(ctx),
          ),
          ElevatedButton(
            child: Text("تأكيد", style: TextStyle(color: Colors.white)),
            style: ElevatedButton.styleFrom(backgroundColor: primary),
            onPressed: () {
              Navigator.pop(ctx);
              onConfirm();
            },
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final width = size.width;
    final height = size.height;

    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          padding: EdgeInsets.symmetric(
              horizontal: width * 0.06, vertical: height * 0.03),
          child: FadeTransition(
            opacity: _fadeAnimation,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  width: width * 0.25,
                  height: width * 0.25,
                  margin: EdgeInsets.only(bottom: height * 0.02),
                  decoration: const BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage("assets/img/Allens.png"),
                      fit: BoxFit.contain,
                    ),
                  ),
                ),
                Text(
                  "اختيار وسيلة الدفع",
                  style: TextStyle(
                    fontSize: width * 0.06,
                    fontWeight: FontWeight.bold,
                    color: primary,
                  ),
                ),
                SizedBox(height: height * 0.025),
                Row(
                  children: [
                    _buildPaymentOption(
                      icon: Icons.account_balance_wallet,
                      label: 'المحفظة',
                      selected: isWalletSelected,
                      onTap: () {
                        setState(() {
                          isWalletSelected = true;
                          _animationController.forward(from: 0);
                        });
                      },
                    ),
                    SizedBox(width: width * 0.04),
                    _buildPaymentOption(
                      icon: Icons.credit_card,
                      label: 'كارت',
                      selected: !isWalletSelected,
                      onTap: () {
                        setState(() {
                          isWalletSelected = false;
                          _animationController.forward(from: 0);
                        });
                      },
                    ),
                  ],
                ),
                SizedBox(height: height * 0.03),
                isWalletSelected
                    ? _buildWalletSection(width, height)
                    : _buildCardSection(width, height),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildPaymentOption({
    required IconData icon,
    required String label,
    required bool selected,
    required VoidCallback onTap,
  }) {
    return Expanded(
      child: GestureDetector(
        onTap: onTap,
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 300),
          padding: const EdgeInsets.symmetric(vertical: 16),
          decoration: BoxDecoration(
            color: selected ? primary.withOpacity(0.1) : Colors.grey.shade100,
            border:
                Border.all(color: selected ? primary : Colors.grey.shade300),
            borderRadius: BorderRadius.circular(12),
          ),
          child: Column(
            children: [
              Icon(icon, color: selected ? primary : grey2, size: 28),
              const SizedBox(height: 6),
              Text(
                label,
                style: TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.w600,
                  color: selected ? primary : grey2,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildWalletSection(double width, double height) {
    return Column(
      children: [
        const Text("ادفع عبر رسالة قصيرة برقم محفظتك",
            style: TextStyle(fontWeight: FontWeight.bold)),
        const SizedBox(height: 8),
        const Text(
          "ادخل رقم هاتفك لاستلام رسالة بها رابط الدفع",
          textAlign: TextAlign.center,
          style: TextStyle(fontSize: 14),
        ),
        const SizedBox(height: 16),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: TextFormField(
            controller: phoneController,
            keyboardType: TextInputType.phone,
            maxLength: 11,
            decoration: InputDecoration(
              counterText: "",
              labelText: "رقم الهاتف",
              labelStyle: TextStyle(color: grey2),
              prefixIcon: Icon(Icons.phone, color: grey3),
              contentPadding:
                  const EdgeInsets.symmetric(vertical: 16, horizontal: 12),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: const BorderSide(color: grey2),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: const BorderSide(color: primary),
              ),
            ),
          ),
        ),
        const SizedBox(height: 40),
        _buildPayButton(),
      ],
    );
  }

  Widget _buildCardSection(double width, double height) {
    return Column(
      children: [
        const Text("ادفع باستخدام كارت الدفع الخاص بك",
            style: TextStyle(fontWeight: FontWeight.bold)),
        const SizedBox(height: 16),
        TextFormFieldWidget(
          keyboardType: TextInputType.number,
          controller: cardNumberController,
          labelText: "رقم الكارت",
          labelColor: grey2,
          prefixIcon: Icons.credit_card,
          textColor: Colors.black,
          contentPadding: EdgeInsets.symmetric(
              vertical: height * 0.02, horizontal: width * 0.03),
        ),
        const SizedBox(height: 16),
        Row(
          children: [
            Expanded(
              child: TextFormFieldWidget(
                keyboardType: TextInputType.datetime,
                controller: expiryDateController,
                labelText: "MM/YY",
                labelColor: grey2,
                prefixIcon: Icons.date_range,
                textColor: Colors.black,
                contentPadding: EdgeInsets.symmetric(
                    vertical: height * 0.02, horizontal: width * 0.03),
              ),
            ),
            const SizedBox(width: 12),
            Expanded(
              child: PasswordTextFormFieldWidget(
                controller: cvvController,
                labelText: "CVV",
                labelColor: grey2,
                prefixIcon: Icons.lock,
                suffixIcon: Icons.visibility,
                textColor: Colors.black,
              ),
            ),
          ],
        ),
        const SizedBox(height: 40),
        _buildPayButton(),
      ],
    );
  }

  Widget _buildPayButton() {
    return SizedBox(
      width: double.infinity,
      child: ElevatedButton.icon(
        onPressed: () => _confirmPayment(() {
          BookingData.allBookings.add(widget.booking);
          Navigator.pushAndRemoveUntil(
            context,
            MaterialPageRoute(
                builder: (context) => MainScreen(initialIndex: 1)),
            (route) => false,
          );
        }),
        icon: const Icon(Icons.payment),
        label: const Text('الدفع الآن'),
        style: ElevatedButton.styleFrom(
          backgroundColor: primary,
          foregroundColor: Colors.white,
          padding: const EdgeInsets.symmetric(vertical: 16),
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        ),
      ),
    );
  }
}
