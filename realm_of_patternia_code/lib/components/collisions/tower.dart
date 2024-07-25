import 'dart:async';

import 'package:flame/collisions.dart';
import 'package:flame/components.dart';

class Tower extends PositionComponent{
  Tower({required size, required position}) :super (size: size, position: position){
    //debugMode = true;
  }

  @override
  FutureOr<void> onLoad () async {
    // TODO: implement onLoad
    await super.onLoad();
    add(PolygonHitbox(
      [
        Vector2(32, 52),
        Vector2(5, 80),
        Vector2(10, 135),
        Vector2(20, 148),
        Vector2(20, size.y-30),
        Vector2(size.x-20, size.y-30),
        Vector2(size.x-20, 148),
        Vector2(size.x-10, 135),
        Vector2(size.x-5, 80),
        Vector2(size.x-32, 52),
      ],
      isSolid: true,
    ));
  }
}