import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:notes_trove/Screens/activity_progress_screen/activity_progress_screen.dart';
import 'package:notes_trove/Screens/chat_bot_screen/chat_screen.dart';
import 'package:notes_trove/Screens/home_screen/home_screen.dart';
import 'package:notes_trove/utils/colors.dart';

List<Widget> pages = [
  HomeScreen(),
  const ChatScreen(),
  const StudyProgressScreen(),
];

class BottomNavBarScreen extends StatefulWidget {
  static const String routeName = '/nav-bar-screen';

  const BottomNavBarScreen({Key? key}) : super(key: key);

  @override
  State<BottomNavBarScreen> createState() => _BottomNavBarScreenState();
}

class _BottomNavBarScreenState extends State<BottomNavBarScreen> {
  int currentIndex = 0;

  void onTap(int index) {
    setState(() {
      currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: pages[currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.white,
        iconSize: 25,
        type: BottomNavigationBarType.shifting,
        onTap: onTap,
        currentIndex: currentIndex,
        selectedItemColor: MyColors().primaryColor,
        unselectedItemColor: Colors.black38,
        showSelectedLabels: true,
        showUnselectedLabels: true,
        elevation: 510,
        items: const [
          BottomNavigationBarItem(
            label: 'Home',
            icon: Icon(Icons.home_outlined),
          ),
          BottomNavigationBarItem(
            label: '  My AI',
            icon: Icon(
              FontAwesomeIcons.robot,
              size: 21,
            ),
          ),
          BottomNavigationBarItem(
            label: 'Activity',
            icon: Icon(
              Icons.show_chart,
              size: 22,
            ),
          ),
        ],
      ),
    );
  }
}
