import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class RestaurantOptions extends StatefulWidget {
  @override
  _RestaurantOptionsState createState() => new _RestaurantOptionsState();
}

class _RestaurantOptionsState extends State<RestaurantOptions> {
  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();
  void _openDrawer() {
    scaffoldKey.currentState.openDrawer();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        //title: Text('Dine-inn'),
        backgroundColor: Color(0xFFF2A22C),
      ),
      key: scaffoldKey,
      drawer: MenuBar(),
      body: Container(
        child: Column(
          children: <Widget>[
            Container(
              padding: EdgeInsets.only(left: 25.0, top: 5.0, right: 25.0),
              child: Column(
                children: <Widget>[
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Text(
                        "Discover",
                        style: TextStyle(
                          fontSize: 50.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      CircleAvatar(
                        backgroundColor: Color(0xFFF2A22C),
                        child: InkWell(
                          onTap: () {
                            //menuBar()
                            //scaffoldKey.currentState.openEndDrawer();
                            //Scaffold.of(context).openEndDrawer();
                            _openDrawer();
                          },
                          child: Icon(
                            Icons.person,
                            color: Colors.black
                          ),
                        )
                      )
                    ],
                  ),
                  SizedBox(
                    height: 20.0,
                  ),
                  Container(
                    height: 40.0,
                    child: ListView(
                      scrollDirection: Axis.horizontal,
                      children: <Widget>[
                        buildTopChip("healthy", true),
                        buildTopChip("italian", false),
                        buildTopChip("mexican", false),
                        buildTopChip("asian", false),
                        buildTopChip("chinese", false),
                        buildTopChip("haitian", false),
                      ],
                    ),
                  )
                ],
              ),
            ),
            Container(
              child: Expanded(
                  child: ListView(
                    children: <Widget>[
                      buildItem(
                          "Hans Regency",
                          "123 reviews = Sector 1, Bokaro",
                          "https://images.pexels.com/photos/3676531/pexels-photo-3676531.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=750&w=1260",
                          4.5),
                      buildItem(
                          "Mansarover",
                          "98 reviews = Sector-4, Bokaro",
                          "https://images.pexels.com/photos/1147993/pexels-photo-1147993.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500",
                          4.0),
                      buildItem(
                          "Hotel Classic",
                          "106 reviews = Sector-4, Bokaro",
                          "https://images.pexels.com/photos/842571/pexels-photo-842571.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=750&w=1260",
                          4.2),
                    ],
                  )),
            ),
          ],
        ),
      ),
    );
  }
}
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
              onTap: () {Navigator.of(context).pop();}
          ),
          ListTile(
              title: Text('Discover'),
              onTap: () {Navigator.of(context).pop();}
          ),
          ListTile(
              title: Text('History'),
              onTap: () {Navigator.of(context).pop();}
          ),
          ListTile(
              title: Text('Profile'),
              onTap: () {Navigator.of(context).pop();}
          ),
          ListTile(
              title: Text('About'),
              onTap: () {Navigator.of(context).pop();}
          )
        ],
      ),
    );
  }
}

Container buildItem(
    String title, String subTitle, String url, double rating) {
  return Container(
    margin: EdgeInsets.symmetric(vertical: 12.0),
    padding: EdgeInsets.symmetric(horizontal: 25.0),
    child: Column(
      children: <Widget>[
        Container(
          height: 200,
          decoration: BoxDecoration(
              image: DecorationImage(
                image: NetworkImage(url),
                fit: BoxFit.cover,
              ),
              borderRadius: BorderRadius.only(

                topLeft: Radius.circular(10.0),
                topRight: Radius.circular(10.0),
              )),
        ),
        Container(
          padding: EdgeInsets.all(25.0),
          decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(10.0),
                  bottomRight: Radius.circular(10.0)),
              boxShadow: [
                BoxShadow(
                    blurRadius: 2.0, spreadRadius: 1.0, color: Colors.grey)
              ]),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text(
                    title,
                    style: TextStyle(
                        fontWeight: FontWeight.bold, fontSize: 16.0),
                  ),
                  Text(
                    subTitle,
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 12.0,
                        color: Colors.grey),
                  ),
                ],
              ),
              CircleAvatar(
                backgroundColor: Color(0xFFF2A22C),
                child: Text(
                  rating.toString(),
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ],
          ),
        ),
      ],
    ),
  );
}

Container buildTopChip(String label, bool isActive) {
  return Container(
    padding: EdgeInsets.symmetric(horizontal: 5.0),
    child: Chip(
      padding: EdgeInsets.all(8.0),
      label: Text(
        label,
        style: TextStyle(color: Colors.white, fontSize: 16.0),
      ),
      backgroundColor: isActive ? Color(0xFFF2A22C) : Colors.grey,
    ),
  );
}