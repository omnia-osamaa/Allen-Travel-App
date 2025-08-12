import 'package:flutter/material.dart';
import 'package:Allen2/Constants/Color.dart';

class CarFilterTabs extends StatelessWidget {
  final List<String> tabs;
  final int selectedTabIndex;
  final Function(int) onTabSelected;
  final double width;
  final double height;

  const CarFilterTabs({
    Key? key,
    required this.tabs,
    required this.selectedTabIndex,
    required this.onTabSelected,
    required this.width,
    required this.height,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height * 0.06,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: tabs.length,
        itemBuilder: (context, index) {
          final isSelected = selectedTabIndex == index;
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 6),
            child: GestureDetector(
              onTap: () => onTabSelected(index),
              child: Container(
                padding: EdgeInsets.symmetric(
                  horizontal: width * 0.04,
                  vertical: height * 0.012,
                ),
                decoration: BoxDecoration(
                  color: isSelected ? primary : Colors.white,
                  border: Border.all(color: primary),
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Center(
                  child: Text(
                    tabs[index],
                    style: TextStyle(
                      color: isSelected ? Colors.yellow : primary,
                      fontWeight: FontWeight.bold,
                      fontSize: width * 0.035,
                    ),
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}