import 'package:flutter/material.dart';
import 'package:Allen2/Constants/Color.dart';

class HomeAppBar extends StatelessWidget implements PreferredSizeWidget {
  final VoidCallback? onMenuPressed;

  const HomeAppBar({Key? key, this.onMenuPressed}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    
    return AppBar(
      backgroundColor: primary,
      elevation: 0,
      iconTheme: const IconThemeData(color: Colors.white),
      automaticallyImplyLeading: true,
      leading: IconButton(
        icon: const Icon(Icons.menu),
        onPressed: onMenuPressed,
      ),
      title: Align(
        alignment: Alignment.topLeft,
        child: Image.asset(
          "assets/img/Allens.png",
          height: height * 0.05,
        ),
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}