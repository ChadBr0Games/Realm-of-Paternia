import 'dart:async';

import 'package:flame/collisions.dart';
import 'package:flame/components.dart';
import 'package:realm_of_patternia/realm_of_patternia.dart';

class Gob_Tower extends SpriteAnimationComponent with HasGameRef<Realm_of_Patternia>{
  Gob_Tower({required this.name,size,position}):super(position: position,size:size);
  final String name;

  @override
  FutureOr<void> onLoad() {
    priority = game.player_priority+1;

    //debugMode= true;
    add(RectangleHitbox(
      position: Vector2.zero(),
      size: size,
      collisionType: CollisionType.passive
    ));
    if (name =='Purple'){
      animation = SpriteAnimation.fromFrameData(game.images.fromCache('Factions/Goblins/Buildings/Wood_Tower/Wood_Tower_Purple.png'), SpriteAnimationData.sequenced(
      amount: 4,
      stepTime: 0.1, 
      textureSize: size));
    }else if (name =='Red'){
      animation = SpriteAnimation.fromFrameData(game.images.fromCache('Factions/Goblins/Buildings/Wood_Tower/Wood_Tower_Red.png'), SpriteAnimationData.sequenced(
      amount: 4,
      stepTime: 0.1, 
      textureSize: size));
    }else if (name =='Blue'){
      animation = SpriteAnimation.fromFrameData(game.images.fromCache('Factions/Goblins/Buildings/Wood_Tower/Wood_Tower_Blue.png'), SpriteAnimationData.sequenced(
      amount: 4,
      stepTime: 0.1, 
      textureSize: size));
    }else if (name =='Yellow'){
      animation = SpriteAnimation.fromFrameData(game.images.fromCache('Factions/Goblins/Buildings/Wood_Tower/Wood_Tower_Yellow.png'), SpriteAnimationData.sequenced(
      amount: 4,
      stepTime: 0.1, 
      textureSize: size));
    }else {
    animation = SpriteAnimation.fromFrameData(game.images.fromCache('Factions/Goblins/Buildings/Wood_Tower/Wood_Tower_Purple.png'), SpriteAnimationData.sequenced(
      amount: 4,
      stepTime: 0.1, 
      textureSize: size));}
    return super.onLoad();
  }
}