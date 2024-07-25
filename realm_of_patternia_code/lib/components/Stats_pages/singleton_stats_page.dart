import 'package:flutter/widgets.dart';
import 'package:realm_of_patternia/components/objectives.dart';
import 'package:realm_of_patternia/realm_of_patternia.dart';

class Singleton_Page extends StatefulWidget {
  const Singleton_Page({super.key, required this.game});
  final Realm_of_Patternia game;

  @override
  State<Singleton_Page> createState() => _Singleton_PageState();
}

class _Singleton_PageState extends State<Singleton_Page> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          const Row(
            children: [
              Text('Singleton Stats',
                style: TextStyle(
                      fontSize: 40,
                      fontFamily: 'PixelFont',
                      fontWeight: FontWeight.bold, 
                    ),),
            ],
          ),
          Row(
            children: [
              const Text('Singleton components collected:',
                style: TextStyle(
                      fontSize: 30,
                      fontFamily: 'PixelFont', 
                    ),),
              Text('${sing_comps_num}/2',
                style: const TextStyle(
                      fontSize: 30,
                      fontFamily: 'PixelFont', 
                    ),),
              SizedBox(width: 10,),
              Image.asset('assets/images/Pattern_Components/Items/comp_tax_coin.png')
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
              const Text('Time taken to complete Singleton Task - ',
                style: TextStyle(
                      fontSize: 30,
                      fontFamily: 'PixelFont', 
                    ),),
              Text('${SingletonSW.elapsed.inSeconds} Seconds',
                style: TextStyle(
                      fontSize: 30,
                      fontFamily: 'PixelFont',  
                      color: completed_pats[1]?Color.fromARGB(255, 7, 141, 28):Color.fromARGB(255, 0, 0, 0),
                    ),),
            ],
          ),
          SizedBox(height: 30,),
          const Text('Singleton Badge',
                style: TextStyle(
                      fontSize: 40,
                      fontFamily: 'PixelFont',
                      fontWeight: FontWeight.bold, 
                    ),),
          SizedBox(height: 30,),
          if (SingletonCompsTask[0]==true && SingletonCompsTask[1]==true )Image.asset('assets/images/badges/badge_singleton.png') 
          ],
      ),
    );
  }
}