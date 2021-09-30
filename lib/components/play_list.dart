import 'package:bugloos_player/config/constants.dart';
import 'package:flutter/material.dart';
import 'package:line_icons/line_icons.dart';
import 'data.dart';
import 'play_list_header.dart';
import 'track_list.dart';

class PlaylistScreen extends StatefulWidget {
  final Playlist playlist;

  const PlaylistScreen({
    Key? key,
    required this.playlist,
  }) : super(key: key);

  @override
  _PlaylistScreenState createState() => _PlaylistScreenState();
}

class _PlaylistScreenState extends State<PlaylistScreen> {
  ScrollController? _scrollController;

  @override
  void initState() {
    super.initState();
    _scrollController = ScrollController();
  }

  @override
  void dispose() {
    _scrollController?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leadingWidth: 140.0,
        leading: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Row(
            children: [
              InkWell(
                child: Container(
                  padding: const EdgeInsets.all(6.0),
                  child: const Icon(Icons.arrow_back_ios),
                ),
              ),
            ],
          ),
        ),
        actions: const [
          Icon(LineIcons.heart, color: kBgLightColor,),
          SizedBox(width: 8.0),
          Icon(LineIcons.verticalEllipsis, color: kBgLightColor,),
          SizedBox(width: 20.0),
        ],
      ),
      body: Container(
        width: double.infinity,
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              kRedBack,
              kBackBlack
            ],
            stops: [0, 0.45],
          ),
        ),
        child: Scrollbar(
          isAlwaysShown: true,
          controller: _scrollController,
          child: ListView(
            controller: _scrollController,
            padding: const EdgeInsets.symmetric(
              horizontal: 10.0,
              vertical: 60.0,
            ),
            children: [
              PlaylistHeader(playlist: widget.playlist),
              SizedBox(height: 15,),
              TracksList(tracks: widget.playlist.songs),
            ],
          ),
        ),
      ),
    );
  }
}
