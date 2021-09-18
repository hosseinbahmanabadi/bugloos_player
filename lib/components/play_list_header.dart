import 'package:bugloos_player/config/constants.dart';
import 'package:flutter/material.dart';
import 'data.dart';


class PlaylistHeader extends StatelessWidget {
  final Playlist playlist;

  const PlaylistHeader({
    Key? key,
    required this.playlist,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Column(
          children: [
            const SizedBox(height: 80,),
            Image.network(
              playlist.imageURL,
              height: 200.0,
              width: 200.0,
              fit: BoxFit.cover,
            ),
            const SizedBox(height: 12.0),
            Text(playlist.name, style: titleBgLightColorTextStyle,),
            const SizedBox(height: 12,),
            Text(playlist.description, style: descriptionBgLightColorTextStyle,)
          ],
        ),
        const SizedBox(height: 5.0),
        const _PlaylistButtons(),
      ],
    );
  }
}

class _PlaylistButtons extends StatelessWidget {

  const _PlaylistButtons({
    Key? key
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {},
      child: Container(
        padding: const EdgeInsets.fromLTRB(50, 15, 50, 15),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(35),
            color: kGreenColor
          ),
          child: const Text('PLAY', style: playBgLightColorTextStyle,)),
    );
  }
}
