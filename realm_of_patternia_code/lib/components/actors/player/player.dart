// ignore_for_file: deprecated_member_use

import 'dart:async';
import 'package:flutter/services.dart';
import 'package:flame/collisions.dart';
import 'package:flame/components.dart';
import 'package:flame/sprite.dart';
import 'package:flutter/widgets.dart';
import 'package:realm_of_patternia/components/actors/player/quest_pawn.dart';
import 'package:realm_of_patternia/components/aniamtions/pine_tree.dart';
import 'package:realm_of_patternia/components/buildings/golem_factory.dart';
import 'package:realm_of_patternia/components/buildings/lumber_mill.dart';
import 'package:realm_of_patternia/components/buildings/magical_library.dart';
import 'package:realm_of_patternia/components/buildings/magical_news_tower.dart';
import 'package:realm_of_patternia/components/buildings/tax_office.dart';
import 'package:realm_of_patternia/components/collisions/gob_hut.dart';
import 'package:realm_of_patternia/components/collisions/gold_mine.dart';
import 'package:realm_of_patternia/components/collisions/house.dart';
import 'package:realm_of_patternia/components/collisions/stone_wall.dart';
import 'package:realm_of_patternia/components/collisions/tower.dart';
import 'package:realm_of_patternia/components/items/adap_comp.dart';
import 'package:realm_of_patternia/components/items/chain_comp.dart';
import 'package:realm_of_patternia/components/items/fac_comp.dart';
import 'package:realm_of_patternia/components/items/faca_comp.dart';
import 'package:realm_of_patternia/components/items/gold.dart';
import 'package:realm_of_patternia/components/items/obsv_comp.dart';
import 'package:realm_of_patternia/components/items/sing_comp.dart';
import 'package:realm_of_patternia/realm_of_patternia.dart';

import '../../collisions/custom_hitbox.dart';
enum PlayerState{idle_right,idle_left, running_right, running_left, jumping, falling, hit, appearing, disappearing}

class Player extends SpriteAnimationGroupComponent with HasGameRef<Realm_of_Patternia>,KeyboardHandler,CollisionCallbacks {
  late final SpriteAnimation idleAnimation_right;
  late final SpriteAnimation runningAnimation_right;
  late final SpriteAnimation idleAnimation_left;
  late final SpriteAnimation runningAnimation_left;
  Player({position}) : super(position: position);
  double horizontalMovement = 0;
  double verticalMovement = 0;
  double pause_pressed = 0;
  double patternBook = 0 ;
  double taskSheet=0;
  double toCollect=0;
  double sprint = 0;
  double respawn = 0;
  double help = 0;
  double moveSpeed = 200;
  String char_dir = 'right'; // character direction
  PlayerState playerState = PlayerState.idle_right;
  Vector2 velocity = Vector2.zero();
  Vector2 playerSpawn=Vector2.zero();
  CustomHitbox hitbox = CustomHitbox(offsetX: 70, offsetY: 70, width: 29, height: 28,);
  Vector2 originalPosition = Vector2.zero();
  bool start_dialogue = false;

  @override
  FutureOr<void> onLoad() {

    _loadAllAnimations();
    debugMode=true;
    priority = game.player_priority;

    position.x-=64;
    position.y-=64;

    playerSpawn = Vector2(position.x, position.y);
    /*add(RectangleHitbox(
      position: Vector2(hitbox.offsetX, hitbox.offsetY),
      size: Vector2(hitbox.width,hitbox.height),
      isSolid: true,
    ));*/
    
    add(CircleHitbox(
      radius: hitbox.width,
      position: Vector2(hitbox.offsetX, hitbox.offsetY),
      isSolid: true,
    ));
    
    return super.onLoad();
    
  }

  void update(double dt) {
    if(!game.GamePaused){
      
      _updatePlayerState();
      _updatePlayerMovement(dt);
      _pauseGame();
      _patternBook();
      _tasksheet();
      _respawn();
      _helpsheet();
      
    }
    _updateDialogue();
    
    
    super.update(dt);
  }
  
  void _loadAllAnimations() {
    idleAnimation_right = _spriteAniamtion(0, 6);
    runningAnimation_right = _spriteAniamtion(1, 6);
    idleAnimation_left = _spriteAniamtion(8, 6);
    runningAnimation_left = _spriteAniamtion(9, 6);
    //jumpingAnimation = _spriteAniamtion('Jump', 1);
    //fallingAnimation = _spriteAniamtion('Fall', 1);
    //hitAnimation = _spriteAniamtion('Hit', 7);
    //appearingAnimation = _appearingSpriteAniamtion('Appearing', 7);
    //disappearingAnimation = _appearingSpriteAniamtion('Desappearing', 7);

    
    
    // List of all animations
    animations = {
      PlayerState.idle_right: idleAnimation_right,   
      PlayerState.running_right: runningAnimation_right,
      PlayerState.idle_left: idleAnimation_left,   
      PlayerState.running_left: runningAnimation_left,
      //PlayerState.falling: fallingAnimation,
      //PlayerState.jumping: jumpingAnimation,
      //PlayerState.hit: hitAnimation,
      //PlayerState.appearing: appearingAnimation,
      //PlayerState.disappearing: disappearingAnimation,
    };

    // Set current animation
    current = PlayerState.idle_right;
  }

