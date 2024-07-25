// ignore_for_file: non_constant_identifier_names, unused_local_variable

import 'dart:async';

import 'package:flame/components.dart';
import 'package:flame_audio/bgm.dart';
import 'package:flame_audio/flame_audio.dart';
import 'package:flame_tiled/flame_tiled.dart';
import 'package:realm_of_patternia/components/actors/player/archer.dart';
import 'package:realm_of_patternia/components/actors/player/gob_tnt.dart';
import 'package:realm_of_patternia/components/actors/player/gob_torch.dart';
import 'package:realm_of_patternia/components/actors/player/golem.dart';
import 'package:realm_of_patternia/components/actors/player/knight.dart';
import 'package:realm_of_patternia/components/actors/player/pawn.dart';
import 'package:realm_of_patternia/components/actors/player/player.dart';
import 'package:realm_of_patternia/components/actors/player/quest_builders.dart';
import 'package:realm_of_patternia/components/actors/player/quest_pawn.dart';
import 'package:realm_of_patternia/components/actors/player/sheep.dart';
import 'package:realm_of_patternia/components/aniamtions/pine_tree.dart';
import 'package:realm_of_patternia/components/buildings/gob_tower.dart';
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
//import 'package:realm_of_patternia/components/game_audio/audio_settings.dart';
import 'package:realm_of_patternia/components/items/adap_comp.dart';
import 'package:realm_of_patternia/components/items/chain_comp.dart';
import 'package:realm_of_patternia/components/items/fac_comp.dart';
import 'package:realm_of_patternia/components/items/faca_comp.dart';
import 'package:realm_of_patternia/components/items/gold.dart';
import 'package:realm_of_patternia/components/items/obsv_comp.dart';
import 'package:realm_of_patternia/components/items/orbs.dart';
import 'package:realm_of_patternia/components/items/sing_comp.dart';
import 'package:realm_of_patternia/components/objectives.dart';
import 'package:realm_of_patternia/realm_of_patternia.dart';

import '../aniamtions/waves_foam.dart';


class Level extends World with HasGameRef<Realm_of_Patternia>{
  final String levelName;
  final Player player;
  Level({required this.levelName, required this.player});
  late TiledComponent level;
  
  

