import 'dart:async';

import 'package:flame/collisions.dart';
import 'package:flame/components.dart';

class Stone_Wall extends PositionComponent{
  Stone_Wall({required size, required position}) :super (size: size, position: position){
    //debugMode = true;
  }

  @override
  FutureOr<void> onLoad () async {
    // TODO: implement onLoad
    await super.onLoad();
    add(RectangleHitbox(
      position: Vector2.all(0),
      size: size,
      isSolid: true
      
    ));
  }
}