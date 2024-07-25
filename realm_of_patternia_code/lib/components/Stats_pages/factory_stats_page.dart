import 'package:flutter/widgets.dart';
import 'package:realm_of_patternia/components/objectives.dart';
import 'package:realm_of_patternia/realm_of_patternia.dart';

class Factory_Page extends StatefulWidget {
  const Factory_Page({super.key, required this.game});
  final Realm_of_Patternia game;

  @override
  State<Factory_Page> createState() => _Factory_PageState();
}

class _Factory_PageState extends State<Factory_Page> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          const Row(
            children: [
              Text('Factory Stats',
                style: TextStyle(
                      fontSize: 40,
                      fontFamily: 'PixelFont',
                      fontWeight: FontWeight.bold, 
                    ),),
            ],
          ),
          Row(
            children: [
              const Text('Factory components collected:',
                style: TextStyle(
                      fontSize: 30,
                      fontFamily: 'PixelFont', 
                    ),),
              Text('${fac_comps_num}/4',
                style: const TextStyle(
                      fontSize: 30,
                      fontFamily: 'PixelFont', 
                    ),),
              SizedBox(width: 10,),
              Image.asset('assets/images/Pattern_Components/Items/comp_gear.png'),
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
              const Text('Time taken to complete Factory Task - ',
                style: TextStyle(
                      fontSize: 30,
                      fontFamily: 'PixelFont', 
                    ),),
              Text('${FactorySW.elapsed.inSeconds} Seconds',
                style:TextStyle(
                      fontSize: 30,
                      fontFamily: 'PixelFont', 
                      color: completed_pats[0]?Color.fromARGB(255, 7, 141, 28):Color.fromARGB(255, 0, 0, 0),
                    ),),
            ],
          ),
          SizedBox(height: 30,),
          const Text('Factory Badge',
                style: TextStyle(
                      fontSize: 40,
                      fontFamily: 'PixelFont',
                      fontWeight: FontWeight.bold, 
                    ),),
          SizedBox(height: 30,),
          if( factoryCompsTask[0]==true && factoryCompsTask[1]==true && factoryCompsTask[2]==true && factoryCompsTask[3]==true)Image.asset('assets/images/badges/badge_factory.png')          
          ],
      ),
    );
  }
}