  @override
  FutureOr<void> onLoad() async {
    //priority=0;
    //if (game.playAudio) FlameAudio.bgm.play('audio2.mp3',volume: game.backgroundVolume);
    //FlameAudio.bgm.play('audio1.mp3',volume: backgroundVolume);
    //FlameAudio.bgm.bgmplay('background_music/bgm_1.mp3',);
    //game.test.playbgm('audio1.mp3');
    //FlameAudio.bgm.pause();

    level = await TiledComponent.load('$levelName.tmx', Vector2.all(64));
    add(level);

    _spawningObjects();
    _quest_spawns();
    _addBuilders();
    _spawningGobs();
    _addCollisions();
    _addwaves();
    _addTrees();
    _addBuildingSpawns();
    _addBluePrints();
    _addOrbs();
    _addSheep();

    return super.onLoad();
  }
  void _quest_spawns(){
    int pat=0;
    final quest_spawns = level.tileMap.getLayer<ObjectGroup>('Quest_spawns');
    if(quest_spawns != null){
      for(final quest_spawn in quest_spawns.objects){
        switch(quest_spawn.class_){
          
          case 'Pawn_Yellow':
            final quest_pawn = Quest_Pawn(pat:0, name:'Yellow', position: Vector2(quest_spawn.x, quest_spawn.y));
            add(quest_pawn);
            break;
          case 'Pawn_Red':
            final quest_pawn = Quest_Pawn(pat:2, name:'Red', position: Vector2(quest_spawn.x, quest_spawn.y));
            add(quest_pawn);
            break;
          case 'Pawn_Blue':
            final quest_pawn = Quest_Pawn(pat:5, name:'Blue', position: Vector2(quest_spawn.x, quest_spawn.y));
            add(quest_pawn);
            break;
          case 'Pawn_Purple':
          if(quest_spawn.name.contains('tax')){
            pat=1;
          }
          else if(quest_spawn.name.contains('weather')){
            pat=3;
          }
          else if(quest_spawn.name.contains('sawmill')){
            pat=4;
          }
            final quest_pawn = Quest_Pawn(pat:pat, name:'Purple', position: Vector2(quest_spawn.x, quest_spawn.y));
            add(quest_pawn);
            break;
        }
      }
    }
  }
  void _spawningGobs(){
    final goblin_spawns = level.tileMap.getLayer<ObjectGroup>('Goblin_spawns');
    if(goblin_spawns != null){
      for (final goblin_spawn in goblin_spawns.objects){
        switch(goblin_spawn.class_){
          case'red_tnt':
            final tnt =Gob_TNT(name: 'Red', position: Vector2(goblin_spawn.x, goblin_spawn.y));
            add(tnt);
            break;
          case'blue_tnt':
            final tnt =Gob_TNT(name: 'Blue', position: Vector2(goblin_spawn.x, goblin_spawn.y));
            add(tnt);
            break;
          case'purple_tnt':
            final tnt =Gob_TNT(name: 'Purple', position: Vector2(goblin_spawn.x, goblin_spawn.y));
            add(tnt);
            break;
          case'yellow_tnt':
            final tnt =Gob_TNT(name: 'Yellow', position: Vector2(goblin_spawn.x, goblin_spawn.y));
            add(tnt);
            break;
          case'red_torch':
            final torch =Gob_Torch(name: 'Red', position: Vector2(goblin_spawn.x, goblin_spawn.y));
            add(torch);
            break;
          case'blue_torch':
            final torch =Gob_Torch(name: 'Blue', position: Vector2(goblin_spawn.x, goblin_spawn.y));
            add(torch);
            break;
          case'purple_torch':
            final torch =Gob_Torch(name: 'Purple', position: Vector2(goblin_spawn.x, goblin_spawn.y));
            add(torch);
            break;
          case'yellow_torch':
            final torch =Gob_Torch(name: 'Yellow', position: Vector2(goblin_spawn.x, goblin_spawn.y));
            add(torch);
            break;
          case'gob_tower_red':
            final tower =Gob_Tower(name: 'Red', position: Vector2(goblin_spawn.x, goblin_spawn.y), size: Vector2(goblin_spawn.width,goblin_spawn.height));
            add(tower);
            break;
          case'gob_tower_blue':
            final tower =Gob_Tower(name: 'Blue', position: Vector2(goblin_spawn.x, goblin_spawn.y), size: Vector2(goblin_spawn.width,goblin_spawn.height));
            add(tower);
            break;
          case'gob_tower_purple':
            final tower =Gob_Tower(name: 'Purple', position: Vector2(goblin_spawn.x, goblin_spawn.y), size: Vector2(goblin_spawn.width,goblin_spawn.height));
            add(tower);
            break;
          case'gob_tower_yellow':
            final tower =Gob_Tower(name: 'Yellow', position: Vector2(goblin_spawn.x, goblin_spawn.y), size: Vector2(goblin_spawn.width,goblin_spawn.height));
            add(tower);
            break;
        }
      }
    }
  }

