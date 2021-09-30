import 'package:bugloos_player/config/constants.dart';
import 'package:provider/src/provider.dart';
import '../bloc/counter_bloc.dart' as bloc;
import 'package:flutter/material.dart';
import '../responsive.dart';
import 'data.dart';


class PlaylistHeader extends StatelessWidget {
  final Playlist playlist;

  const PlaylistHeader({
    Key? key,
    required this.playlist,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
   var _size = MediaQuery.of(context).size;
    return Column(
      children: [
        Container(
          constraints: BoxConstraints(maxWidth: Responsive.isMobile(context)?_size.width*0.45:200),
          child: Column(
            children: [
              SizedBox(height: Responsive.isMobile(context)?_size.height*0.09:80,),
              Image.network(
                playlist.imageURL,
                height: Responsive.isMobile(context)?_size.width*0.45:200,
                width: Responsive.isMobile(context)?_size.width*0.45:200,
                fit: BoxFit.cover,
              ),
              const SizedBox(height: 12.0),
              FittedBox(
                  fit: BoxFit.fitWidth,
                  child: Text(playlist.name, style: titleBgLightColorTextStyle,)),
              const SizedBox(height: 12,),
              Text(playlist.description, style: descriptionBgLightColorTextStyle,)
            ],
          ),
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
      onTap: () {
        context.read<bloc.ManagePageState>().selectTrack(ebiLalehzarPlaylist.songs.first);
      },
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
