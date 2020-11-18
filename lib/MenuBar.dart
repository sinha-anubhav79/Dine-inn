import 'package:dine_inn/Home.dart';
import 'package:dine_inn/ManageUser.dart';
import 'package:dine_inn/completeProfile.dart';
import 'package:dine_inn/discover.dart';
import 'package:dine_inn/displayPicture.dart';
import 'package:dine_inn/history.dart';
import 'package:dine_inn/About.dart';
import 'package:dine_inn/loginPage.dart';
import 'package:dine_inn/profile.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:provider/provider.dart';

class MenuBar extends StatefulWidget {
  final User user;

  const MenuBar({Key key, this.user}) : super(key: key);
  @override
  _MenuBarState createState() => _MenuBarState();
}

class _MenuBarState extends State<MenuBar> {
  @override
  Widget build(BuildContext context) {
    final User user = context.watch<User>();
    return Drawer(
      child: ListView(
        children: [
          UserAccountsDrawerHeader(
            currentAccountPicture: ClipOval(
              child: (user != null)?Image.network(user.photoURL, fit: BoxFit.cover,):Icon(Icons.person, color: Colors.black,)
            ),
            accountName: Text((user != null) ? widget.user.displayName:'display name'),
            accountEmail: Text((user != null) ? widget.user.email:'display email'),
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
                  MaterialPageRoute(builder: (context) => HomePage(user: user,)),
                );
              }
          ),
          ListTile(
              title: Text('Discover'),
              onTap: () {
                Navigator.of(context).pop();
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => RestaurantOptions(user: user,)),
                );
              }
          ),
          ListTile(
              title: Text('History'),
              onTap: () {
                Navigator.of(context).pop();
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => HistoryPage(user: user,)),
                );
              }
          ),
          ListTile(
              title: Text('Profile'),
              onTap: () {
                Navigator.of(context).pop();
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => ProfilePage(user: user,)),
                );
              }
          ),
          ListTile(
              title: Text('About'),
              onTap: () {
                Navigator.of(context).pop();
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => AboutPage(user: user,)),
                );
              }
          ),
          ListTile(
              title: Text('Logout'),
              onTap: () async{
                Navigator.of(context).pop();
                context.read<AuthenticationService>().logout().whenComplete(() {
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(builder: (context) => LoginPage()),
                  );
                });
                /**/
              }
          )
        ],
      ),
    );
  }
}