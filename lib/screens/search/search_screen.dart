import 'package:bugloos_player/config/constants.dart';
import 'package:flutter/material.dart';
import '../../responsive.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({Key? key}) : super(key: key);

  @override
  _SearchScreenState createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  @override
  Widget build(BuildContext context) {
    return Container(
        child: Responsive.isMobile(context)? Center(
          child:Padding(
              padding: EdgeInsets.all(Responsive.isMobile(context)?kDefaultPaddingAllSmall:kDefaultPadding),
              child: const Text("Search Screen"),
            ),
        ):const Center(
          child: Text("Search Screen Other Size page"),
        )
    );
  }
}
