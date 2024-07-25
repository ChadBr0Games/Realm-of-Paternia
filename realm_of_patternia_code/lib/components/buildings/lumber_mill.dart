// ignore_for_file: non_constant_identifier_names

import 'dart:async';

import 'package:flame/collisions.dart';
import 'package:flame/components.dart';
import 'package:flame_audio/flame_audio.dart';
import 'package:realm_of_patternia/components/objectives.dart';
import 'package:realm_of_patternia/realm_of_patternia.dart';

class LumberMill extends SpriteAnimationComponent with HasGameRef<Realm_of_Patternia>{
  LumberMill({postion,size}) : super (position: postion, size: size);
  final double stepTime = 0.1;
  bool fixed = false;
  PolygonHitbox FHB=PolygonHitbox([Vector2(0, 0),Vector2(0, 0),Vector2(0, 0),Vector2(0, 0),]);
  PolygonHitbox HB =PolygonHitbox([Vector2(0, 0),Vector2(0, 0),Vector2(0, 0),Vector2(0, 0),]);


  @override
  FutureOr<void> onLoad() {
    debugMode=true;
    priority = 3;
    FHB = PolygonHitbox(
      [
        
        Vector2(60, 138),
        Vector2(26, 155),
        Vector2(0, 190),
        Vector2(18, 220),
        Vector2(size.x-18, 220),
        Vector2(size.x, 180),
        Vector2(size.x-16, 145),
        Vector2(size.x-60, 138),
        
      ],
      isSolid: true
    );
    add(FHB);
    HB=PolygonHitbox(
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
      isSolid: true,
      collisionType: CollisionType.inactive
    );
    add(HB);
    animation = SpriteAnimation.fromFrameData(game.images.fromCache('Factions/Knights/Buildings/Castle/Castle_Destroyed.png'),
      SpriteAnimationData.sequenced(amount: 1, stepTime: stepTime, textureSize: Vector2(size.x,size.y))
      );
    return super.onLoad();
  }

  void fixing() async{
    if (!fixed && chain_comps_num == 4){
      game.chal=4;
      game.overlays.add('PatternBuilderOverlay');
      close_function=building_fixed;      
      
    }

  }

  void building_fixed() async{
    if(ChainComps[0]==true && ChainComps[1]==true && ChainComps[2]==true && ChainComps[3]==true ){
      FlameAudio.bgm.play('one_time_sounds/construction.mp3');
      ChainQB[1].SpawnBuilder();
      ChainQB[2].SpawnBuilder();
      ChainQB[3].SpawnBuilder();
      Future.delayed(Duration(milliseconds: 2000),(){
        ChainQB[0].SpawnBuilder();
        ChainQB[4].SpawnBuilder();
        animation = SpriteAnimation.fromFrameData(game.images.fromCache('Factions/Knights/Buildings/Castle/Castle_Construction.png'),
          SpriteAnimationData.sequenced(amount: 1, stepTime: stepTime, textureSize: Vector2(size.x,size.y))
          );
      });
      
      Future.delayed(Duration(milliseconds: 5000),(){
        FHB.collisionType=CollisionType.inactive;
        HB.collisionType=CollisionType.active;

        ChainQB[0].SpawnBuilderHidden();
        ChainQB[4].SpawnBuilderHidden();
        ChainQB[1].BuilderFinished();
        ChainQB[2].BuilderFinished();
        ChainQB[3].BuilderFinished();
        animation = SpriteAnimation.fromFrameData(game.images.fromCache('Factions/Knights/Buildings/Castle/Purple_Sawmill.png'),
          SpriteAnimationData.sequenced(amount: 1, stepTime: stepTime, textureSize: Vector2(size.x,size.y))
          );
      });
      completed_pats[4]=true ;
      num_comp_pats+=1;
      fixed=true;
      
    }
  }
}