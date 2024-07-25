import 'dart:async';

import 'package:flame/collisions.dart';
import 'package:flame/components.dart';
import 'package:realm_of_patternia/realm_of_patternia.dart';

class Knight extends SpriteAnimationComponent with HasGameRef<Realm_of_Patternia>{
  Knight({required this.name,position}):super(position: position);
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
      animation = SpriteAnimation.fromFrameData(game.images.fromCache('Factions/Knights/Troops/Warrior/Purple/Warrior_Purple.png'), SpriteAnimationData.sequenced(
      amount: 6,
      stepTime: 0.1, 
      textureSize: Vector2.all(192)));
    }else if (name =='Red'){
      animation = SpriteAnimation.fromFrameData(game.images.fromCache('Factions/Knights/Troops/Warrior/Red/Warrior_Red.png'), SpriteAnimationData.sequenced(
      amount: 6,
      stepTime: 0.1, 
      textureSize: Vector2.all(192)));
    }else if (name =='Blue'){
      animation = SpriteAnimation.fromFrameData(game.images.fromCache('Factions/Knights/Troops/Warrior/Blue/Warrior_Blue.png'), SpriteAnimationData.sequenced(
      amount: 6,
      stepTime: 0.1, 
      textureSize: Vector2.all(192)));
    }else if (name =='Yellow'){
      animation = SpriteAnimation.fromFrameData(game.images.fromCache('Factions/Knights/Troops/Warrior/Yellow/Warrior_Yellow.png'), SpriteAnimationData.sequenced(
      amount: 6,
      stepTime: 0.1, 
      textureSize: Vector2.all(192)));
    }else {
    animation = SpriteAnimation.fromFrameData(game.images.fromCache('Factions/Knights/Troops/Warrior/Red/Warrior_Red.png'), SpriteAnimationData.sequenced(
      amount: 6,
      stepTime: 0.1, 
      textureSize: Vector2.all(192)));}
    return super.onLoad();
  }
}