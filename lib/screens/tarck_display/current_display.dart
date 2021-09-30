import 'package:bugloos_player/components/current_option_track.dart';
import 'package:bugloos_player/components/data.dart';
import 'package:bugloos_player/config/constants.dart';
import 'package:flutter/material.dart';
import 'package:provider/src/provider.dart';
import '../../responsive.dart';
import '../../bloc/counter_bloc.dart' as bloc;


class CurrentTrackDisplay extends StatefulWidget {
  const CurrentTrackDisplay({Key? key}) : super(key: key);

  @override
  _CurrentTrackDisplayState createState() => _CurrentTrackDisplayState();
}

class _CurrentTrackDisplayState extends State<CurrentTrackDisplay> {




  @override
  Widget build(BuildContext context) {
    var _size = MediaQuery.of(context).size;

    return GestureDetector(
      onVerticalDragUpdate: ((onPanDown){
        if(onPanDown.globalPosition.distance>300){
          Navigator.pop(context);
        }
      }),
      child: Scaffold(
        extendBodyBehindAppBar: true,
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
//          leadingWidth: 120.0,
          centerTitle: true,
          title: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text("PLAYING FROM PLAYLIST", style: descriptionBgLightColorTextStyle,),
              Text(context.read<bloc.ManagePageState>().selected!.album, style: playListTitleBgLightColorTextStyle,)
            ],
          ),
          leading: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: InkWell(
              onTap: (){
                Navigator.pop(context);
              },
              child: Container(
                padding: const EdgeInsets.all(6.0),
                child: const Icon(Icons.keyboard_arrow_down_rounded, size: 40,),
              ),
            ),
          ),
          actions: [
            InkWell(
                onTap: (){
                  Navigator.of(context).push(_createRouteToOptionTrack());
                },
                child: const Icon(Icons.more_vert, color: kBgLightColor,)),
            const SizedBox(width: 20.0),
          ],
        ),
        body: Container(
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
            child: Responsive.isMobile(context)? Center(
              child:Column(
                children: [
                  SizedBox(height: Responsive.isMobile(context)?_size.height*0.15:190,),
                  Padding(
                      padding: EdgeInsets.all(Responsive.isMobile(context)?kDefaultPaddingAllSmall:kDefaultPadding),
                      child:  Image.network(
                        context.read<bloc.ManagePageState>().selected!.imageURL,
                        height: Responsive.isMobile(context)?_size.width*0.65:350,
                        width: Responsive.isMobile(context)?_size.width*0.65:350,
                        fit: BoxFit.cover,
                      ),
                    ),
                 SizedBox(height: Responsive.isMobile(context)?_size.height*0.007:50,),
                 Text(context.watch<bloc.ManagePageState>().selected!.title.toString(), style: titleBgLightColorTextStyle,),
                 Text(context.read<bloc.ManagePageState>().selected!.artist, style: currentDisplayArtistGrayColorTextStyle,),
                 Stack(
                    alignment: Alignment.bottomCenter,
                    children: <Widget>[
                      Container(
                        padding: const EdgeInsets.only(left: 5, right: 5),
                        width: double.infinity,
                        child: SliderTheme(
                          data: SliderTheme.of(context).copyWith(
                            activeTrackColor: Colors.white,
                            inactiveTrackColor: Colors.grey.shade600,
                            activeTickMarkColor: Colors.white,
                            thumbColor: Colors.white,
                            trackHeight: 3,
                            thumbShape: const RoundSliderThumbShape(
                              enabledThumbRadius: 4,
                            ),
                          ),
                          child: Slider(
                            value: context.watch<bloc.ManagePageState>().position.inSeconds.toDouble() !=
                                context.watch<bloc.ManagePageState>().duration.inSeconds.toDouble()
                                ? context.watch<bloc.ManagePageState>().position.inSeconds.toDouble()
                                : context.watch<bloc.ManagePageState>().setToChangeDouble,
                            min: 0,
                            max: context.watch<bloc.ManagePageState>().duration.inSeconds.toDouble(),
                            onChanged: (double value) {
                              context.read<bloc.ManagePageState>().seekToSecond(value.toInt());
                                value = value;
                            },
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 25, right: 25),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            Text(
                              "${context.watch<bloc.ManagePageState>().position.inMinutes.toInt()}:${(context.watch<bloc.ManagePageState>().position.inSeconds % 60).toString().padLeft(2, "0")}",
                              style: TextStyle(
                                color: Colors.grey.shade400,
//                            fontFamily: "ProximaNovaThin",
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Text(
                              "${context.watch<bloc.ManagePageState>().duration.inMinutes.toInt()}:${(context.watch<bloc.ManagePageState>().duration.inSeconds % 60).toString().padLeft(2, "0")}",
                              style: TextStyle(
                                color: Colors.grey.shade400,
//                            fontFamily: "ProximaNovaThin",
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  Container(
                    padding: const EdgeInsets.only(left: 22, right: 22),
                    width: double.infinity,
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        context.watch<bloc.ManagePageState>().trackIdFavoriteList.contains(context.read<bloc.ManagePageState>().selected!.id)?
                            InkWell(
                                onTap: (){
                                  context.read<bloc.ManagePageState>().favoriteTrack(context.read<bloc.ManagePageState>().selected!.id);
                                },
                                child: const Icon(Icons.favorite, color: kGreenColor,)):InkWell(
                          onTap: (){
                            context.read<bloc.ManagePageState>().favoriteTrack(context.read<bloc.ManagePageState>().selected!.id);
                          },
                                  child: Icon(
                          Icons.favorite_border_outlined,
                          color: Colors.grey.shade400,
                        ),
                                ),
                        InkWell(
                          onTap: (){
                            context.read<bloc.ManagePageState>().prevTrack(context.read<bloc.ManagePageState>().selected);
                          },
                          child: const Icon(
                            Icons.skip_previous,
                            color: Colors.white,
                            size: 40,
                          ),
                        ),
                        SizedBox(
                          height: 90,
                          width: 90,
                          child: Center(
                            child: IconButton(
                              iconSize: 70,
                              alignment: Alignment.center,
                              icon: (context.watch<bloc.ManagePageState>().isPlayPressed == true)
                                  ? const Icon(
                                Icons.pause_circle_filled,
                                color: Colors.white,
                              )
                                  : const Icon(
                                Icons.play_circle_filled,
                                color: Colors.white,
                              ),
                              onPressed: () {
                                context.read<bloc.ManagePageState>().changeAudioPlayPause(context.read<bloc.ManagePageState>().selected!.audioURL);
                              },
                            ),
                          ),
                        ),
                        InkWell(
                          onTap: (){
                            context.read<bloc.ManagePageState>().nextTrack(context.read<bloc.ManagePageState>().selected);
                          },
                          child: const Icon(
                            Icons.skip_next,
                            color: Colors.white,
                            size: 40,
                          ),
                        ),
                        Icon(
                          Icons.remove_circle_outline,
                          color: Colors.grey.shade400,
                        ),
                      ],
                    ),
                  ),

                ],
              ),
            ):const Center(
              child: Text("Search Screen Other Size page"),
            )
        ),
      ),
    );
  }
}
Route _createRouteToOptionTrack() {
  return PageRouteBuilder(
    opaque: false,
    pageBuilder: (context, animation, secondaryAnimation) =>  CurrentOptionTrackDisplay(),
    transitionsBuilder: (context, animation, secondaryAnimation, child) {
      const begin = Offset(0.0, 1.0);
      const end = Offset.zero;
      const curve = Curves.ease;

      var tween = Tween(begin: begin, end: end).chain(CurveTween(curve: curve));

      return SlideTransition(
        position: animation.drive(tween),
        child: child,
      );
    },
  );
}
