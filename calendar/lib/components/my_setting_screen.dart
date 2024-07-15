import 'package:flutter/material.dart';
import '../pages/profile_page.dart';

class SettingScreen extends StatelessWidget {
  const SettingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
            onPressed: () {
              Navigator.of(context).push(
                  MaterialPageRoute(builder: (context) => const Profile()));
            },
            icon: const Icon(Icons.arrow_back_ios)),
        title: const Text(
          "Settings",
          style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(
              height: 10,
            ),
            //Account
            const Padding(
              padding: EdgeInsets.all(8.0),
              child: Text("Account",
                  style: TextStyle(fontSize: 23, fontWeight: FontWeight.bold)),
            ),
            GestureDetector(
              onTap: () {
                // Navigator.pushReplacement(context, route)
              },
              child: Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: Colors.grey[200]),
                child: const ListTile(
                  leading: CircleAvatar(
                    backgroundColor: Color.fromARGB(255, 233, 176, 64),
                    // backgroundImage: NetworkImage('url'),
                  ),
                  title: Text('Mark Adam',
                      style: TextStyle(fontWeight: FontWeight.bold)),
                  subtitle: Text('Sunny_Koelpin45@hotmail.com'),
                  trailing: Icon(Icons.arrow_forward_ios),
                ),
              ),
            ),
            //Line Break
            const SizedBox(
              height: 16,
            ),
            const Divider(
              color: Colors.black45,
            ),
            const Padding(
              padding: EdgeInsets.all(8.0),
              child: Text('Setting',
                  style: TextStyle(fontSize: 23, fontWeight: FontWeight.bold)),
            ),
            const SizedBox(
              height: 5,
            ),

            //Notification
            GestureDetector(
              onTap: () {
                // Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => ,))
              },
              child: Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.grey[200]),
                child: const ListTile(
                  leading: Icon(
                    Icons.notifications,
                    size: 40,
                  ),
                  title: Text('Notification',
                      style: TextStyle(fontWeight: FontWeight.bold)),
                  trailing: Icon(Icons.arrow_forward_ios),
                ),
              ),
            ),
            const SizedBox(
              height: 16,
            ),
            //Language
            GestureDetector(
              onTap: () {
                // Navigator.pushReplacement(context, route)
              },
              child: Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.grey[200]),
                child: const ListTile(
                  leading: Icon(
                    Icons.language,
                    size: 40,
                  ),
                  title: Text('Language',
                      style: TextStyle(fontWeight: FontWeight.bold)),
                  trailing: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text('English'),
                      SizedBox(
                        width: 5,
                      ),
                      Icon(Icons.arrow_forward_ios),
                    ],
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 16,
            ),
            //Privacy
            GestureDetector(
              onTap: () {
                // Navigator.pushReplacement(context, route)
              },
              child: Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.grey[200]),
                child: const ListTile(
                  leading: Icon(
                    Icons.privacy_tip,
                    size: 40,
                  ),
                  title: Text('Privacy',
                      style: TextStyle(fontWeight: FontWeight.bold)),
                  trailing: Icon(Icons.arrow_forward_ios),
                ),
              ),
            ),
            const SizedBox(
              height: 16,
            ),
            //Help Center
            GestureDetector(
              onTap: () {
                // Navigator.pushReplacement(context, route)
              },
              child: Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.grey[200]),
                child: const ListTile(
                  leading: Icon(
                    Icons.help_center,
                    size: 40,
                  ),
                  title: Text('Help Center',
                      style: TextStyle(fontWeight: FontWeight.bold)),
                  trailing: Icon(Icons.arrow_forward_ios),
                ),
              ),
            ),
            const SizedBox(
              height: 16,
            ),
            //About us
            GestureDetector(
              onTap: () {
                // Navigator.pushReplacement(context, route)
              },
              child: Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.grey[200]),
                child: const ListTile(
                  leading: Icon(
                    Icons.info_outline,
                    size: 40,
                  ),
                  title: Text("About us",
                      style: TextStyle(fontWeight: FontWeight.bold)),
                  trailing: Icon(Icons.arrow_forward_ios),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
