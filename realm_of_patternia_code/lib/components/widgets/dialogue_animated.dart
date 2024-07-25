import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flame_audio/flame_audio.dart';
import 'package:flutter/material.dart';

AnimatedTextKit test =AnimatedTextKit(animatedTexts: []);
int time_per_letter =10;

AnimatedTextKit loadAniText(game,context,[time_per_letter=60]){
  int my_num = game.dia_count;
  test = AnimatedTextKit(animatedTexts: [ TyperAnimatedText(
            game.DialogMessage,
            textStyle: TextStyle(
              fontSize: MediaQuery.of(context).size.height/5>270?30:20
            ),
            speed: Duration(milliseconds: time_per_letter ),
          
          ),
          ],
          isRepeatingAnimation: false,
          displayFullTextOnTap: true,
          onFinished: (){
            game.diaIsFinished = true;
            //print("Text dialogue is finished");
            if(game.GamePaused){
              Future.delayed(Duration(milliseconds: 2000),(){
                if (game.diaIsOpen && game.dia_count==my_num){  
                  game.show_dialogue=false;
                  game.diaIsOpen=false;
                  game.overlays.remove('DialogueOverlay');
                  if(game.diaIsOpen == false){
                    game.GamePaused=false;
                    FlameAudio.bgm.voicestop;
                  }
                  
                }
              });
            }else{
              Future.delayed(Duration(milliseconds: 5000),(){
                if (game.diaIsOpen && game.dia_count==my_num){  
                  game.show_dialogue=false;
                  game.diaIsOpen=false;
                  game.overlays.remove('DialogueOverlay');
                  
                  
                }
              });
            }
            
            
            
          },
          );
  return test;
}


