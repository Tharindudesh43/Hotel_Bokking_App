import 'package:flutter/material.dart';
import 'package:hotel_booking_app/screens/booking_screen.dart';
import 'package:hotel_booking_app/screens/discover_screen.dart';
import 'package:hotel_booking_app/screens/favourite_screen.dart';
import 'package:hotel_booking_app/screens/message_screen.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _screenIndex = 0;

  final List<Widget> _screens = const [
    DiscoverScreen(),
    FavouriteScreen(),
    BookingScreen(),
    MessageScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // This is the main content area
          Container(
            color: Colors.transparent, // Set background to transparent
            child: _screens[_screenIndex],
          ),
          // Bottom Navigation Bar
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: _buildBottomNavigationBar(),
          ),
        ],
      ),
    );
  }

  Widget _buildBottomNavigationBar() {
    return Padding(
      padding: const EdgeInsets.all(15.0),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(50),
          color: Colors.black, // Semi-transparent black
        ),
        height: 60,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: List.generate(_screens.length, (index) {
            return _bottomNavigationIcon(index);
          }),
        ),
      ),
    );
  }

  Widget _bottomNavigationIcon(int index) {
    final isSelected = _screenIndex == index;

    return InkWell(
      onTap: () {
        setState(() {
          _screenIndex = index;
        });
      },
      child: Column(
        children: [
          Icon(
            _getIconData(index),
            color: isSelected ? Colors.white : Colors.grey,
            size: isSelected ? 20 : 18,
          ),
          Text(
            _getIconText(index),
            style: TextStyle(color: isSelected ? Colors.white : Colors.grey),
          ),
        ],
      ),
    );
  }

  IconData _getIconData(int index) {
    switch (index) {
      case 0:
        return Icons.find_in_page;
      case 1:
        return Icons.favorite_border;
      case 2:
        return Icons.book_online;
      case 3:
        return Icons.message;
      default:
        return Icons.error; // Fallback icon
    }
  }

  String _getIconText(int index) {
    switch (index) {
      case 0:
        return "Discover";
      case 1:
        return "Favourites";
      case 2:
        return "Booking";
      case 3:
        return "Messages";
      default:
        return "";
    }
  }
}
