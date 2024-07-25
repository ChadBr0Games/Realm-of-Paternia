import 'dart:async';

import 'package:flame/collisions.dart';
import 'package:flame/components.dart';
import 'package:realm_of_patternia/realm_of_patternia.dart';

import '../collisions/custom_hitbox.dart';

class Foam extends SpriteAnimationComponent with HasGameRef<Realm_of_Patternia>{
  Foam({position}): super (position: position);
  final hitbox = CustomHitbox(offsetX: 10, offsetY: 10, width: 12, height: 12);
  @override
  FutureOr<void> onLoad() {
    priority= -1;
    position.x-=64;
    position.y-=64;
    //debugMode= true;
    add(RectangleHitbox(
      position: Vector2.all(64),
      size: Vector2.all(64),
      collisionType: CollisionType.passive
    ));
    animation = SpriteAnimation.fromFrameData(game.images.fromCache('Terrain/Water/Foam/Foam.png'), SpriteAnimationData.sequenced(
      amount: 8,
      stepTime: 0.1, 
      textureSize: Vector2.all(192)));
    return super.onLoad();
  }
}