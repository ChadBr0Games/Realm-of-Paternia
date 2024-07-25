import 'package:flame/flame.dart';
import 'package:flame/game.dart';
import 'package:flutter/material.dart';
import 'package:realm_of_patternia/components/overlays/compassOverlay.dart';
import 'package:realm_of_patternia/components/overlays/dialogueOverlay.dart';
import 'package:realm_of_patternia/components/overlays/helpOverlay.dart';
import 'package:realm_of_patternia/components/overlays/optionsOverlay.dart';
import 'package:realm_of_patternia/components/overlays/patternBookOverlay.dart';
import 'package:realm_of_patternia/components/overlays/patternBuilderOverlay.dart';
import 'package:realm_of_patternia/components/overlays/pauseMenuOverlay.dart';
import 'package:realm_of_patternia/components/overlays/startMenuOverlay.dart';
import 'package:realm_of_patternia/components/overlays/statsOverlay.dart';
import 'package:realm_of_patternia/realm_of_patternia.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Flame.device.fullScreen();
  await Flame.device.setLandscape();
  Realm_of_Patternia game = Realm_of_Patternia();
  
  runApp(MaterialApp(
    home: Scaffold(
      body: GameWidget(
        game: game,
        
        overlayBuilderMap: {
          'CompassOverlay': (BuildContext context, Realm_of_Patternia game) {
            return CompassOverlay(game: game);
          },
          'StartMenuOverlay': (BuildContext context, Realm_of_Patternia game) {
            return StartMenuOverlay(game: game);
          },
          'PauseMenuOverlay': (BuildContext context, Realm_of_Patternia game) {
            return PauseMenuOverlay(game: game);
          },
          'StatsOverlay': (BuildContext context, Realm_of_Patternia game) {
            return StatsOverlay(game: game);
          },
          'OptionsOverlay': (BuildContext context, Realm_of_Patternia game) {
            return OptionsOverlay(game: game);
          },
          'HelpOverlay': (BuildContext context, Realm_of_Patternia game) {
            return HelpOverlay(game: game);
          },
          'PatternBookOverlay': (BuildContext context, Realm_of_Patternia game){
            return PatternBookOverlay(game:game);
          },
          'DialogueOverlay': (BuildContext context, Realm_of_Patternia game) {
            return DialogueOverlay(game: game);
          },
          'PatternBuilderOverlay':(BuildContext context, Realm_of_Patternia game){
            return PatternBuilderOverlay(game:game);
          },
        },
        ),
    )
      )
      );
}
