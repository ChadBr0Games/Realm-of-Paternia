import 'package:flame_audio/flame_audio.dart';
import 'package:realm_of_patternia/components/game_audio/audio_settings.dart';
import 'package:realm_of_patternia/realm_of_patternia.dart';

//late final Realm_of_Patternia game;

  void start_delay(Realm_of_Patternia game ) async{
    //delay for dialogue
    game.GamePaused=true;
    await Future.delayed(Duration(milliseconds: 500),(){
      

      if(voice_audio_playing) FlameAudio.play('voice_lines/hero_audio_1.mp3',volume: voiceVolume);
      if(game.show_dialogue){   
        game.DialogueSpeaker='Hero';
        game.DialogMessage='What has become of this place? The stories spoke of a land filled with wisdom and light, yet all I see is despair and decay.';
        game.overlays.add('DialogueOverlay');
      }
      print(game.GamePaused);

      Future.delayed(Duration (milliseconds: 9000),(){
        game.overlays.remove('DialogueOverlay');
        Future.delayed(Duration (milliseconds: 100),(){
          if(voice_audio_playing) FlameAudio.play('voice_lines/voice_audio_1.mp3',volume: voiceVolume);
          if(game.show_dialogue){  
            game.DialogueSpeaker="Voice";  
            game.DialogMessage="Brave traveller, your arrival heralds a chance for redemption. Seek out this realm's leaders and discover the dormant secrets of Patternia. Only then can the light of knowledge be rekindled.";
            game.overlays.add('DialogueOverlay');          
          }
        });
        
        

        Future.delayed(Duration (milliseconds: 12000),(){
          game.overlays.remove('DialogueOverlay');
          Future.delayed(Duration (milliseconds: 100),(){
            if(voice_audio_playing) FlameAudio.play('voice_lines/hero_audio_2.mp3',volume: voiceVolume);
            if(game.show_dialogue){    
              game.DialogueSpeaker='Hero';
              game.DialogMessage='Who speaks? Show yourself!';
              game.overlays.add('DialogueOverlay');
            }
          });
          

          Future.delayed(Duration (milliseconds: 2500),(){
            game.overlays.remove('DialogueOverlay');
            Future.delayed(Duration (milliseconds: 100),(){
              if(voice_audio_playing) FlameAudio.play('voice_lines/voice_audio_2.mp3',volume: voiceVolume);
              if(game.show_dialogue){ 
                game.DialogueSpeaker="Voice";   
                game.DialogMessage='I am but a whisper of the past, a guide to lead you through the shadows. Trust in the patterns of old, and the path shall reveal itself.';
                game.overlays.add('DialogueOverlay');
                
              }
            });
            

            Future.delayed(Duration (milliseconds: 9000),(){
              game.overlays.remove('DialogueOverlay');

              game.GamePaused=false;
              
            });
          });
        });

      });
    });
    
  }