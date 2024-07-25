// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:flutter/widgets.dart';
import 'package:realm_of_patternia/components/objectives.dart';
import 'package:realm_of_patternia/realm_of_patternia.dart';

class Adapter_Page extends StatefulWidget {
  const Adapter_Page({super.key, required this.game});
  final Realm_of_Patternia game;

  @override
  State<Adapter_Page> createState() => _Adapter_PageState();
}

class _Adapter_PageState extends State<Adapter_Page> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Row(
            children: [
              Text('Adapter Stats',
                style: TextStyle(
                      fontSize: 40,
                      fontFamily: 'PixelFont',
                      fontWeight: FontWeight.bold, 
                    ),),
            ],
          ),
          Row(
            children: [
              Text('Adapter components collected:',
                style: TextStyle(
                      fontSize: 30,
                      fontFamily: 'PixelFont', 
                    ),),
              Text('${adap_comps_num}/4',
                style: TextStyle(
                      fontSize: 30,
                      fontFamily: 'PixelFont', 
                    ),),
              SizedBox(width: 10,),
              Image.asset('assets/images/Pattern_Components/Items/comp_weather_scroll.png')
            ],
          ),
          Row(
            children: [
              Text('Adapter Task status:',
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
          ),
          Row(
            children: [
              const Text('Time taken to complete Adapter Task - ',
                style: TextStyle(
                      fontSize: 30,
                      fontFamily: 'PixelFont', 
                    ),),
              Text('${AdapterSW.elapsed.inSeconds} Seconds',
                style: TextStyle(
                      fontSize: 30,
                      fontFamily: 'PixelFont',  
                      color: completed_pats[3]?Color.fromARGB(255, 7, 141, 28):Color.fromARGB(255, 0, 0, 0),
                    ),),
                    
            ],
          ),
          SizedBox(height: 30,),
          Text('Adpater Badge',
                style: TextStyle(
                      fontSize: 40,
                      fontFamily: 'PixelFont',
                      fontWeight: FontWeight.bold, 
                    ),),
          SizedBox(height: 30,),
          if(AdapterCompsTask[0]==true && AdapterCompsTask[1]==true && AdapterCompsTask[2]==true &&AdapterCompsTask[3]==true)Image.asset('assets/images/badges/badge_adapter.png') 
          ],
      ),
    );
  }
}