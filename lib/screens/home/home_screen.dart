import 'package:bugloos_player/config/constants.dart';
import 'package:flutter/material.dart';
import '../../responsive.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Container(
        child: Responsive.isMobile(context)? Center(
          child:Padding(
              padding: EdgeInsets.all(Responsive.isMobile(context)?kDefaultPaddingAllSmall:kDefaultPadding),
              child: const Text("Home Screen"),
            ),

        ):const Center(
          child: Text("Home Screen Other Size page"),
        )
    );
  }
}
