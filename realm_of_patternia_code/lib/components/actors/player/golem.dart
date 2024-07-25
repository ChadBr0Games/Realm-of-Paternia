import 'dart:async';
import 'package:flame/collisions.dart';
import 'package:flame/components.dart';
import 'package:realm_of_patternia/realm_of_patternia.dart';

class Golem extends SpriteAnimationComponent with HasGameRef<Realm_of_Patternia>{
  String name;
  Golem( { required this.name, position,  super.key}):super (position: position, );
  
  final double stepTime = 0.1;
  bool collected= false;

  @override
  FutureOr<void> onLoad() {
    //debugMode=true;
    priority = game.player_priority-1;
    
    add(RectangleHitbox(
      position: Vector2.all(0),
      size: Vector2.all(192),
    ));
    no_Golems();
    return super.onLoad();

  }


  void no_Golems(){
    animation= _spriteAniamtion(3,1);
    
  }
  void Yellow_Golem(){
    animation= _spriteAniamtion(0,4);
    
  }
  void Blue_Golem(){
    animation=_spriteAniamtion(1,4);
    
  }
  void Both_Orbs(){
    animation= _spriteAniamtion(2,8);
    
  }


  SpriteAnimation _spriteAniamtion(double row, int amount){
    return SpriteAnimation.fromFrameData(
      game.images.fromCache('Factions/Knights/Troops/Golem/Golems_idle.png'), 
      SpriteAnimationData.sequenced(
        amount: amount, 
        stepTime: 0.25, 
        textureSize: Vector2.all(192),
        //postion on the sprite sheet increase y value to go to next line 
        texturePosition: Vector2(0,192*row)
        ),
      );
  }
}