import 'package:flutter/material.dart';
import '../utils/app_theme.dart';

class AppDrawer extends StatelessWidget {
  final int selectedIndex;
  final Function(int) onItemTapped;

  const AppDrawer({
    super.key,
    required this.selectedIndex,
    required this.onItemTapped,
  });

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          _buildDrawerHeader(),
          _buildDrawerItem(
            icon: Icons.home,
            title: 'Home',
            index: 0,
          ),
          _buildDrawerItem(
            icon: Icons.info,
            title: 'About',
            index: 1,
          ),
          _buildDrawerItem(
            icon: Icons.contact_phone,
            title: 'Contact Us',
            index: 2,
          ),
        ],
      ),
    );
  }

  Widget _buildDrawerHeader() {
    return Container(
      height: 200,
      width: double.infinity,
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [
            AppTheme.primaryColor,
            AppTheme.accentColor,
          ],
        ),
      ),
      child: const Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          CircleAvatar(
            radius: 40,
            backgroundColor: Colors.white,
            child: Icon(
              Icons.flutter_dash,
              size: 40,
              color: AppTheme.primaryColor,
            ),
          ),
          SizedBox(height: 16),
          Text(
            'Three Modern Systems',
            style: TextStyle(
              color: Colors.white,
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildDrawerItem({
    required IconData icon,
    required String title,
    required int index,
  }) {
    final isSelected = selectedIndex == index;
    
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        color: isSelected ? AppTheme.primaryColor.withOpacity(0.1) : null,
      ),
      child: ListTile(
        leading: Icon(
          icon,
          color: isSelected ? AppTheme.primaryColor : AppTheme.textSecondary,
        ),
        title: Text(
          title,
          style: TextStyle(
            color: isSelected ? AppTheme.primaryColor : AppTheme.textPrimary,
            fontWeight: isSelected ? FontWeight.w600 : FontWeight.normal,
          ),
        ),
        onTap: () => onItemTapped(index),
      ),
    );
  }
}