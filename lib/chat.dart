import 'package:flutter/material.dart';
import 'package:flutter/services.dart' show rootBundle;
import 'cart.dart';
import 'home_pg.dart';
import 'bottomnavbar.dart';
import 'profile.dart';// Import the shared BottomNavBar widget

class ChatPage extends StatelessWidget {
  const ChatPage({Key? key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            // Navigate back to the previous page
            Navigator.pop(context);
          },
        ),
        title: const Text(
          'Chat',
          style: TextStyle(
            fontSize: 24.0,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
      ),
      body: Column(
        children: [
          _buildChatSection('images/logo1.png', 'Shoe World', 'Hello! How can I help you?', DateTime.now()),
          _buildChatSection('images/logo2.png', 'Fashion Store', 'Sure, we have that product in stock.', DateTime.now()),
          // Add more chat sections as needed
        ],
      ),
      bottomNavigationBar: BottomNavBar(
        currentIndex: 1, // Set the current index to 1 for 'Messages'
        onTap: (index) {
          _onTabTapped(context, index);
        },
      ),
    );
  }

  Widget _buildChatSection(String shopLogo, String shopName, String message, DateTime dateTime) {
    return Container(
      margin: const EdgeInsets.all(16.0),
      padding: const EdgeInsets.all(16.0),
      decoration: BoxDecoration(
        color: Colors.grey[600], // Background color of the container
        borderRadius: BorderRadius.circular(10.0),
      ),
      child: Row(
        children: [
          // Left side with shop logo
          Container(
            width: 50.0,
            height: 50.0,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage(shopLogo),
                fit: BoxFit.cover,
              ),
            ),
          ),
          const SizedBox(width: 16.0),
          // Right side with shop name, message, date, and time
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  shopName,
                  style: const TextStyle(
                    fontSize: 18.0,
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  message,
                  style: const TextStyle(
                      fontSize: 16.0,
                      color: Colors.white
                  ),
                ),
                Text(
                  _formatDateTime(dateTime),
                  style: const TextStyle(
                    fontSize: 14.0,
                    color: Colors.white,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  String _formatDateTime(DateTime dateTime) {
    return "${dateTime.day}/${dateTime.month}/${dateTime.year} ${dateTime.hour}:${dateTime.minute}";
  }

  void _onTabTapped(BuildContext context, int index) {
    if (index == 0) {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => const HomePage()),
      );
    } else if (index == 2) {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => const Cart()),
      );
    } else if (index == 3) {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => const ProfilePage()),
      );
    }
  }
}
