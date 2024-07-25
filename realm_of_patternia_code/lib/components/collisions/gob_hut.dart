import 'dart:async';

import 'package:flame/collisions.dart';
import 'package:flame/components.dart';

class Gob_Hut extends PositionComponent{
  Gob_Hut({required size, required position}) :super (size: size, position: position){
    //debugMode = true;
  }

  @override
  FutureOr<void> onLoad () async {
    // TODO: implement onLoad
    await super.onLoad();
    add(PolygonHitbox(
      
      [
        Vector2(40, 24),
        Vector2(0, 64),
        Vector2(16, size.y-28),
        Vector2(size.x-16, size.y-28),
        Vector2(size.x, 64),
        Vector2(size.x-40, 24),
        
      ],
      isSolid: true,
    ));
  }
}