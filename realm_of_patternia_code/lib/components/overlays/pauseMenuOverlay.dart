
import 'package:flutter/widgets.dart';
import 'package:realm_of_patternia/components/menus/menu_button.dart';
import 'package:realm_of_patternia/realm_of_patternia.dart';

class PauseMenuOverlay extends StatelessWidget {
  const PauseMenuOverlay({super.key, required this.game});

  final Realm_of_Patternia game;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          MenuButton(text: 'RESUME', onPress: resumeGame,),
          SizedBox(height: 20),
          MenuButton(text: 'OPTIONS', onPress: option,),
          SizedBox(height: 20, width: 100,),
          MenuButton(text: 'STATS', onPress: stats,),
          SizedBox(height: 20),
          MenuButton(text: 'EXIT', onPress: test,),
        ],
      ),
    );
  }
  void resumeGame(){
    game.GamePaused=false;
    game.overlays.remove('PauseMenuOverlay');
  }
  void stats(){
    game.overlays.add('StatsOverlay');
  }
  void option(){
    game.overlays.add('OptionsOverlay');
  }
  void test(){}
}
