import 'package:flutter/material.dart';
import '../fragments/home_fragment.dart';
import '../fragments/about_fragment.dart';
import '../fragments/contact_fragment.dart';
import '../widgets/app_drawer.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int _selectedIndex = 0;
  
  final List<Widget> _fragments = [
    const HomeFragment(),
    const AboutFragment(),
    const ContactFragment(),
  ];

  final List<String> _titles = [
    'Home',
    'About',
    'Contact Us',
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
    Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(_titles[_selectedIndex]),
      ),
      drawer: AppDrawer(
        selectedIndex: _selectedIndex,
        onItemTapped: _onItemTapped,
      ),
      body: _fragments[_selectedIndex],
    );
  }
}