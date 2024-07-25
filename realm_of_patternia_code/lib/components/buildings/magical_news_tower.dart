import 'dart:async';

import 'package:flame/collisions.dart';
import 'package:flame/components.dart';
import 'package:flame_audio/flame_audio.dart';
import 'package:realm_of_patternia/components/objectives.dart';
import 'package:realm_of_patternia/realm_of_patternia.dart';

class MagicalNewsTower extends SpriteAnimationComponent with HasGameRef<Realm_of_Patternia>{
  MagicalNewsTower( {required this.name,postion,size,}) : super (position: postion, size: size);
  final double stepTime = 0.1;
  final String name;
  bool fixed = false;
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
        Vector2(38, 36),
        Vector2(32, 52),
        Vector2(5, 80),
        Vector2(10, 135),
        Vector2(20, 148),
        Vector2(20, size.y-30),
        Vector2(size.x-20, size.y-30),
        Vector2(size.x-20, 148),
        Vector2(size.x-10, 135),
        Vector2(size.x-5, 80),
        Vector2(size.x-32, 52),
        Vector2(size.x-38, 36),
      ],
      isSolid: true,
      collisionType: CollisionType.inactive
    );
    add(HB);
    animation = SpriteAnimation.fromFrameData(game.images.fromCache('Factions/Knights/Buildings/Tower/Tower_Destroyed.png'),
      SpriteAnimationData.sequenced(amount: 1, stepTime: stepTime, textureSize: Vector2(size.x,size.y))
      );
    return super.onLoad();
  }

  void fixing() async{
    if (int.parse(this.name)==0){
      if (!fixed && obs_comps_num == 4){
        game.chal=2;
        game.overlays.add('PatternBuilderOverlay');
        close_function=building_fixed;
      }
      
    }else if (int.parse(this.name) == 1){
      if (!fixed && adap_comps_num == 4){
        game.chal=3;
        game.overlays.add('PatternBuilderOverlay');
        close_function=building_fixed;
          
      }
    }
  }
  void building_fixed() async{
    if (int.parse(this.name)==0){
      if(ObserverComps[0]==true && ObserverComps[0]==true && ObserverComps[0]==true && ObserverComps[0]==true){
        FlameAudio.bgm.play('one_time_sounds/construction.mp3');
        if(completed_pats[3]==true){
          for (final orb in orbs){
            orb.Both_Orbs();
          }
        }else{
          for (final orb in orbs){
            orb.News_Orbs();
          }
        }
        
        ObserverQB[1].SpawnBuilder();
        ObserverQB[2].SpawnBuilder();

        Future.delayed(Duration(milliseconds: 2000),(){
          ObserverQB[0].SpawnBuilder();
          animation = SpriteAnimation.fromFrameData(game.images.fromCache('Factions/Knights/Buildings/Tower/Tower_Construction.png'),
            SpriteAnimationData.sequenced(amount: 1, stepTime: stepTime, textureSize: Vector2(size.x,size.y))
            );
        });
        Future.delayed(Duration(milliseconds: 5000),(){
          FHB.collisionType=CollisionType.inactive;
          HB.collisionType=CollisionType.active;
          ObserverQB[0].SpawnBuilderHidden();
          ObserverQB[1].BuilderFinished();
          ObserverQB[2].BuilderFinished();

          animation = SpriteAnimation.fromFrameData(game.images.fromCache('Factions/Knights/Buildings/Tower/News_and_Weather_towers_idle.png'),
            SpriteAnimationData.sequenced(amount: 6, stepTime: stepTime, textureSize: Vector2(size.x,size.y), texturePosition: Vector2(0,size.y*0))
            );
        });
        completed_pats[2]=true ;
        num_comp_pats+=1;      
        fixed=true;
      }
      

    }else if (int.parse(this.name) == 1){
      if(AdapterComps[0]==true && AdapterComps[1]==true && AdapterComps[2]==true &&AdapterComps[3]==true){
        FlameAudio.bgm.play('one_time_sounds/construction.mp3');
        if(completed_pats[2]==true){
          for (final orb in orbs){
            orb.Both_Orbs();
          }
        }else{
          for (final orb in orbs){
            orb.Weather_Orbs();
          }
        }
        AdapterQB[0].SpawnBuilder();
        AdapterQB[2].SpawnBuilder();
        
        Future.delayed(Duration(milliseconds: 2000),(){
          AdapterQB[1].SpawnBuilder();
          animation = SpriteAnimation.fromFrameData(game.images.fromCache('Factions/Knights/Buildings/Tower/Tower_Construction.png'),
            SpriteAnimationData.sequenced(amount: 1, stepTime: stepTime, textureSize: Vector2(size.x,size.y))
            );
        });

        Future.delayed(Duration(milliseconds: 5000),(){
          FHB.collisionType=CollisionType.inactive;
          HB.collisionType=CollisionType.active;
          AdapterQB[1].SpawnBuilderHidden();
          AdapterQB[0].BuilderFinished();
          AdapterQB[2].BuilderFinished();
          animation = SpriteAnimation.fromFrameData(game.images.fromCache('Factions/Knights/Buildings/Tower/News_and_Weather_towers_idle.png'),
            SpriteAnimationData.sequenced(amount: 6, stepTime: stepTime, textureSize: Vector2(size.x,size.y), texturePosition: Vector2(0,size.y*1))
            );
        });
        completed_pats[3]=true ;
        num_comp_pats+=1;
        fixed=true;
      }
    }
        
  }
}
