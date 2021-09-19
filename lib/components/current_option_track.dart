import 'package:bugloos_player/components/data.dart';
import 'package:bugloos_player/config/constants.dart';
import 'package:flutter/material.dart';
import 'package:provider/src/provider.dart';
import '../../responsive.dart';
import '../../bloc/counter_bloc.dart' as bloc;


class CurrentOptionTrackDisplay extends StatefulWidget {
  const CurrentOptionTrackDisplay({Key? key}) : super(key: key);

  @override
  _CurrentOptionTrackDisplayState createState() => _CurrentOptionTrackDisplayState();
}

class _CurrentOptionTrackDisplayState extends State<CurrentOptionTrackDisplay> {




  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onVerticalDragUpdate: ((onPanDown){
        if(onPanDown.globalPosition.distance>300){
          Navigator.pop(context);
        }
      }),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        extendBodyBehindAppBar: true,
        body: Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                  Colors.transparent.withOpacity(0.6),
                  kBackBlack
                ],
                stops: [0, 0.45],
              ),
            ),
            child: Responsive.isMobile(context)? Center(
              child:Padding(
                padding: const EdgeInsets.all(kDefaultPaddingAllSmall),
                child: Column(
                  children: [
                    const SizedBox(height: 210,),
                    Padding(
                      padding: EdgeInsets.all(Responsive.isMobile(context)?kDefaultPaddingAllSmall:kDefaultPadding),
                      child:  Image.network(
                        context.read<bloc.ManagePageState>().selected!.imageURL,
                        height: 200.0,
                        width: 200.0,
                        fit: BoxFit.cover,
                      ),
                    ),
                    const SizedBox(height: 20,),
                    Text(context.watch<bloc.ManagePageState>().selected!.title.toString(), style: titleBgLightColorTextStyle,),
                    Text(context.read<bloc.ManagePageState>().selected!.artist, style: currentDisplayArtistGrayColorTextStyle,),
                    SizedBox(height: 25,),
                    InkWell(
                      onTap: (){
                        context.read<bloc.ManagePageState>().favoriteTrack(context.read<bloc.ManagePageState>().selected!.id);
                      },
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          SizedBox(width: 20,),
                          context.watch<bloc.ManagePageState>().trackIdFavoriteList.contains(context.read<bloc.ManagePageState>().selected!.id)?
                          const Icon(Icons.favorite, color: kGreenColor,):Icon(
                            Icons.favorite_border_outlined,
                            color: Colors.grey.shade400,
                          ),
                          SizedBox(width: 20,),
                          Text("Like" ,style: titleBgLightColorTextStyle,)
                        ],
                      ),
                    ),
                    SizedBox(height: 25,),
                    InkWell(
                      onTap: (){

                      },
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          SizedBox(width: 20,),
                          Icon(
                            Icons.remove_circle_outline,
                            color: Colors.grey.shade400,
                          ),
                          SizedBox(width: 20,),
                          Text("Hide this song" ,style: titleBgLightColorTextStyle,)
                        ],
                      ),
                    ),
                    SizedBox(height: 25,),
                    Divider(color: Colors.grey,),
                    SizedBox(height: 25,),
                    InkWell(
                      onTap: (){

                      },
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          SizedBox(width: 20,),
                          Icon(
                            Icons.library_music_rounded,
                            color: Colors.grey.shade400,
                          ),
                          SizedBox(width: 20,),
                          Text("Add to Playlist" ,style: titleBgLightColorTextStyle,)
                        ],
                      ),
                    ),
                    SizedBox(height: 25,),
                    InkWell(
                      onTap: (){

                      },
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          SizedBox(width: 20,),
                          Icon(
                            Icons.person,
                            color: Colors.grey.shade400,
                          ),
                          SizedBox(width: 20,),
                          Text("View Artist" ,style: titleBgLightColorTextStyle,)
                        ],
                      ),
                    ),
                    SizedBox(height: 25,),
                    InkWell(
                      onTap: (){

                      },
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          SizedBox(width: 20,),
                          Icon(
                            Icons.share,
                            color: Colors.grey.shade400,
                          ),
                          SizedBox(width: 20,),
                          Text("Share" ,style: titleBgLightColorTextStyle,)
                        ],
                      ),
                    ),
                    SizedBox(height: 25,),
                    InkWell(
                      onTap: (){

                      },
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          SizedBox(width: 20,),
                          Icon(
                            Icons.report,
                            color: Colors.grey.shade400,
                          ),
                          SizedBox(width: 20,),
                          Text("Report Expilicit Content" ,style: titleBgLightColorTextStyle,)
                        ],
                      ),
                    )

                  ],
                ),
              ),
            ):const Center(
              child: Text("Search Screen Other Size page"),
            )
        ),
      ),
    );
  }
}