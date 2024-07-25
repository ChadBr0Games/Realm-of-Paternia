import 'package:flutter/widgets.dart';
import 'package:realm_of_patternia/components/objectives.dart';
import 'package:realm_of_patternia/realm_of_patternia.dart';

class Observer_Page extends StatefulWidget {
  const Observer_Page({super.key, required this.game});
  final Realm_of_Patternia game;

  @override
  State<Observer_Page> createState() => _Observer_PageState();
}

class _Observer_PageState extends State<Observer_Page> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          const Row(
            children: [
              Text('Observer Stats',
                style: TextStyle(
                      fontSize: 40,
                      fontFamily: 'PixelFont',
                      fontWeight: FontWeight.bold, 
                    ),),
            ],
          ),
          Row(
            children: [
              const Text('Observer components collected:',
                style: TextStyle(
                      fontSize: 30,
                      fontFamily: 'PixelFont', 
                    ),),
              Text('${obs_comps_num}/4',
                style: const TextStyle(
                      fontSize: 30,
                      fontFamily: 'PixelFont', 
                    ),),
              SizedBox(width: 10,),
              Image.asset('assets/images/Pattern_Components/Items/comp_news_scroll.png')
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
                style:TextStyle(
                      fontSize: 30,
                      fontFamily: 'PixelFont', 
                      color: completed_pats[2]?Color.fromARGB(255, 7, 141, 28):Color.fromARGB(255, 0, 0, 0), 
                    ),),
            ],
          ),
          Row(
            children: [
              const Text('Time taken to complete Observer Task - ',
                style: TextStyle(
                      fontSize: 30,
                      fontFamily: 'PixelFont', 
                    ),),
              Text('${ObserverSW.elapsed.inSeconds} Seconds',
                style:TextStyle(
                      fontSize: 30,
                      fontFamily: 'PixelFont', 
                      color: completed_pats[2]?Color.fromARGB(255, 7, 141, 28):Color.fromARGB(255, 0, 0, 0),
                    ),),
            ],
          ),
          SizedBox(height: 30,),
          const Text('Observer Badge',
                style: TextStyle(
                      fontSize: 40,
                      fontFamily: 'PixelFont',
                      fontWeight: FontWeight.bold, 
                    ),),
          SizedBox(height: 30,),
          if(ObserverCompsTask[0]==true && ObserverCompsTask[0]==true && ObserverCompsTask[0]==true && ObserverCompsTask[0]==true)Image.asset('assets/images/badges/badge_observer.png') 
          ],
      ),
    );
  }
}