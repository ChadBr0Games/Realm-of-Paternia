import 'dart:async';

import 'package:flame/collisions.dart';
import 'package:flame/components.dart';
import 'package:realm_of_patternia/realm_of_patternia.dart';

class Pine_Tree extends SpriteAnimationComponent with HasGameRef<Realm_of_Patternia>{
  Pine_Tree({position,size}): super(position: position,size: size);
  int priority = 0;

  @override
  FutureOr<void> onLoad() {
    priority = game.player_priority-1;

    
    debugMode= true;
    add (PolygonHitbox(
      [
        Vector2(96  , 0),
        Vector2(58, 64),
        Vector2(36, size.y-60),
        Vector2(40, size.y-40),
        Vector2(size.x-40, size.y-40),
        Vector2(size.x-36, size.y-60),
        Vector2(size.x-58, 64),
        Vector2(size.x-90, 0),
      ],isSolid: true,
      
    ));
    animation = SpriteAnimation.fromFrameData(game.images.fromCache('Resources/Trees/Tree_Top.png'), SpriteAnimationData.sequenced(
      amount: 4,
      stepTime: 0.1, 
      textureSize: Vector2.all(192),
      texturePosition: Vector2(0, 192)));
    return super.onLoad();
  
  }
  
}