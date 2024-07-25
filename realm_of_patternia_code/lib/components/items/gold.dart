import 'dart:async';
import 'package:flame/collisions.dart';
import 'package:flame/components.dart';
import 'package:flame_audio/flame_audio.dart';
import 'package:realm_of_patternia/realm_of_patternia.dart';

class Gold extends SpriteAnimationComponent with HasGameRef<Realm_of_Patternia>{
  Gold({position}) : super (position: position);
  
  final double stepTime = 0.05;
  bool collected= false;

  @override
  FutureOr<void> onLoad() {
    //debugMode=true;
    priority = game.player_priority-1;
    
    add(RectangleHitbox(
      position: Vector2.all(40),
      size: Vector2.all(56),
    ));
    animation = SpriteAnimation.fromFrameData(game.images.fromCache('Resources/Resources/G_Idle.png'), 
    SpriteAnimationData.sequenced(amount: 1, stepTime: stepTime, textureSize: Vector2.all(128)));
    
    return super.onLoad();
  }


  void collecting(){
    //priority = game.player_priority+1;
    if(!collected){
      FlameAudio.bgm.play('one_time_sounds/collect.mp3');
      animation= _spriteAniamtion(1, 7);
      collected = true;
    }
    Future.delayed(const Duration(milliseconds: 700),
    ()=> removeFromParent(),);
  }
  SpriteAnimation _spriteAniamtion(double row, int amount){
    return SpriteAnimation.fromFrameData(
      game.images.fromCache('Resources/Resources/G_Spawn.png'), 
      SpriteAnimationData.sequenced(
        amount: amount, 
        stepTime: 0.1, 
        textureSize: Vector2.all(128),
        //postion on the sprite sheet increase y value to go to next line 
        texturePosition: Vector2(0,128*row)
        ),
      );
  }
}