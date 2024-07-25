import 'dart:async';

import 'package:flame/collisions.dart';
import 'package:flame/components.dart';
import 'package:flame_audio/flame_audio.dart';
import 'package:realm_of_patternia/components/game_audio/audio_settings.dart';
import 'package:realm_of_patternia/components/objectives.dart';
import 'package:realm_of_patternia/realm_of_patternia.dart';

class Quest_Pawn extends SpriteAnimationComponent with HasGameRef<Realm_of_Patternia>{
  Quest_Pawn({required this.pat, required this.name, position}):super(position: position);
  final String name;
  final int pat;
  bool just_met = true;

  @override
  FutureOr<void> onLoad() {
    priority = game.player_priority+1;
    

    position.x-=64;
    position.y-=64;
    debugMode= true;
    add(RectangleHitbox(
      position: Vector2.all(51),
      size: Vector2.all(90),
      isSolid: true
    ));
    if (name =='Purple'){
    animation = SpriteAnimation.fromFrameData(game.images.fromCache('Factions/Knights/Troops/Pawn/Purple/Pawn_Purple.png'), SpriteAnimationData.sequenced(
      amount: 6,
      stepTime: 0.1, 
      texturePosition: Vector2(0,192*4),
      textureSize: Vector2.all(192)));
    }
    else if (name =='Red'){
    animation = SpriteAnimation.fromFrameData(game.images.fromCache('Factions/Knights/Troops/Pawn/Red/Pawn_Red.png'), SpriteAnimationData.sequenced(
      amount: 6,
      stepTime: 0.1,
      texturePosition: Vector2(0,192*4),  
      textureSize: Vector2.all(192)));
    }
    else if (name =='Blue'){
    animation = SpriteAnimation.fromFrameData(game.images.fromCache('Factions/Knights/Troops/Pawn/Blue/Pawn_Blue.png'), SpriteAnimationData.sequenced(
      amount: 6,
      stepTime: 0.1, 
      texturePosition: Vector2(0,192*4),
      textureSize: Vector2.all(192)));
    }
    else if (name =='Yellow'){
    animation = SpriteAnimation.fromFrameData(game.images.fromCache('Factions/Knights/Troops/Pawn/Yellow/Pawn_Yellow.png'), SpriteAnimationData.sequenced(
      amount: 6,
      stepTime: 0.1, 
      texturePosition: Vector2(0,192*4),
      textureSize: Vector2.all(192)));
    }
    else{
      animation = SpriteAnimation.fromFrameData(game.images.fromCache('Factions/Knights/Troops/Pawn/Purple/Pawn_Purple.png'), SpriteAnimationData.sequenced(
      amount: 6,
      stepTime: 0.1, 
      texturePosition: Vector2(0,192*4),
      textureSize: Vector2.all(192)));
    }
    return super.onLoad();
  }

