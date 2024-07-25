import 'dart:async';
import 'package:flame/collisions.dart';
import 'package:flame/components.dart';
import 'package:flame_audio/flame_audio.dart';
import 'package:realm_of_patternia/components/objectives.dart';
import 'package:realm_of_patternia/realm_of_patternia.dart';

class obsv_comp extends SpriteAnimationComponent with HasGameRef<Realm_of_Patternia>{
  final String _name;
  obsv_comp( { position, required String name, super.key}): _name = name, super (position: position, );
  
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
    animation = SpriteAnimation.fromFrameData(game.images.fromCache('Pattern_Components/Items/News_scroll.png'), 
    SpriteAnimationData.sequenced(amount: 1, stepTime: stepTime, textureSize: Vector2.all(128))); 
    return super.onLoad();

  }


  void collecting(){
    //priority = game.player_priority+1;
    if(!collected){
      FlameAudio.bgm.play('one_time_sounds/collect.mp3');
      if(obs_comps_num==0){ObserverSW.start();}
      game.overlays.remove('DialogueOverlay');
      ObserverComps[int.parse(_name)]=true;
      obs_comps_num += 1;
      animation= _spriteAniamtion(13, 7);
      collected = true;
      String part_name = obse_strcut[int.parse(_name)];
      game.DialogueSpeaker='Hero';
      game.DialogMessage='Collected $part_name component!';
    }
    Future.delayed(const Duration(milliseconds: 700),
    ()=> removeFromParent(),);

    Future.delayed(const Duration(milliseconds: 100),
    () => game.overlays.add('DialogueOverlay'),);
  }
  SpriteAnimation _spriteAniamtion(double row, int amount){
    return SpriteAnimation.fromFrameData(
      game.images.fromCache('Pattern_Components/Items/Items_Despawn.png'), 
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