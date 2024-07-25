// ignore_for_file: non_constant_identifier_names

import 'dart:async';

import 'package:flame/collisions.dart';
import 'package:flame/components.dart';
import 'package:flame_audio/flame_audio.dart';
import 'package:realm_of_patternia/components/objectives.dart';
import 'package:realm_of_patternia/realm_of_patternia.dart';

class MagicalLibrary extends SpriteAnimationComponent with HasGameRef<Realm_of_Patternia>{
  MagicalLibrary({postion,size}) : super (position: postion, size: size);
  final double stepTime = 0.1;
  bool fixed = false; 
  RectangleHitbox building_hitbox = RectangleHitbox(
      position: Vector2(0,-64),
      size: Vector2(5*64,4*64),
      isSolid: true
    );
  PolygonHitbox FHB=PolygonHitbox([Vector2(0, 0),Vector2(0, 0),Vector2(0, 0),Vector2(0, 0),]);
  PolygonHitbox HB =PolygonHitbox([Vector2(0, 0),Vector2(0, 0),Vector2(0, 0),Vector2(0, 0),]);

  @override
  FutureOr<void> onLoad() {
    //debugMode=true;
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
    if (!fixed && faca_comps_num == 4){
      game.chal=5;
      game.overlays.add('PatternBuilderOverlay');
      close_function=building_fixed;      
      
    }

  }
  void building_fixed() async{
    if (FacadeComps[0]==true && FacadeComps[1]==true && FacadeComps[2]==true && FacadeComps[3]==true){
      FlameAudio.bgm.play('one_time_sounds/construction.mp3');
      FacadeQB[2].SpawnBuilder();
      FacadeQB[3].SpawnBuilder();
      FacadeQB[4].SpawnBuilder();
      
      Future.delayed(Duration(milliseconds: 2000),(){
        FacadeQB[0].SpawnBuilder();
        FacadeQB[1].SpawnBuilder();
        animation = SpriteAnimation.fromFrameData(game.images.fromCache('Factions/Knights/Buildings/Castle/Castle_Construction.png'),
          SpriteAnimationData.sequenced(amount: 1, stepTime: stepTime, textureSize: Vector2(size.x,size.y))
          );
      });
      
      Future.delayed(Duration(milliseconds: 5000),(){
        position.x+=-3;
        FHB.collisionType=CollisionType.inactive;
        HB.collisionType=CollisionType.active;
        
        FacadeQB[0].SpawnBuilderHidden();
        FacadeQB[1].SpawnBuilderHidden();
        FacadeQB[2].BuilderFinished();
        FacadeQB[3].BuilderFinished();
        FacadeQB[4].BuilderFinished();

        animation = SpriteAnimation.fromFrameData(game.images.fromCache('Factions/Knights/Buildings/Castle/Blue_Magical_Library.png'),
          SpriteAnimationData.sequenced(amount: 1, stepTime: stepTime, textureSize: Vector2(size.x,size.y))
          );
      });
      completed_pats[5]=true ;
      num_comp_pats+=1;
      fixed=true;
    }
  }
}