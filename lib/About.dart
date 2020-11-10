import 'package:dine_inn/MenuBar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AboutPage extends StatefulWidget {
  @override
  _AboutPageState createState() => _AboutPageState();
}

class _AboutPageState extends State<AboutPage> {
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
                'About us',
                style: TextStyle(
                  fontSize: 50.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            SizedBox(height: 40.0),
            Container(
              child: Text("It is a long established fact that a reader will be distracted "
                  "by the readable content of a page when looking at its layout. The point "
                  "of using Lorem Ipsum is that it has a more-or-less normal distribution "
                  "of letters, as opposed to using 'Content here, content here', making "
                  "it look like readable English. Many desktop publishing packages and web "
                  "page editors now use Lorem Ipsum as their default model text, and a "
                  "search for 'lorem ipsum' will uncover many web sites still in their infancy."
                  " Various versions have evolved over the years, sometimes by accident, "
                  "sometimes on purpose (injected humour and the like)."),
            ),
          ],
        ),
      ),
    );
  }
}
