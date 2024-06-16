import 'package:flutter/material.dart';
import 'cart.dart';
import 'home_pg.dart';

class BottomNavBar extends StatelessWidget {
  final int currentIndex;
  final Function(int) onTap;

  const BottomNavBar({
    Key? key,
    required this.currentIndex,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.yellow, // Set yellow background color here
        border: Border(
          top: BorderSide(
            color: Colors.grey[300]!,
            width: 2.0,
          ),
        ),
      ),
      child: BottomNavigationBar(
        backgroundColor: Colors.yellow, // Set yellow background color for items to appear correctly
        selectedItemColor: Colors.black,
        unselectedItemColor: Colors.grey, // Color for unselected items
        currentIndex: currentIndex,
        onTap: onTap,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.message),
            label: 'Messages',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.shopping_cart),
            label: 'Cart',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Profile',
          ),
        ],
      ),
    );
  }
}
