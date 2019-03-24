import 'package:flutter/material.dart';

class CustomBottomNavigationBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
        elevation: 10.0,
        currentIndex: 0,
        type: BottomNavigationBarType.fixed,
        items: [
          BottomNavigationBarItem(
              icon: Icon(Icons.home, color: Colors.orange),
              title: Text("Home", style: TextStyle(color: Colors.orange))),
          BottomNavigationBarItem(
              icon: Icon(Icons.favorite, color: Colors.black),
              title: Text("Wishlist", style: TextStyle(color: Colors.black))),
          BottomNavigationBarItem(
              icon: Icon(Icons.hotel, color: Colors.black),
              title: Text("Hotels", style: TextStyle(color: Colors.black))),
          BottomNavigationBarItem(
              icon: Icon(Icons.flight_takeoff, color: Colors.black),
              title: Text("Flights", style: TextStyle(color: Colors.black))),
          BottomNavigationBarItem(
              icon: Icon(Icons.book, color: Colors.black),
              title: Text("Bookmarks", style: TextStyle(color: Colors.black)))
        ]);
  }
}
