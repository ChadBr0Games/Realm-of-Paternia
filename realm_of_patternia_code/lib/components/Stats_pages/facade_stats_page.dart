// ignore_for_file: camel_case_types

import 'package:flutter/widgets.dart';
import 'package:realm_of_patternia/components/objectives.dart';
import 'package:realm_of_patternia/realm_of_patternia.dart';

class Facade_Page extends StatefulWidget {
  const Facade_Page({super.key, required this.game});
  final Realm_of_Patternia game;

  @override
  State<Facade_Page> createState() => _Facade_PageState();
}

class _Facade_PageState extends State<Facade_Page> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          const Row(
            children: [
              Text('Facade Stats',
                style: TextStyle(
                      fontSize: 40,
                      fontFamily: 'PixelFont',
                      fontWeight: FontWeight.bold, 
                    ),),
            ],
          ),
          Row(
            children: [
              const Text('Facade components collected:',
                style: TextStyle(
                      fontSize: 30,
                      fontFamily: 'PixelFont', 
                    ),),
              Text('${faca_comps_num}/4',
                style: const TextStyle(
                      fontSize: 30,
                      fontFamily: 'PixelFont', 
                    ),),
              SizedBox(width: 10,),
              Image.asset('assets/images/Pattern_Components/Items/comp_books.png')
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
                style:TextStyle(
                      fontSize: 30,
                      fontFamily: 'PixelFont', 
                      color: completed_pats[5]?Color.fromARGB(255, 7, 141, 28):Color.fromARGB(255, 0, 0, 0),
                    ),),
            ],
          ),
          Row(
            children: [
              const Text('Time taken to complete Facade Task - ',
                style: TextStyle(
                      fontSize: 30,
                      fontFamily: 'PixelFont', 
                    ),),
              Text('${FacadeSW.elapsed.inSeconds} Seconds',
                style:TextStyle(
                      fontSize: 30,
                      fontFamily: 'PixelFont', 
                      color: completed_pats[5]?Color.fromARGB(255, 7, 141, 28):Color.fromARGB(255, 0, 0, 0),
                    ),),
            ],
          ),
          SizedBox(height: 30,),
          const Text('Facade Badge',
                style: TextStyle(
                      fontSize: 40,
                      fontFamily: 'PixelFont',
                      fontWeight: FontWeight.bold, 
                    ),),
          SizedBox(height: 30,),
          if(FacadeCompsTask[0]==true && FacadeCompsTask[1]==true && FacadeCompsTask[2]==true && FacadeCompsTask[3]==true)Image.asset('assets/images/badges/badge_facade.png') 
          ],
      ),
    );
  }
}