import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:potatoes_test/app_widgets/bottom_navigation_bar.dart';
import 'package:potatoes_test/clasification/screens/screen.dart';
import 'package:potatoes_test/home/screens/screen.dart';
import 'package:potatoes_test/profile/screens/screen.dart';

class TabsScreen extends StatefulWidget {
  TabsScreen({Key key}) : super(key: key);

  @override
  _TabsScreenState createState() => _TabsScreenState();
}

class _TabsScreenState extends State<TabsScreen> {
  final _selectedTab = 0.obs;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Obx(() => IndexedStack(
            index: _selectedTab.value,
            children: [
              const HomeScreen(),
              const ClasificationScreen(),
              const ProfileScreen()
            ],
          )),
      bottomNavigationBar: Obx(() => CommonBottomNavigationBar(
            currentIndex: _selectedTab.value,
            onChangeTab: (index) => _selectedTab.value = index,
          )),
    );
  }
}
