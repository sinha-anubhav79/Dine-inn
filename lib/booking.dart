import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class BookingPage extends StatefulWidget {
  final User user;

  const BookingPage({Key key, this.user}) : super(key: key);
  @override
  _BookingPageState createState() => _BookingPageState();
}

class _BookingPageState extends State<BookingPage> {
  @override
  Widget build(BuildContext context) {
    final User user = context.watch<User>();
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: ConstrainedBox(
          constraints: BoxConstraints(),
          child: Container(
            padding: EdgeInsets.only(left: 20.0, right: 20.0, top: 10.0),
            child: Column(
              children: [
                Container(
                    height: 220,
                    decoration: BoxDecoration(
                        image: DecorationImage(
                            image: AssetImage('assets/images/sitting.png')
                        ))
                ),
                Center(
                  child: Text('Book your seat',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 40.0,
                    ),),
                ),
                Form(
                  child: Column(
                    children: [
                      TextFormField(
                        decoration: InputDecoration(
                            labelText: 'Date',
                            labelStyle: TextStyle(
                              fontWeight: FontWeight.bold,
                            )
                        ),
                      ),
                      SizedBox(height: 20.0,),
                      TextFormField(
                        decoration: InputDecoration(
                            labelText: 'Time Slot',
                            labelStyle: TextStyle(
                              fontWeight: FontWeight.bold,
                            )
                        ),
                      ),
                      SizedBox(height: 20.0,),
                      TextFormField(
                        decoration: InputDecoration(
                            labelText: 'No. of Seats',
                            labelStyle: TextStyle(
                              fontWeight: FontWeight.bold,
                            )
                        ),
                      ),
                      SizedBox(height: 30.0,),
                    ],
                  ),
                ),
                RaisedButton(
                  onPressed: () {},
                  child: Text('Book Seats',
                    style:TextStyle(),
                  ),
                  color: Colors.amber,
                ),
              ],
            ),
          ),
        )
      )
    );
  }
}
