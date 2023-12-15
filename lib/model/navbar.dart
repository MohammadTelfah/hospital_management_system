import 'package:flutter/material.dart';

import '../emergency_screen.dart';
import '../home_screen.dart';
import '../settings_screen.dart';

class BottomNavigationBarWidget extends StatefulWidget {
  final int currentIndex;

  const BottomNavigationBarWidget({super.key, this.currentIndex = 0});

  @override
  // ignore: library_private_types_in_public_api
  _BottomNavigationBarWidgetState createState() =>
      _BottomNavigationBarWidgetState();
}

class _BottomNavigationBarWidgetState extends State<BottomNavigationBarWidget> {
  void _onItemTapped(int index) {
    if (index == widget.currentIndex) {
      return;
    }

    switch (index) {
      case 0:
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => const HomeScreen()),
        );
        break;
      case 1:
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) =>  const EmergencyScreen()),
        );
        break;
      case 2:
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => const SettingsScreen()),
        );
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      items: const <BottomNavigationBarItem>[
        BottomNavigationBarItem(
          icon: Icon(Icons.home),
          label: 'Home',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.emergency_outlined),
          label: 'Emergencey',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.settings),
          label: 'Settings',
        ),
      ],
      unselectedItemColor: const Color.fromARGB(255, 171, 150, 222),
      currentIndex: widget.currentIndex,
      selectedItemColor: const Color.fromARGB(255, 77, 30, 233),
      onTap: _onItemTapped,
    );
  }
}
