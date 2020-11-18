import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

class CompleteProfile extends StatefulWidget {
  @override
  _CompleteProfileState createState() => _CompleteProfileState();
}

class _CompleteProfileState extends State<CompleteProfile> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: ConstrainedBox(
          constraints: BoxConstraints(),
          child: Column(
            children: [
              Container(
                padding: EdgeInsets.fromLTRB(20.0, 20.0, 20.0, 20.0),
                height: 200.0,
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                  color: Color(0xFFF2A22C)
                ),
                child: CircleAvatar(
                  radius: 70,
                  backgroundColor: Colors.grey[300],
                  child: Icon(
                      Icons.person,
                      color: Colors.black,
                      size: 70,
                  ),
                ),
              ),
              Container(
                  padding: EdgeInsets.only(left: 20.0, right: 20.0, top: 20.0),
                child: Column(
                  children: [
                    Form(
                      key: _formKey,
                      child: Column(
                        children: [
                          Row(
                            children: [
                              Text(
                                'NAME:   ',
                                style: TextStyle(
                                    fontSize: 25.0, fontWeight: FontWeight.bold, color: Colors.black
                                ),
                              ),
                              Text(
                                'fullname',
                                style: TextStyle(
                                  fontSize: 20.0, color: Colors.grey
                                ),
                              ),
                            ],
                          ),
                          SizedBox(height: 30.0),
                          TextFormField(
                            enabled: false,
                            decoration: InputDecoration(
                              labelText: 'EMAIL',
                              labelStyle: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Colors.grey,
                              ),
                            ),
                            readOnly: true,
                          ),
                          Text(
                            'something@testmail.com',
                            textAlign: TextAlign.left,
                            style: TextStyle(
                              fontSize: 20.0,
                              color: Colors.grey,
                            ),
                          ),
                          SizedBox(height: 30.0),
                          TextFormField(
                            //controller: _emailController,
                            decoration: InputDecoration(
                                labelText: 'PHONE',
                                labelStyle: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.grey,
                                ),
                            ),
                            validator: (value) {
                              if (value.isEmpty) {
                                return 'Please enter your phone number';
                              }
                              return null;
                            },
                          ),
                          SizedBox(height: 30.0,)
                        ],
                      ),
                    )
                  ],
                ),
              )
            ],
          )
        )
      ),
    );
  }
}