  void _spawningObjects() {
    final spawnPointLayer = level.tileMap.getLayer<ObjectGroup>('Spawnpoints');

    if(spawnPointLayer != null){
      for(final spawnPoint in spawnPointLayer.objects){
      switch(spawnPoint.class_){
          case 'Player':
            player.position = Vector2(spawnPoint.x, spawnPoint.y);
            add(player);
            break;

          case 'Collectable':
            final gold = Gold(position: Vector2(spawnPoint.x,spawnPoint.y),);
            add(gold);
            break;
            
          case 'Knight':
            final knight = Knight(name:spawnPoint.name, position: Vector2(spawnPoint.x, spawnPoint.y));
            add(knight);
            break;

          case 'Pawn':
            final pawn = Pawn(name:spawnPoint.name, position: Vector2(spawnPoint.x, spawnPoint.y));
            add(pawn);
            break;
          
          case'Archer':
          final archer = Archer(name:spawnPoint.name, position: Vector2(spawnPoint.x, spawnPoint.y));
            add(archer);
            break;
          
          case'Golem':
            final golem = Golem(name:spawnPoint.name, position: Vector2(spawnPoint.x, spawnPoint.y));
            add(golem);
            golems.add(golem);
            break;
          

          

        }
      }
    }
  
  }

  void _addBluePrints(){
    final bluePrintSpawns = level.tileMap.getLayer<ObjectGroup>('Blue_Prints');
    if (bluePrintSpawns!=null){
      for (final blueprint in bluePrintSpawns.objects){
        switch(blueprint.class_){
          case 'fac_blu':
            final fac_blu = fac_comp(name: blueprint.name,position: Vector2(blueprint.x,blueprint.y));
            add(fac_blu);
            break;

          case 'sing_blu':
            final sing_blu = sing_comp(name: blueprint.name,position: Vector2(blueprint.x,blueprint.y));
            add(sing_blu);
            break;

          case 'Obs_blu':
            final obsv_blu = obsv_comp(name: blueprint.name,position: Vector2(blueprint.x,blueprint.y));
            add(obsv_blu);
            break;

          case 'adp_blu':
            final adap_blu = adap_comp(name: blueprint.name,position: Vector2(blueprint.x,blueprint.y));
            add(adap_blu);
            break;
          
          case 'chain_blu' :
            final chain_blu = chain_comp(name: blueprint.name,position: Vector2(blueprint.x,blueprint.y));
            add(chain_blu);
            break;

          case 'facade_blu':
            final faca_blu = faca_comp(name: blueprint.name,position: Vector2(blueprint.x,blueprint.y));
            add(faca_blu);
            break;

        }
      }
    }
  }

  void _addBuildingSpawns(){
    final buildingSpawns=level.tileMap.getLayer<ObjectGroup>('Building_spawns');
    if (buildingSpawns!=null){
      for(final building in buildingSpawns.objects){
        switch(building.class_){
          case 'GolemFactory' :
            final GF=GolemFactory( postion: Vector2(building.x,building.y), size: Vector2(building.width,building.height));
            add(GF);
            FGF=GF.fixing;
            break;
          case 'MagicalNewsTower' :
            final MNT = MagicalNewsTower(name: building.name, postion: Vector2(building.x,building.y), size: Vector2(building.width,building.height));
            add(MNT);
            FMNT.add(MNT.fixing);
            break;
          case 'LumberMill' :
            final LM = LumberMill( postion: Vector2(building.x,building.y), size: Vector2(building.width,building.height));
            add(LM);
            FLM=LM.fixing;
            break;
          case 'MagicalLibrary' :
            final ML =MagicalLibrary( postion: Vector2(building.x,building.y), size: Vector2(building.width,building.height));
            add(ML);
            FML=ML.fixing;
            break;
          case 'TaxOffice':
            final TO =TaxOffice( postion: Vector2(building.x,building.y), size: Vector2(building.width,building.height));
            add(TO);
            FTO=TO.fixing;
            break;
            
        }
      }
    }
  }

