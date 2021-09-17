import 'dart:collection';
import 'dart:convert';
import 'package:flutter/material.dart';



class ManagePageState with ChangeNotifier{

  String _pageItems = "home";
  get pageItems => _pageItems;

  void pageChange(item) {
    _pageItems = item;
    notifyListeners();
  }

}
