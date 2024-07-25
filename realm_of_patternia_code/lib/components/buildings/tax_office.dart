import 'dart:async';

import 'package:flame/collisions.dart';
import 'package:flame/components.dart';
import 'package:flame_audio/flame_audio.dart';
import 'package:realm_of_patternia/components/objectives.dart';
import 'package:realm_of_patternia/realm_of_patternia.dart';

class TaxOffice extends SpriteAnimationComponent with HasGameRef<Realm_of_Patternia>{
  TaxOffice({postion,size}) : super (position: postion, size: size);
  final double stepTime = 0.1;
  bool fixed = false;


  @override
  FutureOr<void> onLoad() {
    //debugMode=true;
    priority = 3;
    add(PolygonHitbox(
      [
        Vector2(54, 46),
        Vector2(28, 60),
        Vector2(16, 80),
        Vector2(16, 120),
        Vector2(34, 140),
        Vector2(34, 180),
        Vector2(28, 180),
        Vector2(28, 220),
        Vector2(size.x-28, 220),
        Vector2(size.x-28, 180),
        Vector2(size.x-34, 180),
        Vector2(size.x-34, 140),
        Vector2(size.x-16, 120),
        Vector2(size.x-16, 80),
        Vector2(size.x-28, 60),
        Vector2(size.x-54, 46),
      ],
      isSolid: true
    ));
    
    return super.onLoad();
  }

  void fixing() async{
    if (!fixed && sing_comps_num==2){
      game.chal=1;
      game.overlays.add('PatternBuilderOverlay');
      close_function=building_fixed;
      
      
    }

  }
  void building_fixed() async{
    if( SingletonComps[0]==true && SingletonComps[1]==true){
      FlameAudio.bgm.play('one_time_sounds/tax.mp3');
      SingletonQB[0].BuilderFinished();
      SingletonQB[1].BuilderFinished();
      completed_pats[1]=true;
      num_comp_pats+=1;
      fixed=true;
    }
  }
}