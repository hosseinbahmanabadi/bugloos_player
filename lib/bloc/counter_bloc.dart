import 'dart:collection';
import 'dart:convert';
import 'package:bugloos_player/components/data.dart';
import 'package:flutter/material.dart';



class ManagePageState with ChangeNotifier{

  String _pageItems = "home";
  Song? selected;
  List trackIdFavoriteList = [];
  get pageItems => _pageItems;

  void pageChange(item) {
    _pageItems = item;
    notifyListeners();
  }
  void selectTrack(Song track) {
    selected = track;
    notifyListeners();
  }
  void favoriteTrack(trackId) {
    if(trackIdFavoriteList.contains(trackId)){
      trackIdFavoriteList.remove(trackId);
    }
    else{
      trackIdFavoriteList.add(trackId);
    }
    notifyListeners();
  }

}
