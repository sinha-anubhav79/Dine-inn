import 'package:dine_inn/MenuBar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:provider/provider.dart';

class AboutPage extends StatefulWidget {
  final User user;

  const AboutPage({Key key, this.user}) : super(key: key);
  @override
  _AboutPageState createState() => _AboutPageState();
}

class _AboutPageState extends State<AboutPage> {
  @override
  Widget build(BuildContext context) {
    final User user = context.watch<User>();
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFFF2A22C),
      ),
      drawer: MenuBar(user: user,),
      body: Container(
        padding: EdgeInsets.only(left: 25.0, top: 25.0, right: 25.0),
        child: Column(
          children: [
            Container(
              child: Text(
                'About us',
                style: TextStyle(
                  fontSize: 50.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            SizedBox(height: 40.0),
            Container(
              child: Image.asset('assets/images/dine-inn.png'),
            ),
            Container(
              child: Text("Worried about crowding in restaurants? Dine-inn is here to solve "
                  "your problem. Book seats in a restaurant for the time that you are free and "
                  "leave for your dinner at your comfortable time without worrying about "
                  "the availability of seats when you reach their. No more waiting to get "
                  "a free table at your favourite restaurant. "
              ),
            ),
          ],
        ),
      ),
    );
  }
}
