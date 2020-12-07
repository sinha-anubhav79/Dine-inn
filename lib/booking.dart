import 'package:dine_inn/Home.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:http/http.dart' as http;
import 'package:dine_inn/books.dart';
import 'package:dine_inn/book.dart';
import 'dart:convert';

class BookingPage extends StatefulWidget {
  final User user;

  const BookingPage({Key key, this.user}) : super(key: key);
  @override
  _BookingPageState createState() => _BookingPageState();
}

class _BookingPageState extends State<BookingPage> {

  DateTime _dateTime;
  String dropDownSlot = 'Select';
  String dropDownSeats = 'Select';
  int bookSeats = 0;
  final _timeSlotFocusNode = FocusNode();
  final _seatsFocusNode = FocusNode();
  final _form = GlobalKey<FormState>();
  var _newBook = Book(
    id: null,
    date: '00/00/0000',
    timeSlot: '00:00-00:00',
    seats: 0,
  );


  @override
  void dispose() {
    // TODO: implement dispose
    _seatsFocusNode.dispose();
    _timeSlotFocusNode.dispose();
    super.dispose();
  }

  void _saveForm() {
    final isValid = _form.currentState.validate();
    if(!isValid) {
      return;
    }
    _form.currentState.save();
    var variable = Provider.of<Books>(
        context,
        listen: false
    );
    variable.addBook(_newBook);
  }

  @override
  Widget build(BuildContext context) {
    final User user = context.watch<User>();
    return ChangeNotifierProvider(
      create:(ctx) => Books(),
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Color(0xFFF2A22C),
        ),
          backgroundColor: Colors.white,
          body: Builder(
            builder: (BuildContext newContext){
              return SingleChildScrollView(
                  child: ConstrainedBox(
                    constraints: BoxConstraints(),
                    child: Container(
                      padding: EdgeInsets.only(left: 20.0, right: 20.0,),
                      child: Column(
                        children: [
                          Container(
                              height: 210,
                              decoration: BoxDecoration(
                                  image: DecorationImage(
                                      image: AssetImage('assets/images/sitting.png')
                                  ))
                          ),
                          Center(
                            child: Text('Book your Seat',
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 40.0,
                              ),),
                          ),
                          Form(
                            key: _form,

                            child: Column(
                              children: [
                                SizedBox(height: 20.0,),
                                Row(
                                  children: [
                                    ButtonTheme(
                                      minWidth: 20,
                                      child: RaisedButton(
                                        color: (_dateTime != null ? Colors.amber : Colors.grey[300]),
                                        child: Icon(Icons.date_range),
                                        onPressed: () {
                                          showDatePicker(
                                              context: context,
                                              initialDate: _dateTime == null ? DateTime.now() : _dateTime,
                                              firstDate: DateTime(2020),
                                              lastDate: DateTime(2031)
                                          ).then((date) {
                                            setState(() {
                                              _dateTime = date;
                                              String bDate = _dateTime.day.toString()+"/"+_dateTime.month.toString()+"/"+_dateTime.year.toString();
                                              _newBook = Book(
                                                  id: null,
                                                  date: bDate,
                                                  timeSlot: _newBook.timeSlot,
                                                  seats: _newBook.seats
                                              );
                                            });
                                          });
                                        },
                                      ),
                                    ),
                                    SizedBox(width: 10,),
                                    Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                            'Date',
                                        style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 16,
                                          color: Colors.grey[600]
                                          ),
                                        ),
                                        Text(_dateTime == null ? 'Select the booking date' : _dateTime.day.toString()+"/"+_dateTime.month.toString()+"/"+_dateTime.year.toString()),
                                      ],
                                    ),
                                  ],
                                ),
                                SizedBox(height: 20.0,),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text('Time Slot',
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 16,
                                          color: Colors.grey[600]
                                      ),
                                    ),
                                    DropdownButton(
                                      hint:Text(
                                        dropDownSlot,
                                        style: TextStyle(color: Colors.black, fontSize: 17),
                                      ),
                                      isExpanded: true,
                                      iconSize: 30.0,
                                      style: TextStyle(color: Colors.black,fontSize: 17),
                                      items: ['6:00 - 7:00', '7:00 - 8:00', '8:00 - 9:00','9:00 - 10:00','10:00 - 11:00'].map(
                                            (val) {
                                          return DropdownMenuItem<String>(
                                            value: val,
                                            child: Text(val),
                                          );
                                        },
                                      ).toList(),
                                      onChanged: (val) {
                                        setState(() {
                                          dropDownSlot = val;
                                          _newBook = Book(
                                              date: _newBook.date,
                                              timeSlot: dropDownSlot,
                                              seats: _newBook.seats,
                                              id: null);
                                        },
                                        );
                                      },
                                    ),
                                  ],
                                ),
                                SizedBox(height: 20.0,),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text('No. of Seats',
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 16,
                                          color: Colors.grey[600]
                                      ),
                                    ),
                                    DropdownButton(
                                      hint:Text(
                                        dropDownSeats,
                                        style: TextStyle(color: Colors.black, fontSize: 17),
                                      ),
                                      isExpanded: true,
                                      iconSize: 30.0,
                                      style: TextStyle(color: Colors.black,fontSize: 17),
                                      items: ['1', '2', '3','4','5','6'].map(
                                            (val) {
                                          return DropdownMenuItem<String>(
                                            value: val,
                                            child: Text(val),
                                          );
                                        },
                                      ).toList(),
                                      onChanged: (val) {
                                        setState(() {
                                          dropDownSeats = val;
                                          bookSeats = int.parse(dropDownSeats);
                                          _newBook = Book(
                                              date: _newBook.date,
                                              timeSlot: _newBook.timeSlot,
                                              seats: bookSeats,
                                              id: null);
                                        },
                                        );
                                      },
                                    ),
                                  ],
                                ),
                                SizedBox(height: 30.0,),
                              ],
                            ),
                          ),
                          RaisedButton(
                            onPressed: (){
                              _saveForm();
                              showDialog(
                                context: context,
                                builder: (_) => AlertDialog(
                                  title: Text('Booking Successful!'),
                                  content: Text('Booked'),
                                  actions: [
                                    FlatButton(
                                      child: Text('OK'),
                                      onPressed: (){
                                        Navigator.push(
                                          context,
                                          MaterialPageRoute(builder: (context) => HomePage(user: user,)),
                                        );
                                      },
                                    ),
                                  ],
                                ),
                              );
                            },
                            child: Text('BOOK',
                              style:TextStyle(),
                            ),
                            color: Colors.amber,
                          ),
                        ],
                      ),
                    ),
                  )
              );
            },
          ),
      ),
    );
  }
}

