
import 'package:flutter/widgets.dart';
import 'package:realm_of_patternia/components/Dialogue/starting_dialogue.dart';
import 'package:realm_of_patternia/components/objectives.dart';
import 'package:realm_of_patternia/realm_of_patternia.dart';
import 'package:realm_of_patternia/components/menus/menu_button.dart';

class StartMenuOverlay extends StatelessWidget {
  const StartMenuOverlay({super.key, required this.game});

  final Realm_of_Patternia game;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Image.asset('assets/images/UI/Banners/Realm_of_patternia.png'),
          MenuButton(text: 'START GAME',onPress: startGame,),
          SizedBox(height: 20),
          MenuButton(text: 'OPTIONS', onPress: option,),
          SizedBox(height: 20, width: 100,),
          MenuButton(text: 'STATS', onPress: stats,),
          SizedBox(height: 20, width: 100,),
          MenuButton(text: 'EXIT GAME', onPress: test,),
        ],
      ),
    );
  }
  void startGame(){
    game.overlays.remove('StartMenuOverlay');
    game.GamePaused=false;
    //GameSW.start();
    //start_delay(game);
  }
  void stats(){
    game.overlays.add('StatsOverlay');
  }
  void option(){
    game.overlays.add('OptionsOverlay');
  }
  
  
  void test(){}
}