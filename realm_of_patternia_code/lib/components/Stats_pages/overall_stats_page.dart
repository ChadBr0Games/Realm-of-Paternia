import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:realm_of_patternia/components/objectives.dart';
import 'package:realm_of_patternia/realm_of_patternia.dart';

class Overall_Page extends StatefulWidget {
  const Overall_Page({super.key, required this.game});
  final Realm_of_Patternia game;

  @override
  State<Overall_Page> createState() => _Overall_PageState();
}

class _Overall_PageState extends State<Overall_Page> {
  
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          
          const Row(
            children: [
              Text('Overall Stats',
                style: TextStyle(
                      fontSize: 40,
                      fontFamily: 'PixelFont',
                      fontWeight: FontWeight.bold, 
                    ),),
            ],
          ),
          pats.length==num_comp_pats?Column(
            children: [
              SizedBox(height: 40,),
              Row(
                children: [
                  Text('Congratulations you have completed all tasks!',
                    style: TextStyle(
                          fontSize: 35,
                          fontFamily: 'PixelFont',
                          fontWeight: FontWeight.bold, 
                        ),),
                ],
              ),
              SizedBox(height: 40,)
            ],
          ):Container(),
          Row(
            children: [
              const Text('Time taken to complete Game - ',
                style: TextStyle(
                      fontSize: 30,
                      fontFamily: 'PixelFont', 
                    ),),
              Text('${GameSW.elapsed.inMinutes} Minutes',
                style:TextStyle(
                      fontSize: 30,
                      fontFamily: 'PixelFont', 
                      color: num_comp_pats==pats.length?Color.fromARGB(255, 7, 141, 28):Color.fromARGB(255, 0, 0, 0),
                    ),),
            ],
          ),
          Row(
            children: [
              const Text('Pattern tasks completed:',
                style: TextStyle(
                      fontSize: 30,
                      fontFamily: 'PixelFont', 
                    ),),
              Text('${num_comp_pats}/6',
                style: const TextStyle(
                      fontSize: 30,
                      fontFamily: 'PixelFont', 
                    ),),
            ],
          ),
          Row(
            children: [
              const Text('Factory Task status:',
                style: TextStyle(
                      fontSize: 30,
                      fontFamily: 'PixelFont', 
                    ),),
              Text(completed_pats[0]?'Complete':'Incomplete',
                style: TextStyle(
                      fontSize: 30,
                      fontFamily: 'PixelFont',  
                      color: completed_pats[0]?Color.fromARGB(255, 7, 141, 28):Color.fromARGB(255, 0, 0, 0),
                    ),),
            ],
          ),
          Row(
            children: [
              const Text('Singleton Task status:',
                style: TextStyle(
                      fontSize: 30,
                      fontFamily: 'PixelFont', 
                    ),),
              Text(completed_pats[1]?'Complete':'Incomplete',
                style: TextStyle(
                      fontSize: 30,
                      fontFamily: 'PixelFont',  
                      color: completed_pats[1]?Color.fromARGB(255, 7, 141, 28):Color.fromARGB(255, 0, 0, 0),
                    ),),
            ],
          ),
          Row(
            children: [
              const Text('Observer Task status:',
                style: TextStyle(
                      fontSize: 30,
                      fontFamily: 'PixelFont', 
                    ),),
              Text(completed_pats[2]?'Complete':'Incomplete',
                style: TextStyle(
                      fontSize: 30,
                      fontFamily: 'PixelFont',  
                      color: completed_pats[2]?Color.fromARGB(255, 7, 141, 28):Color.fromARGB(255, 0, 0, 0),
                    ),),
            ],
          ),Row(
            children: [
              const Text('Adapter Task status:',
                style: TextStyle(
                      fontSize: 30,
                      fontFamily: 'PixelFont', 
                    ),),
              Text(completed_pats[3]?'Complete':'Incomplete',
                style: TextStyle(
                      fontSize: 30,
                      fontFamily: 'PixelFont',  
                      color: completed_pats[3]?Color.fromARGB(255, 7, 141, 28):Color.fromARGB(255, 0, 0, 0),
                    ),),
            ],
          ),Row(
            children: [
              const Text('Chain of Responsibility Task status:',
                style: TextStyle(
                      fontSize: 30,
                      fontFamily: 'PixelFont', 
                    ),),
              Text(completed_pats[4]?'Complete':'Incomplete',
                style: TextStyle(
                      fontSize: 30,
                      fontFamily: 'PixelFont', 
                      color: completed_pats[4]?Color.fromARGB(255, 7, 141, 28):Color.fromARGB(255, 0, 0, 0), 
                    ),),
            ],
          ),
          Row(
            children: [
              const Text('Facade Task status:',
                style: TextStyle(
                      fontSize: 30,
                      fontFamily: 'PixelFont', 
                    ),),
              Text(completed_pats[5]?'Complete':'Incomplete',
                style:  TextStyle(
                      fontSize: 30,
                      fontFamily: 'PixelFont', 
                      color: completed_pats[5]?Color.fromARGB(255, 7, 141, 28):Color.fromARGB(255, 0, 0, 0),
                    ),),
            ],
          ),

          SizedBox(height: 30,),
          
          ],
      ),
    );
  }
}