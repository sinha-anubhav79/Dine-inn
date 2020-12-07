import 'package:dine_inn/MenuBar.dart';
//import 'package:dine_inn/widgets/categories.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:provider/provider.dart';

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
            child: Text("What would you like to eat",style:TextStyle(fontSize: 18)),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text((user !=null)? user.displayName:'home display name',style:TextStyle(fontSize: 28)),
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
          Container(
            height: 240,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
                itemCount: 2,
                itemBuilder: (_HomePageState,index){
              return Padding(padding: EdgeInsets.all(8),
              child: Container(
                height: 240,
                width: 200,
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
                child: Column(
                  children: [
                    Image.asset("assets/images/chinese.jpg",height: 140,width: 140,),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Container(
                            child: Text("Some Food",style:TextStyle(fontSize: 18)),
                          ),
                        ),
                        Padding(
                            padding: EdgeInsets.all(8),
                            child: Container(
                        decoration: BoxDecoration (
                        borderRadius: BorderRadius.circular(20),
                  color:Colors.white,
                  boxShadow: [
                    BoxShadow(
                        color: Colors.grey[300],
                        offset: Offset(1,1),
                        blurRadius: 4
                    )
                  ]
              ),
                  child: Padding(
                  padding: const EdgeInsets.all(4.0),
                  child: Icon(Icons.favorite_border,size: 20,color: Colors.red,),
                  ),
                  ),
                        ),
                      ],
                    ),
                    SizedBox(height: 4,),
                    Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(left:35.0),
                          child: Text("4.7",style:TextStyle(fontSize: 17,color: Colors.grey[900])),
                        ),
                        SizedBox(width: 15,),
                        Icon(Icons.star,color: Colors.red,size: 18,),
                        Icon(Icons.star,color: Colors.red,size: 18,),
                        Icon(Icons.star,color: Colors.red,size: 18,),
                        Icon(Icons.star,color: Colors.red,size: 18,),
                        Icon(Icons.star,color: Colors.grey,size: 18,),
                      ],
                    )
                  ],
                ),
              ),);
            }),
          )
    ],
        ),
    );
  }
}
