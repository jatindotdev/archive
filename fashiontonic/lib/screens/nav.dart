import 'package:fashiontonic/screens/favourites.dart';
import 'package:fashiontonic/screens/home.dart';
import 'package:fashiontonic/screens/notifications.dart';
import 'package:fashiontonic/screens/profile.dart';
import 'package:fashiontonic/state/controller.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Nav extends StatelessWidget {
  Nav({super.key});

  final Map<String, Widget> _screens = {
    "Home": const Home(),
    "Search": const Favourites(),
    "Notifications": const Notifications(),
    "Profile": const Profile(),
  };

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: _buildAppBar(),
      body: Obx(
        () => _screens.values.elementAt(Controller.to.selectedNavIndex),
      ),
      bottomNavigationBar: _buildBottomNavigationBar(),
    );
  }
}

Widget _buildBottomNavigationBar() {
  return Obx(
    () => NavigationBar(
      destinations: const [
        NavigationDestination(
          icon: Icon(CupertinoIcons.house),
          selectedIcon: Icon(CupertinoIcons.house_fill),
          label: "Home",
        ),
        NavigationDestination(
          icon: Icon(CupertinoIcons.heart),
          selectedIcon: Icon(CupertinoIcons.heart_fill),
          label: "Search",
        ),
        NavigationDestination(
          icon: Icon(CupertinoIcons.bell),
          selectedIcon: Icon(CupertinoIcons.bell_fill),
          label: "Notifications",
        ),
        NavigationDestination(
          icon: Icon(CupertinoIcons.person),
          selectedIcon: Icon(CupertinoIcons.person_fill),
          label: "Profile",
        ),
      ],
      labelBehavior: NavigationDestinationLabelBehavior.alwaysHide,
      shadowColor: Colors.black,
      elevation: 5,
      backgroundColor: Colors.white,
      surfaceTintColor: Colors.transparent,
      selectedIndex: Controller.to.selectedNavIndex,
      onDestinationSelected: (index) => Controller.to.selectedNavIndex = index,
    ),
  );
}

PreferredSizeWidget _buildAppBar() {
  return AppBar(
    surfaceTintColor: Colors.transparent,
    leading: IconButton(
      onPressed: () {},
      icon: const Icon(CupertinoIcons.line_horizontal_3_decrease),
      style: ButtonStyle(
        backgroundColor: MaterialStateProperty.all(Colors.black),
        foregroundColor: MaterialStateProperty.all(Colors.white),
        padding: const MaterialStatePropertyAll(EdgeInsets.all(10)),
      ),
    ),
    title: const Text(
      "Fashiontonic",
      style: TextStyle(
        fontWeight: FontWeight.w500,
      ),
    ),
    leadingWidth: 72,
    toolbarHeight: kToolbarHeight + 28,
    actions: [
      Padding(
        padding: const EdgeInsets.only(right: 16),
        child: IconButton(
          onPressed: () {
            Get.toNamed("/cart");
          },
          icon: const Icon(CupertinoIcons.bag),
          style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all(Colors.black),
            foregroundColor: MaterialStateProperty.all(Colors.white),
            padding: const MaterialStatePropertyAll(EdgeInsets.all(10)),
          ),
        ),
      ),
    ],
  );
}
