import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:realm_of_patternia/components/objectives.dart';
import 'package:realm_of_patternia/components/widgets/dialogue_animated.dart';
import 'package:realm_of_patternia/realm_of_patternia.dart';

class DialogueOverlay extends StatelessWidget {
  const DialogueOverlay({super.key, required this.game});
  
  final Realm_of_Patternia game;

  @override
  Widget build(BuildContext context) {
    game.diaIsFinished=false;
    game.diaIsOpen=true;
    game.dia_count+=1;
    return 1==1? Column(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Container(
          width: MediaQuery.of(context).size.width,
          height: isFS? MediaQuery.of(context).size.height/5  :MediaQuery.of(context).size.height/5>270 ? MediaQuery.of(context).size.height/5:MediaQuery.of(context).size.height/3         ,
          
          color:  const Color.fromARGB(167, 218, 218, 218),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('${game.DialogueSpeaker}:',
                  style: TextStyle(
                        fontSize: isFS?40:MediaQuery.of(context).size.height/5>270?40:20,
                        fontFamily: 'PixelFont', 
                      ),),
                Container(child: loadAniText(game, context)),
              ],
            ),
          )
        ),
      ],
    ): Container();
  }
}

