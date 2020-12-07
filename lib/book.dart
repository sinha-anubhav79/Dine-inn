import 'package:flutter/foundation.dart';

class Book
{
  final String id;
  final String date;
  final String timeSlot;
  final int seats;

  Book({
    @required this.id,
    @required this.date,
    @required this.timeSlot,
    @required  this.seats
  });
}