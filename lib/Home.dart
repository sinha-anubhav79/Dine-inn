import 'package:dine_inn/MenuBar.dart';
//import 'package:dine_inn/widgets/categories.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:provider/provider.dart';

import 'models/popular_restaurants.dart';


class HomePage extends StatefulWidget {
  final User user;

  const HomePage({Key key, this.user}) : super(key: key);
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  final FirebaseAuth auth = FirebaseAuth.instance;
  final GlobalKey<ScaffoldState> _scaffoldkey = GlobalKey<ScaffoldState>();
  @override
  Widget build(BuildContext context) {
    final User user = context.watch<User>();
    return Scaffold(
      key: _scaffoldkey,
      appBar: AppBar(
        backgroundColor: Color(0xFFF2A22C),
      ),
      drawer: MenuBar(user: user,),
      body: ListView(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text("What would you like to eat,",style:TextStyle(fontSize: 20)),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text((user !=null)? user.displayName:'home display name',style:TextStyle(fontSize: 25)),
          ),

        SizedBox(height: 5,),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              decoration: BoxDecoration (
                color:Colors.white,
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey[300],
                    offset: Offset(1,1),
                    blurRadius: 4
                  )
                ]
              ),
              child: ListTile(
                leading: Icon(Icons.search, color:Colors.red),
                title: TextField(
                  decoration: InputDecoration(
                    hintText:"Find a food or restaurant",
                    border: InputBorder.none
                  ),
                ),
                trailing: Icon(Icons.filter_list, color:Colors.red),
              )
            ),
          ),
          SizedBox(
            height: 5,
          ),
          //Categories(),
          SizedBox(
            height: 2,
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text("Popular Restaurants",style:TextStyle(fontSize: 20)),
    ),
          Popular()
    ],
        ),

    );
  }
}
