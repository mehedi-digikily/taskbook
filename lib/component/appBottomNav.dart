import 'package:flutter/material.dart';
import 'package:note/styel/style.dart';

BottomNavigationBar appBottomNav(int currentIndex, onItemTapped) {
  return BottomNavigationBar(
    currentIndex: currentIndex,
    showSelectedLabels: true,
    showUnselectedLabels: true,
    unselectedItemColor: colorLightGray,
    selectedItemColor: colorGreen,
    type: BottomNavigationBarType.fixed,
    onTap: onItemTapped,
    items: const [
      BottomNavigationBarItem(icon: Icon(Icons.list_alt), label: 'New Task'),
      BottomNavigationBarItem(icon: Icon(Icons.access_time_rounded), label: 'Progress'),
      BottomNavigationBarItem(icon: Icon(Icons.check_circle_outline), label: 'Complete'),
      BottomNavigationBarItem(icon: Icon(Icons.cancel_outlined), label: 'Canceled'),
    ],
  );
}