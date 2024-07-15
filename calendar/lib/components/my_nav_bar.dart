import 'package:calendar/pages/ai_page.dart';
import 'package:calendar/pages/inbox_page.dart';
import 'package:calendar/pages/profile_page.dart';
import 'package:flutter/material.dart';

import '../pages/home_page.dart';
import '../pages/events_page.dart';

class MyNavBar extends StatefulWidget {
  final int index;
  final Function(int)? onIndexChanged;

  const MyNavBar({super.key, required this.index, this.onIndexChanged});

  @override
  State<MyNavBar> createState() => _MyNavBarState();
}

class _MyNavBarState extends State<MyNavBar> {
  Widget build(BuildContext context) {
    Color unselectedColor = Colors.black;
    Color selectedColor = const Color.fromARGB(255, 233, 176, 64);

    return BottomNavigationBar(
      currentIndex: widget.index,
      unselectedItemColor: unselectedColor,
      selectedItemColor: selectedColor,
      items: const [
        BottomNavigationBarItem(
          icon: Icon(Icons.home_rounded),
          label: 'Home',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.event),
          label: 'Events',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.all_inbox),
          label: 'Inbox',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.computer),
          label: "AI",
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.person_2_rounded),
          label: "Profile",
        ),
      ],
      onTap: (index) {
        if (widget.onIndexChanged != null) {
          widget.onIndexChanged!(index);
        }
        switch (index) {
          case 0:
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => const HomePage()));
            break;
          case 1:
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => const Events()));
            break;
          case 2:
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => const ChatPage()));
            break;
          case 3:
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => const ChatScreen()));
            break;
          case 4:
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => const Profile()));
            break;
        }
      },
    );
  }
}
