import 'dart:async';

import 'package:flame/collisions.dart';
import 'package:flame/components.dart';
import 'package:realm_of_patternia/realm_of_patternia.dart';

class Pawn extends SpriteAnimationComponent with HasGameRef<Realm_of_Patternia>{
  Pawn({required this.name,position}):super(position: position);
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
      collisionType: CollisionType.passive,
      isSolid: true,
    ));
    if (name =='Purple'){
    animation = SpriteAnimation.fromFrameData(game.images.fromCache('Factions/Knights/Troops/Pawn/Purple/Pawn_Purple.png'), SpriteAnimationData.sequenced(
      amount: 6,
      stepTime: 0.1, 
      textureSize: Vector2.all(192)));
    }
    else if (name =='Red'){
    animation = SpriteAnimation.fromFrameData(game.images.fromCache('Factions/Knights/Troops/Pawn/Red/Pawn_Red.png'), SpriteAnimationData.sequenced(
      amount: 6,
      stepTime: 0.1,
      textureSize: Vector2.all(192)));
    }
    else if (name =='Blue'){
    animation = SpriteAnimation.fromFrameData(game.images.fromCache('Factions/Knights/Troops/Pawn/Blue/Pawn_Blue.png'), SpriteAnimationData.sequenced(
      amount: 6,
      stepTime: 0.1, 
      textureSize: Vector2.all(192)));
    }
    else if (name =='Yellow'){
    animation = SpriteAnimation.fromFrameData(game.images.fromCache('Factions/Knights/Troops/Pawn/Yellow/Pawn_Yellow.png'), SpriteAnimationData.sequenced(
      amount: 6,
      stepTime: 0.1, 
      textureSize: Vector2.all(192)));
    }
    else if (name =='Cutter'){
    animation = SpriteAnimation.fromFrameData(game.images.fromCache('Factions/Knights/Troops/Pawn/Purple/Pawn_Purple.png'), SpriteAnimationData.sequenced(
      amount: 6,
      stepTime: 0.1, 
      textureSize: Vector2.all(192),
      texturePosition: Vector2(0, 192*3)));
    }
    else{
      animation = SpriteAnimation.fromFrameData(game.images.fromCache('Factions/Knights/Troops/Pawn/Purple/Pawn_Purple.png'), SpriteAnimationData.sequenced(
      amount: 6,
      stepTime: 0.1, 
      textureSize: Vector2.all(192)));
    }
    return super.onLoad();
  }

  
}