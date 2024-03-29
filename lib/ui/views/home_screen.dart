import 'package:flutter/material.dart';
import 'package:simple_qr_management_flutter/ui/views/qr_generate_screen.dart';
import 'package:simple_qr_management_flutter/ui/views/qr_list_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<StatefulWidget> createState() => HomeScreenState();
}

class HomeScreenState extends State<HomeScreen> {
  int _selectedIndex = 0;

  static const List<Widget> _screens = [
    QRListScreen(),
    QRGenerateScreen(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: _selectedIndex,
          onTap: _onItemTapped,
          items: const [
            BottomNavigationBarItem(
              icon: Icon(Icons.list_alt),
              label: 'QR一覧',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.create),
              label: 'QR生成',
            ),
          ],
        ),
        body: _screens[_selectedIndex]);
  }
}
