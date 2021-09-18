import 'package:bugloos_player/bloc/counter_bloc.dart' as bloc;
import 'package:bugloos_player/config/constants.dart';
import 'package:bugloos_player/screens/library/library_screen.dart';
import 'package:bugloos_player/screens/premimum/premium_screen.dart';
import 'package:bugloos_player/screens/search/search_screen.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'home_screen.dart';

class RouteScreen extends StatefulWidget {
  const RouteScreen({Key? key}) : super(key: key);


  @override
  _RouteScreenState createState() => _RouteScreenState();
}

class _RouteScreenState extends State<RouteScreen> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Container(
        color: kSecondaryColor,
        child: Provider.of<bloc.ManagePageState>(context).pageItems=="home"?const HomeScreen():
        Provider.of<bloc.ManagePageState>(context).pageItems=="search"?const SearchScreen():
        Provider.of<bloc.ManagePageState>(context).pageItems=="library"?const LibraryScreen():
        Provider.of<bloc.ManagePageState>(context).pageItems=="premium"?const PremiumScreen():
        const Expanded(
          child: SingleChildScrollView(
            padding: EdgeInsets.all(kDefaultPadding),
            child: Center(
              child: Text("TEST"),
            ),
          ),
        ),
      ),
    );
  }

}
