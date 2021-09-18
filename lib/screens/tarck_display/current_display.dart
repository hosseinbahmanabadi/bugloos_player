import 'package:bugloos_player/components/data.dart';
import 'package:bugloos_player/config/constants.dart';
import 'package:flutter/material.dart';
import '../../responsive.dart';

class CurrentTrackDisplay extends StatefulWidget {
  CurrentTrackDisplay({Key? key, this.trackInfo}) : super(key: key);
  Song? trackInfo;

  @override
  _CurrentTrackDisplayState createState() => _CurrentTrackDisplayState();
}

class _CurrentTrackDisplayState extends State<CurrentTrackDisplay> {
  @override
  Widget build(BuildContext context) {
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
          leadingWidth: 120.0,
          title: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text("PLAYING FROM PLAYLIST", style: descriptionBgLightColorTextStyle,),
              Text(widget.trackInfo!.album, style: playListTitleBgLightColorTextStyle,)
            ],
          ),
          leading: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Row(
              children: [
                InkWell(
                  onTap: (){
                    Navigator.pop(context);
                  },
                  child: Container(
                    padding: const EdgeInsets.all(6.0),
                    child: const Icon(Icons.keyboard_arrow_down_rounded),
                  ),
                ),
              ],
            ),
          ),
          actions: const [
            Icon(Icons.more_vert, color: kBgLightColor,),
            SizedBox(width: 20.0),
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
                  const SizedBox(height: 190,),
                  Padding(
                      padding: EdgeInsets.all(Responsive.isMobile(context)?kDefaultPaddingAllSmall:kDefaultPadding),
                      child:  Image.network(
                        widget.trackInfo!.imageURL,
                        height: 350.0,
                        width: 350.0,
                        fit: BoxFit.cover,
                      ),
                    ),
                 const SizedBox(height: 50,),
                 Text(widget.trackInfo!.title, style: titleBgLightColorTextStyle,),
                 Text(widget.trackInfo!.artist, style: currentDisplayArtistGrayColorTextStyle,)
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