  SpriteAnimation _spriteAniamtion(double row, int amount){
    return SpriteAnimation.fromFrameData(
      game.images.fromCache('Factions/Knights/Troops/Warrior/Blue/Warrior_Blue.png'), 
      SpriteAnimationData.sequenced(
        amount: amount, 
        stepTime: 0.1, 
        textureSize: Vector2.all(192),
        //postion on the sprite sheet increase y value to go to next line 
        texturePosition: Vector2(0,192*row)
        ),
      );
  }

  @override
  bool onKeyEvent(KeyEvent event, Set<LogicalKeyboardKey> keysPressed) {
    horizontalMovement = 0;
    verticalMovement = 0;
    sprint=0;
    final isLeftKeyPressed = keysPressed.contains(LogicalKeyboardKey.keyA)|| 
    keysPressed.contains(LogicalKeyboardKey.arrowLeft);

    final isRightKeyPressed = keysPressed.contains(LogicalKeyboardKey.keyD)|| 
    keysPressed.contains(LogicalKeyboardKey.arrowRight);

    final isUpKeyPressed = keysPressed.contains(LogicalKeyboardKey.keyW)|| 
    keysPressed.contains(LogicalKeyboardKey.arrowUp);

    final isDownKeyPressed = keysPressed.contains(LogicalKeyboardKey.keyS)|| 
    keysPressed.contains(LogicalKeyboardKey.arrowDown);

    final isShiftKeyPressed = keysPressed.contains(LogicalKeyboardKey.shiftLeft)||
    keysPressed.contains(LogicalKeyboardKey.shiftRight);

    final isCollectKeyPressed = keysPressed.contains(LogicalKeyboardKey.keyZ)||
    keysPressed.contains(LogicalKeyboardKey.keyK);  

    final isPauseKeyPressed = keysPressed.contains(LogicalKeyboardKey.keyP);

    final isPatternBookKeyPressed = keysPressed.contains(LogicalKeyboardKey.keyB);
    final isTaskSheetKeyPressed = keysPressed.contains(LogicalKeyboardKey.keyT);
    final isRespawnKeyPressed = keysPressed.contains(LogicalKeyboardKey.keyR);
    
    final isHelpKeyPressed = keysPressed.contains(LogicalKeyboardKey.keyH);

    char_dir= isLeftKeyPressed ? 'left' : char_dir;
    char_dir= isRightKeyPressed ? 'right' : char_dir;
    horizontalMovement += isLeftKeyPressed ? -1 : 0;
    horizontalMovement += isRightKeyPressed ? 1 : 0;
    verticalMovement += isUpKeyPressed ? -1 : 0;
    verticalMovement += isDownKeyPressed ? 1 : 0;
    sprint = isShiftKeyPressed ? 1 : 0;
    toCollect = isCollectKeyPressed ? 1 : 0;
    pause_pressed = isPauseKeyPressed? 1 : 0;
    patternBook = isPatternBookKeyPressed? 1 : 0;
    taskSheet = isTaskSheetKeyPressed? 1 : 0;
    respawn = isRespawnKeyPressed? 1:0;
    help = isHelpKeyPressed?1:0;


    
    return super.onKeyEvent(event, keysPressed);
  }
  
  void _respawn(){
    if (respawn==1){
      position.setFrom(playerSpawn);
    }
  }
  void _updateDialogue(){
    if(toCollect==1 && !game.GamePaused){
      game.overlays.remove('DialogueOverlay');
    }
    
  }
  void _updatePlayerState() {
  

    if(velocity.x==0 && char_dir =='left'){
      playerState = PlayerState.idle_left;
      char_dir = 'left';

    }else if( velocity.x == 0 && char_dir =='right'){
      playerState = PlayerState.idle_right;
      char_dir = 'right';
    }

    // check if moving, set running
    if (( velocity.x > 0 || velocity.y > 0 || velocity.y < 0) && char_dir =='right'){
      playerState = PlayerState.running_right;
      char_dir = 'right';
    } 
    else if (( velocity.x < 0 || velocity.y > 0 || velocity.y < 0) && char_dir =='left'){
      playerState = PlayerState.running_left;
      char_dir = 'left';

    }
    current = playerState;
    
}
  void _patternBook(){
    if (patternBook==1){
      game.overlays.add('PatternBookOverlay');
      
    }

  }
  void _tasksheet(){
    if (taskSheet==1){
      game.overlays.add('StatsOverlay');
      
    }

  }
  void _helpsheet(){
    if (help==1){
      game.overlays.add('HelpOverlay');
      
    }

  }
  
