import 'package:dine_inn/loginPage.dart';
import 'package:dine_inn/Home.dart';
import 'package:dine_inn/discover.dart';
import 'package:dine_inn/history.dart';
import 'package:dine_inn/About.dart';
import 'package:dine_inn/profile.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MenuBar extends StatefulWidget {
  @override
  _MenuBarState createState() => _MenuBarState();
}

class _MenuBarState extends State<MenuBar> {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: [
          UserAccountsDrawerHeader(
            currentAccountPicture: CircleAvatar(
              backgroundColor: Colors.white,
              child: Icon(
                Icons.person,
                color: Colors.black,
              ),
            ),
            accountName: Text('Name of the user'),
            accountEmail: Text('someuser@domain.com'),
            decoration: BoxDecoration(
              color: Color(0xFFF2A22C),
            ),
          ),
          ListTile(
              title: Text('Home'),
              onTap: () {
                Navigator.of(context).pop();
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => HomePage()),
                );
              }
          ),
          ListTile(
              title: Text('Discover'),
              onTap: () {
                Navigator.of(context).pop();
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => RestaurantOptions()),
                );
              }
          ),
          ListTile(
              title: Text('History'),
              onTap: () {
                Navigator.of(context).pop();
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => HistoryPage()),
                );
              }
          ),
          ListTile(
              title: Text('Profile'),
              onTap: () {
                Navigator.of(context).pop();
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => ProfilePage()),
                );
              }
          ),
          ListTile(
              title: Text('About'),
              onTap: () {
                Navigator.of(context).pop();
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => AboutPage()),
                );
              }
          ),
          ListTile(
              title: Text('Logout'),
              onTap: () {
                Navigator.of(context).pop();
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => LoginPage()),
                );
              }
          )
        ],
      ),
    );
  }
}