  void _addCollisions() {
    final collisionsLayer = level.tileMap.getLayer<ObjectGroup>('Collisions');
    if (collisionsLayer != null){
      for (final collision in collisionsLayer.objects){
        switch (collision.class_) {
          case 'Stonewall':
            add(Stone_Wall(
              position:  Vector2(collision.x,collision.y),
              size: Vector2(collision.width, collision.height),
              

              ));
            break;
          case'tower':
            add(
              Tower(size: Vector2(collision.width, collision.height), position: Vector2(collision.x,collision.y))
            );
            break;

          case'house':
            add(
              House(size: Vector2(collision.width, collision.height), position: Vector2(collision.x,collision.y))
            );
            break;

          case'gob_hut':
            add(
              Gob_Hut(size: Vector2(collision.width, collision.height), position: Vector2(collision.x,collision.y))
            );
            break;

          case'gold_mine':
            add(
              Gold_Mine(size: Vector2(collision.width, collision.height), position: Vector2(collision.x,collision.y))
            );
            break;
          
          
        }
      }
    }

  
  }
  void _addTrees(){
    final treeLayer = level.tileMap.getLayer<ObjectGroup>('Pine_Trees');
    if (treeLayer!=null){
      for(final tree in treeLayer.objects){
        switch(tree.class_){
          case 'Pine_Tree':
          add(Pine_Tree(
            position: Vector2(tree.x,tree.y),
            size: Vector2(tree.width,tree.height),
          ));
        }
      }
    }
  }
  void _addSheep(){
    final sheepLayer = level.tileMap.getLayer<ObjectGroup>('sheep');
    if (sheepLayer!=null){
      for(final sheep in sheepLayer.objects){
        switch(sheep.class_){
          case 'Sheep':
          add(Sheep(name: sheep.name,
            position: Vector2(sheep.x,sheep.y),
          ));
        }
      }
    }
  }
  
  void _addwaves() {
    final waveLayer = level.tileMap.getLayer<ObjectGroup>('Foam');
    if (waveLayer!= null){
      for (final wave in waveLayer.objects){
        switch (wave.class_) {
          case 'Foam':
            add(Foam(
              position:  Vector2(wave.x,wave.y),

              ));
            break;
          
          
        }
      }
    }
  }

  void _addBuilders(){
    final builderSpawnLayer = level.tileMap.getLayer<ObjectGroup>('Builder_spawns');
    if(builderSpawnLayer!=null){
      for(final builder_spawn in builderSpawnLayer.objects){
        bool flip = false;
        if (builder_spawn.name.contains('flip')){
          flip = true;
        }
        
        switch(builder_spawn.class_){
          case 'builder_red':
            final quilder = Quest_Builders(flip:flip, name:'Red', position: Vector2(builder_spawn.x, builder_spawn.y));
            add(quilder);
            if(builder_spawn.name.contains('observer')){
              ObserverQB.add(quilder);
            }
            break;
          case 'builder_blue':
            final quilder = Quest_Builders(flip:flip, name:'Blue', position: Vector2(builder_spawn.x, builder_spawn.y));
            add(quilder);
            if(builder_spawn.name.contains('facade')){
              FacadeQB.add(quilder);
            }
            break;
          case 'builder_purple':
            final quilder = Quest_Builders(flip:flip, name:'Purple', position: Vector2(builder_spawn.x, builder_spawn.y));
            add(quilder);
            if(builder_spawn.name.contains('chain')){
              ChainQB.add(quilder);
            }
            if(builder_spawn.name.contains('adapter')){
              AdapterQB.add(quilder);
            }
            if(builder_spawn.name.contains('singleton')){
              SingletonQB.add(quilder);
            }
            break;
          case 'builder_yellow':
            final quilder = Quest_Builders(flip:flip, name:'Yellow', position: Vector2(builder_spawn.x, builder_spawn.y));
            add(quilder);
            if(builder_spawn.name.contains('factory')){
              FactoryQB.add(quilder);
            }
            break;
            
            
        }
      }
    }
  }
  void _addOrbs(){
    final builderOrbLayer = level.tileMap.getLayer<ObjectGroup>('Orbs_spawns');
    if(builderOrbLayer!=null){
      for(final orb in builderOrbLayer.objects){
        if(orb.class_=='Orb'){
          final orb_out = Orbs(position: Vector2(orb.x,orb.y));
          add(orb_out);
          orbs.add(orb_out);
        }
      }
    }
  }
  
  
} 