import 'package:bugloos_player/config/constants.dart';
import 'package:flutter/material.dart';
import '../../responsive.dart';

class PremiumScreen extends StatefulWidget {
  const PremiumScreen({Key? key}) : super(key: key);

  @override
  _PremiumScreenState createState() => _PremiumScreenState();
}

class _PremiumScreenState extends State<PremiumScreen> {
  @override
  Widget build(BuildContext context) {
    return Container(
        child: Responsive.isMobile(context)? Center(
          child:Padding(
              padding: EdgeInsets.all(Responsive.isMobile(context)?kDefaultPaddingAllSmall:kDefaultPadding),
              child: const Text("Premium Screen"),
            ),
        ):const Center(
          child: Text("Premium Screen Other Size page"),
        )
    );
  }
}
