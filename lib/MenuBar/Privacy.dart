import 'package:Allen2/Constants/Color.dart';
import 'package:Allen2/Models/MenueBarModel.dart';
import 'package:flutter/material.dart';


class PrivacyView extends StatefulWidget {
  const PrivacyView({super.key});

  @override
  State<PrivacyView> createState() => _PrivacyViewState();
}

class _PrivacyViewState extends State<PrivacyView> {
  bool _isAgreed = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: primary,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: Text(
          "Privacy Policy",
          style: TextStyle(color: Colors.white),
        ),
      ),
      backgroundColor: bg,
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(
                height: 10,
              ),
              ListView.builder(
                physics: const NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                padding: EdgeInsets.zero,
                itemCount: aboutTextArr.length,
                itemBuilder: ((context, index) {
                  var txt = aboutTextArr[index] as String? ?? "";
                  return Container(
                    padding: const EdgeInsets.symmetric(
                        vertical: 15, horizontal: 25),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          margin: const EdgeInsets.only(top: 4),
                          width: 6,
                          height: 6,
                          decoration: BoxDecoration(
                              color: primary,
                              borderRadius: BorderRadius.circular(4)),
                        ),
                        const SizedBox(
                          width: 15,
                        ),
                        Expanded(
                          child: Text(
                            txt,
                            style: TextStyle(color: primary, fontSize: 14),
                          ),
                        ),
                      ],
                    ),
                  );
                }),
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 25, vertical: 20),
                child: Row(
                  children: [
                    Checkbox(
                      value: _isAgreed,
                      activeColor: _isAgreed ? primary : Colors.grey,
                      onChanged: (bool? value) {
                        setState(() {
                          _isAgreed = value ?? false;
                        });
                      },
                    ),
                    const Text(
                      'I Agree to the Terms & Privacy Policy',
                      style: TextStyle(fontSize: 12),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
