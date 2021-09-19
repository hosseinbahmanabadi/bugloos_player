import 'package:bugloos_player/components/data.dart';
import 'package:flutter/material.dart';
import 'package:audioplayers/audioplayers.dart';


class ManagePageState with ChangeNotifier{

  String _pageItems = "home";
  Song? selected;
  List trackIdFavoriteList = [];
  AudioPlayer advancedPlayer = AudioPlayer();
  Duration _duration = Duration();
  Duration _position = Duration();
  bool isPlayPressed = false;
  double setToChangeDouble = 0.0;
  get pageItems => _pageItems;
  get duration => _duration;
  get position => _position;

  void pageChange(item) {
    _pageItems = item;
    notifyListeners();
  }
  void selectTrack(Song track) {
    selected = track;
    notifyListeners();
    changeTrackAudio(selected!.audioURL);

  }
  void favoriteTrack(trackId) {
    if(trackIdFavoriteList.contains(trackId)){
      trackIdFavoriteList.remove(trackId);
    }
    else{
      trackIdFavoriteList.add(trackId);
    }
    notifyListeners();
  }
  void seekToSecond(int second) {
    Duration newDuration = Duration(seconds: second);
    advancedPlayer.seek(newDuration);
    notifyListeners();
  }
  void setChangedAudio(){
    Duration newDuration = const Duration(seconds: 0);
    advancedPlayer.seek(newDuration);
    notifyListeners();
  }
  void changeAudioPlayPause(audioURL){
    isPlayPressed = !isPlayPressed;
    if (isPlayPressed == true) {
      if(advancedPlayer.state == PlayerState.PAUSED){
        advancedPlayer.resume();
      }
      else {
        advancedPlayer.play(audioURL, isLocal: false);
      }
    } else {
      advancedPlayer.pause();
    }
    advancedPlayer.onDurationChanged.listen((Duration d) {

       _duration = d;
       notifyListeners();
    });
    advancedPlayer.onAudioPositionChanged.listen((Duration  p){
        _position = p;
        notifyListeners();
    });
    advancedPlayer.onPlayerStateChanged.listen((PlayerState s) {
      if(s == PlayerState.COMPLETED || s == PlayerState.PAUSED || s == PlayerState.STOPPED){
        isPlayPressed = false;
      }
      else if(s == PlayerState.PLAYING){
        isPlayPressed = true;
      }
      notifyListeners();
    });
    notifyListeners();
  }
  void changeTrackAudio(audioURL){
        isPlayPressed = false;
        advancedPlayer.stop();
        notifyListeners();
        advancedPlayer.play(audioURL);
    advancedPlayer.onDurationChanged.listen((Duration d) {

      _duration = d;
      notifyListeners();
    });
    advancedPlayer.onAudioPositionChanged.listen((Duration  p){
      _position = p;
      notifyListeners();
    });
      advancedPlayer.onPlayerStateChanged.listen((PlayerState s) {
        if(s == PlayerState.COMPLETED || s == PlayerState.PAUSED || s == PlayerState.STOPPED){
          isPlayPressed = false;
        }
        else if(s == PlayerState.PLAYING){
          isPlayPressed = true;
        }
        notifyListeners();
      });
    notifyListeners();
  }
  void nextTrack(audio){
  int currentAudio = ebiLalehzarPlaylist.songs.indexOf(audio);
  if(currentAudio+1 == ebiLalehzarPlaylist.songs.length){
    selectTrack(ebiLalehzarPlaylist.songs.first);
   }
  else{
    selectTrack(ebiLalehzarPlaylist.songs[currentAudio+1]);
   }
  }
  void prevTrack(audio){
    int currentAudio = ebiLalehzarPlaylist.songs.indexOf(audio);
    if(currentAudio == 0){
      selectTrack(ebiLalehzarPlaylist.songs.last);
    }
    else{
      selectTrack(ebiLalehzarPlaylist.songs[currentAudio-1]);
    }
  }

}
