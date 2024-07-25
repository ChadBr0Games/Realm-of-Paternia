import 'dart:async';
import 'package:flame/collisions.dart';
import 'package:flame/components.dart';
//import 'package:realm_of_patternia/components/objectives.dart';
import 'package:realm_of_patternia/realm_of_patternia.dart';

class Orbs extends SpriteAnimationComponent with HasGameRef<Realm_of_Patternia>{
  Orbs( { position,  super.key}):super (position: position, );
  
  final double stepTime = 0.1;
  bool collected= false;

  @override
  FutureOr<void> onLoad() {
    //debugMode=true;
    priority = game.player_priority-1;
    
    add(RectangleHitbox(
      position: Vector2.all(0),
      size: Vector2.all(64),
    ));
    no_Orbs();
    return super.onLoad();

  }


  void no_Orbs(){
    animation= _spriteAniamtion(4,1);
    
  }
  void News_Orbs(){
    animation= _spriteAniamtion(0,4);
    
  }
  void Weather_Orbs(){
    animation=_spriteAniamtion(1,4);
    
  }
  void Both_Orbs(){
    animation= _spriteAniamtion(2,8);
    
  }


  SpriteAnimation _spriteAniamtion(double row, int amount){
    return SpriteAnimation.fromFrameData(
      game.images.fromCache('Pattern_Components/Items/Orbs.png'), 
      SpriteAnimationData.sequenced(
        amount: amount, 
        stepTime: 0.1, 
        textureSize: Vector2.all(64),
        //postion on the sprite sheet increase y value to go to next line 
        texturePosition: Vector2(0,64*row)
        ),
      );
  }
}