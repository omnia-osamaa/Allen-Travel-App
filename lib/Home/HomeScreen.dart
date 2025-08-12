import 'package:Allen2/Home/HomeDetails/CarFilterTabs.dart';
import 'package:Allen2/Home/HomeDetails/CarList.dart';
import 'package:Allen2/Home/HomeDetails/HomeAppBar.dart';
import 'package:Allen2/Home/HomeDetails/HomeDrawer.dart';
import 'package:Allen2/Home/HomeDetails/WelcomeBanner.dart';
import 'package:flutter/material.dart';
import 'package:Allen2/Constants/Color.dart';
import 'package:Allen2/Models/CarModel.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int selectedTabIndex = 0;
  List<Car> filteredCars = [];
  String searchQuery = "";
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    filteredCars = cars;
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final width = size.width;
    final height = size.height;
    final isTablet = width > 600;

    final selectedTab = tabs[selectedTabIndex];
    final shownCars = (selectedTab == "الكل"
            ? filteredCars
            : filteredCars.where((car) => car.year == selectedTab).toList())
        .where((car) =>
            car.name.contains(searchQuery) ||
            car.model.contains(searchQuery) ||
            car.type.contains(searchQuery))
        .toList();

    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        key: _scaffoldKey,
        backgroundColor: Colors.white,
        drawer: HomeDrawer(width: width, height: height),
        appBar: HomeAppBar(
          onMenuPressed: () => _scaffoldKey.currentState?.openDrawer(),
        ),
        body: SingleChildScrollView(
          child: SafeArea(
            child: Padding(
              padding: EdgeInsets.all(width * 0.05),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: height * 0.02),
                  WelcomeBanner(width: width, height: height),
                  SizedBox(height: height * 0.02),
                  TextField(
                    decoration: InputDecoration(
                      hintText: 'ابحث عن سيارة...',
                      prefixIcon: const Icon(Icons.search, color: primary),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                        borderSide: const BorderSide(color: primary, width: 1),
                      ),
                    ),
                    onChanged: (value) => setState(() => searchQuery = value),
                  ),
                  SizedBox(height: height * 0.02),
                  Text(
                    "السيارات الاكثر ايجارا",
                    style: TextStyle(
                      fontSize: width * 0.055,
                      fontWeight: FontWeight.bold,
                      color: primary,
                    ),
                  ),
                  SizedBox(height: height * 0.02),
                  CarFilterTabs(
                    tabs: tabs,
                    selectedTabIndex: selectedTabIndex,
                    onTabSelected: (index) => setState(() {
                      selectedTabIndex = index;
                      filteredCars = tabs[index] == "الكل"
                          ? cars
                          : cars
                              .where((car) => car.year == tabs[index])
                              .toList();
                    }),
                    width: width,
                    height: height,
                  ),
                  SizedBox(height: height * 0.02),
                  if (shownCars.isNotEmpty)
                    CarList(
                      cars: shownCars,
                      isTablet: isTablet,
                      width: width,
                      height: height,
                    )
                  else
                    Padding(
                      padding: EdgeInsets.only(top: height * 0.02),
                      child: Text(
                        "لا توجد سيارات مطابقة",
                        style: TextStyle(
                          color: grey2,
                          fontSize: width * 0.04,
                        ),
                      ),
                    ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
