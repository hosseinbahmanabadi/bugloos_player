import 'package:bugloos_player/config/constants.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'data.dart';
import '../bloc/counter_bloc.dart' as bloc;

class TracksList extends StatelessWidget {
  final List<Song> tracks;

  const TracksList({
    Key? key,
    required this.tracks,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: List.generate(tracks.length,(index)=> Padding(padding: const EdgeInsets.all(kDefaultPaddingAllSmall),
      child: InkWell(
        onTap: (){
          context.read<bloc.ManagePageState>().selectTrack(tracks[index]);
        },
        child: Row(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(tracks[index].title, style: context.watch<bloc.ManagePageState>().selected?.id == tracks[index].id?
                playListTitleSelectedColorTextStyle:playListTitleBgLightColorTextStyle, textAlign: TextAlign.left,),
                Text(tracks[index].album.toString() + ", "+ tracks[index].artist, style: context.watch<bloc.ManagePageState>().selected?.id == tracks[index].id?
                descriptionSelectedColorTextStyle:descriptionBgLightColorTextStyle, textAlign: TextAlign.left,)
              ],
            ),
            const Spacer(),
            InkWell(
                onTap: (){
                  context.read<bloc.ManagePageState>().favoriteTrack(tracks[index].id);
                },
                child: context.watch<bloc.ManagePageState>().trackIdFavoriteList.contains(tracks[index].id)?const Icon(
                Icons.favorite, color: kGreenColor,):const Icon(
                  Icons.favorite_border_outlined, color: Colors.grey,)),
            const SizedBox(width: 6,),
            const Icon(Icons.remove_circle_outline, color: Colors.grey,),
            const Icon(Icons.more_vert, color: Colors.grey,),
//          Icon(),
          ],
        ),
      ),
      )),
    );
  }
}
