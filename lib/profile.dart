import 'package:dine_inn/MenuBar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ProfilePage extends StatefulWidget {
  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFFF2A22C),
      ),
      drawer: MenuBar(),
      body: Container(
        padding: EdgeInsets.only(left: 25.0, top: 25.0, right: 25.0),
        child: Column(
          children: [
            Container(
              child: Text(
                'Profile',
                style: TextStyle(
                  fontSize: 50.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            SizedBox(height: 40.0),
            Container(
              child: Text('This is the profile page where you will find your personal information'),
            )
          ],
        ),
      ),
    );;
  }
}
