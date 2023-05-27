import 'package:flutter/material.dart';
import 'package:ilgohanjul/const/colors.dart';
import 'package:ilgohanjul/screen/calendar_screen.dart';
import 'package:ilgohanjul/screen/book_list_screen.dart';
import 'package:ilgohanjul/screen/signin.dart';
import 'package:ilgohanjul/screen/test.dart';
class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _currentIndex = 0;
  List<BottomNavigationBarItem> _screens = [
    BottomNavigationBarItem(
      label: 'Main',
      icon: Icon(Icons.home)
    ),
    BottomNavigationBarItem(
      label: 'Calendar',
      icon: Icon(Icons.calendar_month)
    ),
    BottomNavigationBarItem(
      label: 'BookIRead',
      icon: Icon(Icons.book)
    ),
    BottomNavigationBarItem(
      label: 'SignIn',
      icon: Icon(Icons.person)
    ),
  ];

  List pages = [
    SignInScreen(),
    CalendarScreen(),
    BookListScreen(),
    BookCard(),
  ];
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        showSelectedLabels: false,
        showUnselectedLabels: false,
        unselectedFontSize: 20,
        selectedFontSize: 20,
        unselectedItemColor: Colors.grey,
        type: BottomNavigationBarType.fixed,
        backgroundColor: PRIMARY_COLOR,
        selectedItemColor: Colors.white,
        currentIndex: _currentIndex,
        onTap: (int index) {
          setState(() {
            _currentIndex = index;
          });
        },
        items: _screens),
      body: pages[_currentIndex],
    );
  }
}
