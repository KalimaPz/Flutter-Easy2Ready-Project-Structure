import 'package:flutter/material.dart';

class CounterProvider extends ChangeNotifier {
  int count ;
  CounterProvider() {
    this.count = 0;
  }
  
  increment() {
    this.count++;
    notifyListeners();
  }

  decrement() {
    this.count--;
    notifyListeners();
  }

  get get_count => this.count;
}