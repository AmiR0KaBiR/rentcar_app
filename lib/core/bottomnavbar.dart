import 'package:flutter/material.dart';
import 'package:lms_appf/pages/all%20cars%202/view.dart';
import 'package:lms_appf/pages/all%20cars/view.dart';
import 'package:lms_appf/pages/login_page/IntroPage2.dart';

import '../pages/chat/view.dart';

import '../pages/profile/view.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int _index = 0;

  Widget body() {
    switch (_index) {
      case 0:
        return CarRentalHomePage();

      case 1:
        return AllCars2Page();

      case 2:
        return MessageScreen();

      case 3:
        return ProfilePage();

      default:
        return Container(
          color: Colors.white,
          width: double.infinity,
          height: double.infinity,
        );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: body(),
      bottomNavigationBar: BottomNavigationBar(
        unselectedItemColor: Colors.black,
        selectedItemColor: Colors.lime,
          showSelectedLabels: false,
          
          onTap: (value) {
            setState(() {
              _index = value;
            });
          },
          currentIndex: _index,
          items: [
            BottomNavigationBarItem(
                icon: Icon(_index == 0 ? Icons.home : Icons.home_outlined),
                label: 'Home'),
            BottomNavigationBarItem(
                icon: Icon(_index == 1 ? Icons.favorite : Icons.favorite_border_outlined),
                label: 'My Courses'),
            BottomNavigationBarItem(
                icon: Icon(_index == 2 ? Icons.mail : Icons.mail_outline),
                label: 'Inbox'),
            BottomNavigationBarItem(
                icon: Icon(_index == 3
                    ? Icons.person
                    : Icons.person_2_outlined),
                label: 'Transaction'),
          ]),
    );
  }
}
