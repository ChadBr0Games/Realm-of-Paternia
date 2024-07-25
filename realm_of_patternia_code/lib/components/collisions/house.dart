import 'dart:async';

import 'package:flame/collisions.dart';
import 'package:flame/components.dart';

class House extends PositionComponent{
  House({required size, required position}) :super (size: size, position: position){
    //debugMode = true;
  }

  @override
  FutureOr<void> onLoad () async {
    // TODO: implement onLoad
    await super.onLoad();
    add(PolygonHitbox(
      
      [
        Vector2(48, 24),
        Vector2(16, 64),
        Vector2(16, size.y-28),
        Vector2(size.x-16, size.y-28),
        Vector2(size.x-16, 64),
        Vector2(size.x-48, 24),
        
      ],
      isSolid: true,
    ));
  }
}