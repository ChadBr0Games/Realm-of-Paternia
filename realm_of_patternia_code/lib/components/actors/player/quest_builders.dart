import 'dart:async';

import 'package:flame/collisions.dart';
import 'package:flame/components.dart';
import 'package:realm_of_patternia/components/objectives.dart';
import 'package:realm_of_patternia/realm_of_patternia.dart';

class Quest_Builders extends SpriteAnimationComponent with HasGameRef<Realm_of_Patternia>{
  Quest_Builders({required this.flip, required this.name, position}):super(position: position);
  final String name;
  final bool flip;

  @override
  FutureOr<void> onLoad() {
    
    position.y-=64;
    if (flip){
      flipHorizontally();
      position.x+=128;
    }else{
      position.x-=64;
    }
    priority = game.player_priority+1;

    
    //debugMode= true;
    
    SpawnBuilderHidden();
    return super.onLoad();
  }

  void Greeting(){
    game.overlays.remove('DialogueOverlay');
    if (!completed_pats[0]){
      game.DialogMessage='Hey Stranger.';
    }
    else{
      game.DialogMessage='Thank you for your help hero.';
    }
    Future.delayed(const Duration(milliseconds: 100),
    () => game.overlays.add('DialogueOverlay'),);
  }
  void SpawnBuilder(){
    if (name =='Purple'){
    animation = SpriteAnimation.fromFrameData(game.images.fromCache('Factions/Knights/Troops/Pawn/Purple/Pawn_Purple.png'), SpriteAnimationData.sequenced(
      amount: 6,
      stepTime: 0.1, 
      texturePosition: Vector2(0,192*2),
      textureSize: Vector2.all(192)));
    }
    else if (name =='Red'){
    animation = SpriteAnimation.fromFrameData(game.images.fromCache('Factions/Knights/Troops/Pawn/Red/Pawn_Red.png'), SpriteAnimationData.sequenced(
      amount: 6,
      stepTime: 0.1,
      texturePosition: Vector2(0,192*2),  
      textureSize: Vector2.all(192)));
    }
    else if (name =='Blue'){
    animation = SpriteAnimation.fromFrameData(game.images.fromCache('Factions/Knights/Troops/Pawn/Blue/Pawn_Blue.png'), SpriteAnimationData.sequenced(
      amount: 6,
      stepTime: 0.1, 
      texturePosition: Vector2(0,192*2),
      textureSize: Vector2.all(192)));
    }
    else if (name =='Yellow'){
    animation = SpriteAnimation.fromFrameData(game.images.fromCache('Factions/Knights/Troops/Pawn/Yellow/Pawn_Yellow.png'), SpriteAnimationData.sequenced(
      amount: 6,
      stepTime: 0.1, 
      texturePosition: Vector2(0,192*2),
      textureSize: Vector2.all(192)));
    }
    else{
      animation = SpriteAnimation.fromFrameData(game.images.fromCache('Factions/Knights/Troops/Pawn/Purple/Pawn_Purple.png'), SpriteAnimationData.sequenced(
      amount: 6,
      stepTime: 0.1, 
      texturePosition: Vector2(0,192*2),
      textureSize: Vector2.all(192)));
    }
  }

  void SpawnBuilderHidden(){
    if (name =='Purple'){
    animation = SpriteAnimation.fromFrameData(game.images.fromCache('Factions/Knights/Troops/Pawn/Purple/Pawn_Purple.png'), SpriteAnimationData.sequenced(
      amount: 6,
      stepTime: 0.1, 
      texturePosition: Vector2(0,192*6),
      textureSize: Vector2.all(192)));
    }
    else if (name =='Red'){
    animation = SpriteAnimation.fromFrameData(game.images.fromCache('Factions/Knights/Troops/Pawn/Red/Pawn_Red.png'), SpriteAnimationData.sequenced(
      amount: 6,
      stepTime: 0.1,
      texturePosition: Vector2(0,192*6),  
      textureSize: Vector2.all(192)));
    }
    else if (name =='Blue'){
    animation = SpriteAnimation.fromFrameData(game.images.fromCache('Factions/Knights/Troops/Pawn/Blue/Pawn_Blue.png'), SpriteAnimationData.sequenced(
      amount: 6,
      stepTime: 0.1, 
      texturePosition: Vector2(0,192*6),
      textureSize: Vector2.all(192)));
    }
    else if (name =='Yellow'){
    animation = SpriteAnimation.fromFrameData(game.images.fromCache('Factions/Knights/Troops/Pawn/Yellow/Pawn_Yellow.png'), SpriteAnimationData.sequenced(
      amount: 6,
      stepTime: 0.1, 
      texturePosition: Vector2(0,192*6),
      textureSize: Vector2.all(192)));
    }
    else{
      animation = SpriteAnimation.fromFrameData(game.images.fromCache('Factions/Knights/Troops/Pawn/Purple/Pawn_Purple.png'), SpriteAnimationData.sequenced(
      amount: 6,
      stepTime: 0.1, 
      texturePosition: Vector2(0,192*6),
      textureSize: Vector2.all(192)));
    }
  }

  void BuilderFinished(){
    add(RectangleHitbox(
      position: Vector2.all(51),
      size: Vector2.all(90),
      isSolid: true
    ));
    if (name =='Purple'){
    animation = SpriteAnimation.fromFrameData(game.images.fromCache('Factions/Knights/Troops/Pawn/Purple/Pawn_Purple.png'), SpriteAnimationData.sequenced(
      amount: 6,
      stepTime: 0.1, 
      texturePosition: Vector2(0,192*4),
      textureSize: Vector2.all(192)));
    }
    else if (name =='Red'){
    animation = SpriteAnimation.fromFrameData(game.images.fromCache('Factions/Knights/Troops/Pawn/Red/Pawn_Red.png'), SpriteAnimationData.sequenced(
      amount: 6,
      stepTime: 0.1,
      texturePosition: Vector2(0,192*4),  
      textureSize: Vector2.all(192)));
    }
    else if (name =='Blue'){
    animation = SpriteAnimation.fromFrameData(game.images.fromCache('Factions/Knights/Troops/Pawn/Blue/Pawn_Blue.png'), SpriteAnimationData.sequenced(
      amount: 6,
      stepTime: 0.1, 
      texturePosition: Vector2(0,192*4),
      textureSize: Vector2.all(192)));
    }
    else if (name =='Yellow'){
    animation = SpriteAnimation.fromFrameData(game.images.fromCache('Factions/Knights/Troops/Pawn/Yellow/Pawn_Yellow.png'), SpriteAnimationData.sequenced(
      amount: 6,
      stepTime: 0.1, 
      texturePosition: Vector2(0,192*4),
      textureSize: Vector2.all(192)));
    }
    else{
      animation = SpriteAnimation.fromFrameData(game.images.fromCache('Factions/Knights/Troops/Pawn/Purple/Pawn_Purple.png'), SpriteAnimationData.sequenced(
      amount: 6,
      stepTime: 0.1, 
      texturePosition: Vector2(0,192*4),
      textureSize: Vector2.all(192)));
    }
  }
  
}