  void _pauseGame(){
    if (pause_pressed==1){
      game.overlays.add('PauseMenuOverlay');
      game.GamePaused=true;
      game.test.pause();
      //game.pauseEngine();
      }
  }

  void _updatePlayerMovement(double dt) {

    originalPosition = position.clone();
    velocity.x = horizontalMovement * moveSpeed + horizontalMovement * sprint * moveSpeed;
    velocity.y = verticalMovement * moveSpeed + verticalMovement * sprint * moveSpeed;    
    position.x += velocity.x * dt;
    position.y += velocity.y * dt;


    
  }
  @override
  void onCollisionEnd(PositionComponent other) {
    super.onCollisionEnd(other);
    if (other is Pine_Tree){
      priority+=2;
      //print(priority);
    }
  }
  @override
  void onCollisionStart(Set<Vector2> intersectionPoints, PositionComponent other) {
    super.onCollisionStart(intersectionPoints, other);
    if (other is Pine_Tree){
      priority-=2;
      //print(priority);
    }
  }

  @override
  void onCollision(Set<Vector2> intersectionPoints, PositionComponent other) {
    super.onCollision(intersectionPoints, other);
    if (other is Stone_Wall|| other is Tower || other is House || other is Gob_Hut || other is Gold_Mine|| other is GolemFactory|| other is MagicalLibrary|| other is MagicalNewsTower || other is LumberMill || other is TaxOffice){
      velocity.x = horizontalMovement * moveSpeed + horizontalMovement * sprint * moveSpeed;
      velocity.y = verticalMovement * moveSpeed + verticalMovement * sprint * moveSpeed;
      if(velocity.y<0 && (intersectionPoints.elementAt(0)[1].toInt()==intersectionPoints.elementAt(1)[1].toInt() || intersectionPoints.elementAt(0)[1].toInt()-1==intersectionPoints.elementAt(1)[1].toInt() || intersectionPoints.elementAt(0)[1].toInt()==intersectionPoints.elementAt(1)[1].toInt()-1) ){
        if(intersectionPoints.elementAt(0)[1]+velocity.y<intersectionPoints.elementAt(1)[1]){
          position.y=originalPosition.y;
        }
      } 
      else if(velocity.y>0 && (intersectionPoints.elementAt(0)[1].toInt()==intersectionPoints.elementAt(1)[1].toInt() || intersectionPoints.elementAt(0)[1].toInt()-1==intersectionPoints.elementAt(1)[1].toInt() || intersectionPoints.elementAt(0)[1].toInt()==intersectionPoints.elementAt(1)[1].toInt()-1) ){
        if(intersectionPoints.elementAt(0)[1]+velocity.y>intersectionPoints.elementAt(1)[1]){
          position.y=originalPosition.y;
        }
      } 
      else if(velocity.x<0 && (intersectionPoints.elementAt(0)[0].toInt()==intersectionPoints.elementAt(1)[0].toInt() || intersectionPoints.elementAt(0)[0].toInt()-1==intersectionPoints.elementAt(1)[0].toInt() || intersectionPoints.elementAt(0)[0].toInt()==intersectionPoints.elementAt(1)[0].toInt()-1) ){
        if(intersectionPoints.elementAt(0)[0]+velocity.x<intersectionPoints.elementAt(1)[0]){
          position.x=originalPosition.x;
        }
      } 
      else if(velocity.x>0 && (intersectionPoints.elementAt(0)[0].toInt()==intersectionPoints.elementAt(1)[0].toInt() || intersectionPoints.elementAt(0)[0].toInt()-1==intersectionPoints.elementAt(1)[0].toInt() || intersectionPoints.elementAt(0)[0].toInt()==intersectionPoints.elementAt(1)[0].toInt()-1)){
        if(intersectionPoints.elementAt(0)[0]+velocity.x>intersectionPoints.elementAt(1)[0]){
          position.x=originalPosition.x;
        }
      } else {

        
        
        //print("why are we here?");

        
        position = originalPosition;
        
      }
      
    }
    if (other is Quest_Pawn && !game.GamePaused){
      if(toCollect==1){
      other.Greeting();
      }
    }
    
    if (other is Gold){
      
      if(toCollect==1){
        other.collecting();
      }
    }
    

    if (other is fac_comp){
      if(toCollect==1){
        other.collecting();
      }
    }

    if (other is adap_comp){
      if(toCollect==1){
        other.collecting();
      }
    }

    if (other is chain_comp){
      if(toCollect==1){
        other.collecting();
      }
    }

    if (other is faca_comp){
      if(toCollect==1){
        other.collecting();
      }
    }

    if (other is obsv_comp){
      if(toCollect==1){
        other.collecting();
      }
    }

    if (other is sing_comp){
      if(toCollect==1){
        other.collecting();
      }
    }

    
  }
  
}

