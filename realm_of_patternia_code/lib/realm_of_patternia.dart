// ignore_for_file: non_constant_identifier_names

import 'dart:async';
import 'dart:ui';
import 'package:flame_audio/bgm.dart';
import 'package:flutter/widgets.dart';
import 'package:flame/components.dart';
import 'package:flame/events.dart';
import 'package:flame/game.dart';
import 'package:flame_audio/flame_audio.dart';
import 'package:realm_of_patternia/components/actors/player/player.dart';
import 'package:realm_of_patternia/components/levels/level.dart';
import 'package:realm_of_patternia/components/objectives.dart';
import 'package:realm_of_patternia/components/overlays/startMenuOverlay.dart';

class Realm_of_Patternia extends FlameGame with HasKeyboardHandlerComponents, HasCollisionDetection{
  List<String> levelNames = ['Level-00', 'Level-00'];
  Player player = Player();
  @override
  Color backgroundColor() => Color.fromARGB(255, 63, 196, 191);
  int player_priority = 100;
  bool GamePaused = true; //just incase they user wants to see game behind paused screen.
  
  int currentLevelIndex = 0;
  int chal = 0; //pattern challenge fac,obs ,etc..
  late final CameraComponent cam;
  bool voice_is_playing =false;

  Bgm test = FlameAudio.bgm;
  String DialogueSpeaker = 'Hero';
  String DialogMessage = 'huh where am i... my head hurts';
  bool show_dialogue = true;
  bool diaIsFinished = true;
  bool diaIsOpen=false;
  int dia_count=0;
  bool patternBookOpen=false;

  
  
  @override
  FutureOr<void> onLoad() async{
    //load all images and audio into cache
    await images.loadAllImages();
    await FlameAudio.audioCache.loadAll(load_audio);
    final world = Level(levelName: levelNames[currentLevelIndex], player: player);

    cam = CameraComponent.withFixedResolution(world: world,width: 1920, height: 1080);
    cam.viewfinder.anchor = Anchor.center;
    cam.follow(player);
    overlays.add('CompassOverlay');
    overlays.add('StartMenuOverlay');
    //overlays.add('StatsOverlay');
    //overlays.add('PatternBuilderOverlay');
    //overlays.add('DialogueOverlay');
    //overlays.add('PatternBookOverlay');
    
    addAll([cam,world]);
    return super.onLoad();
  }
  
}