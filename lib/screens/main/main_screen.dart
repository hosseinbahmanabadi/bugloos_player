import 'package:bugloos_player/bloc/counter_bloc.dart' as bloc;
import 'package:bugloos_player/components/current_track.dart';
import 'package:bugloos_player/screens/home/route_screen.dart';
import 'package:flutter/material.dart';
import 'package:bugloos_player/responsive.dart';
import 'package:provider/src/provider.dart';

import 'item_of_option.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // It provide us the width and height
    Size _size = MediaQuery.of(context).size;
    final selected = context.watch<bloc.ManagePageState>().selected;

    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Responsive(
        mobile: Column(
          children: [
            const Expanded(
                flex: 10,
                child: RouteScreen()),
            if(selected!=null)Expanded(
                flex: 1,
                child: CurrentTrack()),
            const Expanded(
                flex: 1,
                child: ItemOfOption()),
          ],
        ),
        tablet: Row(
          children: const [
            Expanded(
              flex: 4,
              child: ItemOfOption(),
            ),
             Expanded(
              flex: 10,
              child: RouteScreen(),
            ),
          ],
        ),
        desktop: Row(
          children: [
            // Once our width is less then 1300 then it start showing errors
            // Now there is no error if our width is less then 1340
//            Expanded(
//              flex: _size.width > 1340 ? 2 : 4,
//              child: SideMenu(),
//            ),
            Expanded(
              flex: _size.width > 1340 ? 3 : 5,
              child: ItemOfOption(),
            ),
            Expanded(
              flex: _size.width > 1340 ? 8 : 10,
              child: RouteScreen(),
            ),
          ],
        ),
      ),
    );
  }
}
