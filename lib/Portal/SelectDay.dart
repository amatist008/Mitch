import 'package:flutter/material.dart';

class SelectedDayProvider with ChangeNotifier{
  DateTime _selectedDay = DateTime.now();
  DateTime get selectedDay => _selectedDay;

  void setSelectedDay(DateTime day) {
    _selectedDay = day;
    notifyListeners();
  }
}
