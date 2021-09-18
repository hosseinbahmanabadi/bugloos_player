import 'package:bugloos_player/components/data.dart';
import 'package:bugloos_player/components/play_list.dart';
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
        child: Responsive.isMobile(context)? const Center(
          child: PlaylistScreen(playlist: ebiLalehzarPlaylist,),

        ):const Center(
          child: Text("Home Screen Other Size page"),
        )
    );
  }
}
