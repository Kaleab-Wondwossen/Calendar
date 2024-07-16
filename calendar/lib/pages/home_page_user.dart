import 'package:calendar/pages/home_page.dart';
import 'package:calendar/services/AuthServices/auth_gate.dart';
import 'package:calendar/services/toggle/to_eth_or_gregorian.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import '../components/my_table_calendar.dart';
import 'weather_page.dart';

class HomePageUser extends StatefulWidget {
  final Function(int)? onIndexChanged;
  const HomePageUser({super.key, this.onIndexChanged});

  @override
  State<HomePageUser> createState() => _HomePageUserState();
}

Future<void> checkUser(BuildContext context) async {
  await FirebaseAuth.instance.signOut();
  Navigator.pushReplacement(
    context,
    MaterialPageRoute(builder: (context) {
      return StreamBuilder(
          stream: FirebaseAuth.instance.authStateChanges(),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return const HomePage();
            } else {
              return AuthGate();
            }
          });
    }),
  );
}

class _HomePageUserState extends State<HomePageUser> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  int index = 0;
  Color unselectedColor = Colors.black;
  Color selectedColor = const Color.fromARGB(255, 233, 176, 64);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        key: _scaffoldKey, // Assign the GlobalKey to the Scaffold
        appBar: AppBar(
          automaticallyImplyLeading: false,
          toolbarHeight: 100,
          backgroundColor: const Color.fromARGB(255, 233, 176, 64),
          title: const Text(
            'C A L E N D A R',
            style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
          ),
          actions: [
            GestureDetector(
              onTap: () {
                checkUser(context);
              },
              child: const Icon(Icons.login),
            ),
            Builder(
              // Wrap with Builder
              builder: (context) => IconButton(
                icon: const Icon(
                  Icons.more,
                  color: Colors.black,
                ),
                onPressed: () {
                  Scaffold.of(context)
                      .openDrawer(); // Use Scaffold.of(context) inside Builder
                },
              ),
            ),
          ],
        ),
        drawer: Drawer(
          child: ListView(
            padding: EdgeInsets.zero,
            children: <Widget>[
              const DrawerHeader(
                decoration: BoxDecoration(
                  color: Color.fromARGB(255, 233, 176, 64),
                ),
                child: Text(
                  'More from Calendar',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 24,
                  ),
                ),
              ),
              ListTile(
                leading: const Icon(Icons.sports_soccer),
                title: const Text('Premier League'),
                onTap: () {
                  // Navigate to profile page or perform action
                },
              ),
              ListTile(
                leading: const Icon(Icons.currency_exchange),
                title: const Text('Foreign Exchange Rate'),
                onTap: () {
                  // Navigate to notifications page or perform action
                  Navigator.pop(context);
                },
              ),
              ListTile(
                leading: const Icon(Icons.cloud_circle),
                title: const Text('Weather'),
                onTap: () {
                  // Navigate to help page or perform action
                  Navigator.pushReplacement(context,
                      MaterialPageRoute(builder: (context) => const WeatherPage()));
                },
              ),
              ListTile(
                leading: const Icon(Icons.map),
                title: const Text('Map'),
                onTap: () {
                  // Perform logout operation
                  Navigator.pop(context);
                },
              ),
            ],
          ),
        ),
        body: const SingleChildScrollView(
          child: Column(
            children: [
              MyCalendar(
                height: 80,
              ),
            ],
          ),
        ),
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: index,
          unselectedItemColor: unselectedColor,
          selectedItemColor: selectedColor,
          items: const [
            BottomNavigationBarItem(
              icon: Icon(Icons.calendar_month),
              label: 'Calendar',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.change_circle),
              label: 'Converter',
            ),
          ],
          onTap: (index) {
            if (widget.onIndexChanged != null) {
              widget.onIndexChanged!(index);
            }
            if (index != 0) {
              switch (index) {
                case 0:
                  if (index != 0) {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const HomePageUser()));
                  }
                  break;
                case 1:
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const EthOrGregorian()));

                  break;
              }
            }
          },
        ));
  }
}
