import 'dart:async';

import 'package:flame/collisions.dart';
import 'package:flame/components.dart';
import 'package:flame_audio/flame_audio.dart';
import 'package:realm_of_patternia/components/objectives.dart';
import 'package:realm_of_patternia/realm_of_patternia.dart';

class GolemFactory extends SpriteAnimationComponent with HasGameRef<Realm_of_Patternia>{
  GolemFactory({postion,size}) : super (position: postion, size: size);
  final double stepTime = 0.1;
  bool fixed = false;

  PolygonHitbox FHB=PolygonHitbox([Vector2(0, 0),Vector2(0, 0),Vector2(0, 0),Vector2(0, 0),]);
  PolygonHitbox HB =PolygonHitbox([Vector2(0, 0),Vector2(0, 0),Vector2(0, 0),Vector2(0, 0),]);

  @override
  FutureOr<void> onLoad() {
    //debugMode=true;
    priority = 3;
    position.y+=64;
    
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
        Vector2(60, 60),
        Vector2(54, 46+64),
        Vector2(28, 60+64),
        Vector2(16, 80+64),
        Vector2(16, 120+64),
        Vector2(34, 140+64),
        Vector2(34, 180+64),
        Vector2(28, 180+64),
        Vector2(28, 220+64),
        Vector2(size.x-28, 220+64),
        Vector2(size.x-28, 180+64),
        Vector2(size.x-34, 180+64),
        Vector2(size.x-34, 140+64),
        Vector2(size.x-16, 120+64),
        Vector2(size.x-16, 80+64),
        Vector2(size.x-28, 60+64),
        Vector2(size.x-54, 46+64),
        Vector2(size.x-60, 60),
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
    if (!fixed && fac_comps_num==4){
      game.chal=0;
      game.overlays.add('PatternBuilderOverlay');
      close_function=building_fixed;      
      
    }

  }
  void building_fixed() async{
    if( factoryCompsTask[0]==true && factoryCompsTask[1]==true && factoryCompsTask[2]==true && factoryCompsTask[3]==true){
      FlameAudio.bgm.play('one_time_sounds/construction.mp3');
      for (final g in golems){
        if (g.name == 'Blue'){
          g.Blue_Golem();
        }else if(g.name == 'Yellow'){
          g.Yellow_Golem();
        }
      }
      
      FactoryQB[2].SpawnBuilder();
      FactoryQB[3].SpawnBuilder();
      FactoryQB[1].SpawnBuilder();
      Future.delayed(Duration(milliseconds: 2000),(){
        FactoryQB[0].SpawnBuilder();
        FactoryQB[4].SpawnBuilder();
        animation = SpriteAnimation.fromFrameData(game.images.fromCache('Factions/Knights/Buildings/Castle/Castle_Construction.png'),
          SpriteAnimationData.sequenced(amount: 1, stepTime: stepTime, textureSize: Vector2(size.x,size.y))
          );
      });
      Future.delayed(Duration(milliseconds: 5000),(){
        FHB.collisionType=CollisionType.inactive;
        HB.collisionType=CollisionType.active;
        FactoryQB[0].SpawnBuilderHidden();
        FactoryQB[4].SpawnBuilderHidden();
        FactoryQB[2].BuilderFinished();
        FactoryQB[3].BuilderFinished();
        FactoryQB[1].BuilderFinished();

        position.y-=64;
        
        animation = SpriteAnimation.fromFrameData(game.images.fromCache('Factions/Knights/Buildings/Castle/Yellow_Golem_Factory.png'),
          SpriteAnimationData.sequenced(amount: 1, stepTime: stepTime, textureSize: Vector2(size.x,size.y))
          );
      });
      
      completed_pats[0]=true;
      num_comp_pats+=1;
      fixed=true;
    }
  }

  


  
}