  void Greeting(){
    bool open_dia=false;
    game.overlays.remove('DialogueOverlay');
    if (!completed_pats[pat]){
      //print(just_met);
      if(just_met){
        game.GamePaused=true;
        just_met=false;
        if (pat==0){
          game.DialogueSpeaker='Factory Manager';
          game.DialogMessage="Hey Stranger, I need help fixing a problem. This Golem factory hasn't been working for some time. It creates golems to help us with our farming work, but we don't know how to fix the Factory. Some components were lying around: 'Product', 'Concrete Products', 'Creator', and 'Concrete Creators' components. Please find them and help us fix this Golem Factory. Descriptions of the components will appear in your pattern book when you collect them. ";
          open_dia=true;
          FlameAudio.play('voice_lines/golem_factory_audio_1.mp3',volume: voiceVolume);
        }else if (pat==1){
          game.DialogueSpeaker='Tax Administrator';
          game.DialogMessage="Hey Stranger, We have a problem here in our town. The citizens need to pay their taxes to help build our town, but each citizen gets different information and pays different amounts of taxes depending on who they go to to pay the tax. Please help us build a single central place to stabilize the tax amounts and citizens' anger. You will need the 'Client' and 'Singleton' Components. Please collect them and fix our town. ";
          open_dia=true;
          FlameAudio.play('voice_lines/tax_office_audio_1.mp3',volume: voiceVolume);
        }else if (pat==2){
          game.DialogueSpeaker='News Reporter';
          game.DialogMessage="Hey Stranger. Welcome to our News Tower. We're having a slight issue with transmitting our news to the villages. Normally, people come to our tower to hear the news, but that is becoming a hassle for our listeners. We think of transmitting our news to orbs in the town, but we are missing a few key components for our operation. Can you please Help us? The Components we need are 'Publisher', 'Subscriber', 'Concrete Subscriber', and 'Client'. Thank you for being so helpful.";
          open_dia=true;
          FlameAudio.play('voice_lines/news_tower_audio_1.mp3',volume: voiceVolume);
        }else if (pat==3){
          game.DialogueSpeaker='Weather Reporter';
          game.DialogMessage="Hello Stranger. This is the Weather Tower. We work with the News tower in the southwest. They were working on a way to transmit news to villages, and we would also like to transmit the weather to the villages. We will be using their transmission, but our weather information comes in a format different from their News. Do you think you can help us adapt or add information to theirs? The components we need are 'Client', 'Client Interface', 'Service', and 'Adapter'. You are our saving grace, Stranger. ";
          open_dia=true;
          FlameAudio.play('voice_lines/weather_tower_audio_1.mp3',volume: voiceVolume);
        }else if (pat==4){
          game.DialogueSpeaker='Head Carpenter';
          game.DialogMessage="Welcome to the Sawmill where all the wood products in this realm are made. We're currently trying to figure out a system where we have different responsibilities at the sawmill. We have 20 loggers who can make basic planks, 10 basic craftsmen who can make basic furniture, 5 intermediate craftsmen who can make basic wooden machines and 2 Advanced craftsmen who can make intricate things like wooden clocks. We need to set up a chain of responsibilities for requests at the Sawmill. We'll need the following components for this system: 'Handler', 'Base Handler', 'Concrete Handlers', and 'Client'. Thank you, stranger.";
          open_dia=true;
          FlameAudio.play('voice_lines/sawmill_audio_1.mp3',volume: voiceVolume);
        }else if (pat==5){
          game.DialogueSpeaker='Librarian';
          game.DialogMessage="Welcome to the Magical Library. We are in the middle of creating a system for searching for magical books and creating a book specific to the reader's requirements without them having to search the whole library unless required. The system would be a facade using other books to create a book for a specific request of the reader. The components required for this system are: 'Facade', 'Additional Facade', 'Subsystem Class', and 'Client'. Thank you, stranger.";
          open_dia=true;
          FlameAudio.play('voice_lines/magical_library_audio_1.mp3',volume: voiceVolume);
        }else{
          game.DialogMessage='Help!!!!';
          open_dia=true;
        }
      }else{
        if (pat==0){
          if(fac_comps_num==4){
            if(!game.GamePaused){
              FlameAudio.play(start_diagram_audio[0],volume: voiceVolume);
            };
            
            open_dia=false;
            FGF();
          }else{
            game.DialogMessage="Hey Stranger. Did you collect all the components for the Golem Factory? \n'Product', 'Concrete Products', 'Creator', 'Concrete Creators' ";
            open_dia=true;
          }
          
        }else if(pat==1){
          if(sing_comps_num==2){
            if(!game.GamePaused){
              FlameAudio.play(start_diagram_audio[1],volume: voiceVolume);
            };
            
            open_dia=false;
            FTO();
          }else{
            game.DialogMessage="Hey Stranger. Did you collect all the components for the Tax office? \n'Singleton', 'Client'] ";
            open_dia=true;
          }
          
        }else if(pat==2){
          if(obs_comps_num == 4){
            if(!game.GamePaused){
              FlameAudio.play(start_diagram_audio[2],volume: voiceVolume);
            };
            
            open_dia=false;
            FMNT[0]();
          }else{
            game.DialogMessage="Hey Stranger. Did you collect all the components for the News Tower? \n'Publisher', 'Subscriber', 'Concrete Subscriber', 'Client' ";
            open_dia=true;
          }
          
        }else if(pat==3){
          if(adap_comps_num == 4){
            if(!game.GamePaused){
              FlameAudio.play(start_diagram_audio[3],volume: voiceVolume);
            };
            
            open_dia=false;
            FMNT[1]();
          }else{
            game.DialogMessage="Hey Stranger. Did you collect all the components for the Weather Tower? \n'Client', 'Client Interface', 'Service', 'Adapter' ";
            open_dia=true;
          }
          
        }else if(pat==4){
          if(chain_comps_num == 4){
            if(!game.GamePaused){
              FlameAudio.play(start_diagram_audio[4],volume: voiceVolume);
            };
            
            open_dia=false;
            FLM();
          }else{
            game.DialogMessage="Hey Stranger. Did you collect all the components for the Saw Mill? \n'Handler', 'Base Handler', 'Concrete Handlers', 'Client' ";
            open_dia=true;
          }
          
        }else if(pat==5){
          if(faca_comps_num == 4){
            if(!game.GamePaused){
              FlameAudio.play(start_diagram_audio[5],volume: voiceVolume);
            };
            
            open_dia=false;
            FML();
          }else{
              game.DialogMessage="Hey Stranger. Did you collect all the components for the Magical Library? \n'Facade', 'Additional Facade', 'Subsystem Class', 'Client' ";
              open_dia=true;
          }
        }
      }
        
    }
    else{
      game.DialogMessage='Thank you for your help hero.';
      open_dia=true;
    }
    Future.delayed(const Duration(milliseconds: 100),
    () {
      if(open_dia){
        game.overlays.add('DialogueOverlay');
        }
    } ,);
    
  }
}