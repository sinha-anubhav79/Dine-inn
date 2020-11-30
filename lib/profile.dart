import 'dart:io';
import 'package:dine_inn/ManageUser.dart';
import 'package:dine_inn/MenuBar.dart';
import 'package:dine_inn/displayPicture.dart';
import 'package:dine_inn/loginPage.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ProfilePage extends StatefulWidget {
  final User user;

  const ProfilePage({Key key, this.user}) : super(key: key);
  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  Widget build(BuildContext context) {
    final User user = context.watch<User>();
    return Scaffold(
      backgroundColor: Colors.white,
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
                'My Profile',
                style: TextStyle(
                  fontSize: 50.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Container(
              height:480,
              margin:EdgeInsets.symmetric(horizontal:10,vertical:10),
              decoration: BoxDecoration(
                  color:Colors.white,
                  boxShadow:[BoxShadow(
                      color:Colors.white,
                      blurRadius: 10,
                      offset: Offset(0,10)
                  )]
              ),
              child: Padding(
                  padding: EdgeInsets.symmetric(vertical:5),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Center(
                        child: InkWell(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) => DisplayPicture(user: user, changeDp: true,)),
                            ).then((value) => setState((){}));
                          },
                          child: ClipOval(
                            child: (user != null)?Image.network(user.photoURL, height: 250,):Icon(Icons.person),
                          ),
                        )
                      ),
                      SizedBox(height:25),
                      Padding(
                        padding: EdgeInsets.only(left: 30),
                        child: Column(
                          children: [
                            Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children:[
                                  Icon(Icons.person),
                                  SizedBox(width: 20,),
                                  Flexible(
                                    child: Text('${(user != null)?user.displayName:' - '}',
                                        style:TextStyle(
                                            fontSize: 20,
                                            fontWeight: FontWeight.bold,
                                            color:Color(0xFFF2A22C)
                                        )
                                    ),
                                  )
                                ]
                            ),
                            SizedBox(height:20),
                            Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children:[
                                  Icon(Icons.mail),
                                  SizedBox(width: 20,),
                                  Flexible(
                                    child: Text('${(user != null)?user.email:' - '}',
                                        style:TextStyle(
                                            fontSize: 20,
                                            fontWeight: FontWeight.bold,
                                            color:Color(0xFFF2A22C)
                                        )
                                    ),
                                  )
                                ]
                            ),
                          ],
                        ),
                      ),
                      SizedBox(height: 20,),
                      RaisedButton(
                          onPressed: () async{
                            context.read<AuthenticationService>().logout().whenComplete(() {
                              Navigator.pushReplacement(
                                context,
                                MaterialPageRoute(builder: (context) => LoginPage()),
                              );
                            });
                          },
                          child:Text("SignOut",
                              style:TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Colors.red,)),
                          color: Colors.red[100]
                      ),
                    ],
                  )
              ),
            ),
          ],
        ),
      ),
    );
  }
}