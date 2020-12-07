import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:dine_inn/book.dart';
import 'dart:convert';


class Books with ChangeNotifier
{
  List<Book> _items = [];

  List<Book> get items {
    return [..._items];
  }

  void addBook(Book book)
  {
    const url = 'https://dine-inn-2db02.firebaseio.com/Bookings.json';  //put the url of dine-inn database
    http.post(url, body: json.encode({
      'date': book.date,
      'timeSlot': book.timeSlot,
      'seats': book.seats,
    }),);
    final newBook = Book(
        id: DateTime.now().toString(),
        date: book.date,
        timeSlot: book.timeSlot,
        seats: book.seats
    );
    _items.add(newBook);
    notifyListeners();
  }

  void deleteBook(String id) {
    _items.removeWhere((book) => book.id == id);
    notifyListeners();
  }

}