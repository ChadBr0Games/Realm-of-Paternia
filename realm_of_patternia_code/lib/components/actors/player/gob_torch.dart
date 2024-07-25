import 'dart:async';

import 'package:flame/collisions.dart';
import 'package:flame/components.dart';
import 'package:realm_of_patternia/realm_of_patternia.dart';

class Gob_Torch extends SpriteAnimationComponent with HasGameRef<Realm_of_Patternia>{
  Gob_Torch({required this.name,position}):super(position: position);
  final String name;

  @override
  FutureOr<void> onLoad() {
    priority = game.player_priority+1;

    position.x-=64;
    position.y-=64;
    //debugMode= true;
    add(RectangleHitbox(
      position: position,
      size: Vector2.all(64),
      collisionType: CollisionType.passive
    ));
    if (name =='Purple'){
      animation = SpriteAnimation.fromFrameData(game.images.fromCache('Factions/Goblins/Troops/Torch/Purple/Torch_Purple.png'), SpriteAnimationData.sequenced(
      amount: 6,
      stepTime: 0.1, 
      textureSize: Vector2.all(192)));
    }else if (name =='Red'){
      animation = SpriteAnimation.fromFrameData(game.images.fromCache('Factions/Goblins/Troops/Torch/Red/Torch_Red.png'), SpriteAnimationData.sequenced(
      amount: 6,
      stepTime: 0.1, 
      textureSize: Vector2.all(192)));
    }else if (name =='Blue'){
      animation = SpriteAnimation.fromFrameData(game.images.fromCache('Factions/Goblins/Troops/Torch/Blue/Torch_Blue.png'), SpriteAnimationData.sequenced(
      amount: 6,
      stepTime: 0.1, 
      textureSize: Vector2.all(192)));
    }else if (name =='Yellow'){
      animation = SpriteAnimation.fromFrameData(game.images.fromCache('Factions/Goblins/Troops/Torch/Yellow/Torch_Yellow.png'), SpriteAnimationData.sequenced(
      amount: 6,
      stepTime: 0.1, 
      textureSize: Vector2.all(192)));
    }else {
    animation = SpriteAnimation.fromFrameData(game.images.fromCache('Factions/Goblins/Troops/Torch/Red/Torch_Red.png'), SpriteAnimationData.sequenced(
      amount: 6,
      stepTime: 0.1, 
      textureSize: Vector2.all(192)));}
    return super.onLoad();
  }
}