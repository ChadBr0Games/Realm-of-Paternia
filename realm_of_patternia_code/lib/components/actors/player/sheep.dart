import 'dart:async';

import 'package:flame/collisions.dart';
import 'package:flame/components.dart';
import 'package:realm_of_patternia/realm_of_patternia.dart';

class Sheep extends SpriteAnimationComponent with HasGameRef<Realm_of_Patternia>{
  Sheep({required this.name,position}):super(position: position);
  final String name;

  @override
  FutureOr<void> onLoad() {
    priority = game.player_priority+1;

    
    position.y-=32;
    //debugMode= true;
    add(RectangleHitbox(
      position: position,
      size: Vector2.all(64),
      collisionType: CollisionType.passive
    ));
    animation = SpriteAnimation.fromFrameData(game.images.fromCache('Resources/Sheep/HappySheep_Idle.png'), SpriteAnimationData.sequenced(
      amount: 8,
      stepTime: 0.1, 
      textureSize: Vector2.all(128)));
    if(name.contains('left')){
      flipHorizontally();
    }
    return super.onLoad();
  }
}
