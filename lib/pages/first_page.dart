import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:mitchtest/pages/home.dart';
import 'package:mitchtest/pages/lessons-page.dart';
import 'package:mitchtest/pages/profile-page.dart';

class FirstPage extends StatefulWidget {
  const FirstPage({super.key});

  @override
  State<FirstPage> createState() => _FirstPageState();
}

class _FirstPageState extends State<FirstPage> {
  int _selectedIndex = 0;

  final List<Widget> _pages = [
    LessonsPage(),
    Home(),
    ProfilePage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // Puedes cambiar el color de fondo para asegurarte de que el menú de navegación sea visible
      backgroundColor: Colors.white,
      body: _pages[_selectedIndex],
      bottomNavigationBar: Container(
        decoration: BoxDecoration(
          color: Color(0xff436170),
        ),
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 15.0, vertical: 10.0), // Ajusta el padding
          child: GNav(
            onTabChange: (int index) {
              setState(() {
                _selectedIndex = index;
              });
            },
            backgroundColor: Color(0xff436170), // Color del fondo del nav
            color: Color(0xffDDF2FD), // Color de los íconos
            activeColor: Color(0xffBFCED6).withOpacity(0.7), // Color del botón activo
            tabBackgroundColor: Color(0xff738D9B), // Color del fondo detrás de los íconos
            gap: 8,
            padding: EdgeInsets.all(12), // Ajusta el padding interno
            tabs: [
              GButton(
                icon: Icons.checklist,
                text: 'Lessons',
              ),
              GButton(
                icon: Icons.home,
                text: 'Home',
              ),
              GButton(
                icon: Icons.view_day,
                text: 'Tracking',
              ),
            ],
          ),
        ),
      ),
    );
  }
}
