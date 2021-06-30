import 'package:flutter/material.dart';
import 'package:potatoes_test/app_constants/color.dart';

class CommonBottomNavigationBar extends StatelessWidget {
  final int currentIndex;
  final void Function(int) onChangeTab;

  const CommonBottomNavigationBar(
      {Key key, this.currentIndex, this.onChangeTab})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      currentIndex: currentIndex,
      selectedItemColor: Colors.white,
      backgroundColor: kPrimaryColor,
      unselectedItemColor: Colors.white.withOpacity(0.6),
      showUnselectedLabels: true,
      onTap: (index) => onChangeTab(index),
      items: [
        _bottomNavigationBarItem('Inicio', Icon(Icons.home)),
        _bottomNavigationBarItem(
            'Clasificacion', Icon(Icons.device_hub_rounded)),
        _bottomNavigationBarItem('Mi perfil', Icon(Icons.emoji_people_sharp)),
      ],
    );
  }

  BottomNavigationBarItem _bottomNavigationBarItem(String label, Widget icon) {
    return BottomNavigationBarItem(
      icon: icon,
      label: label,
    );
  }
}
