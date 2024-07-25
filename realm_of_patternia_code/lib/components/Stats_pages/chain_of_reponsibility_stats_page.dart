import 'package:flutter/widgets.dart';
import 'package:realm_of_patternia/components/objectives.dart';
import 'package:realm_of_patternia/realm_of_patternia.dart';

class Chain_of_Responsibility_Page extends StatefulWidget {
  const Chain_of_Responsibility_Page({super.key, required this.game});
  final Realm_of_Patternia game;

  @override
  State<Chain_of_Responsibility_Page> createState() => _Chain_of_Responsibility_PageState();
}

class _Chain_of_Responsibility_PageState extends State<Chain_of_Responsibility_Page> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          const Row(
            children: [
              Text('Chain of Responsibility Stats',
                style: TextStyle(
                      fontSize: 40,
                      fontFamily: 'PixelFont',
                      fontWeight: FontWeight.bold, 
                    ),),
            ],
          ),
          Row(
            children: [
              const Text('Chain of Responsibility components collected:',
                style: TextStyle(
                      fontSize: 30,
                      fontFamily: 'PixelFont', 
                    ),),
              Text('${chain_comps_num}/4',
                style: const TextStyle(
                      fontSize: 30,
                      fontFamily: 'PixelFont', 
                    ),),
              SizedBox(width: 10,),
              Image.asset('assets/images/Pattern_Components/Items/comp_saw.png')
            ],
          ),
          Row(
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
              const Text('Time taken to complete Chain of Responsibility Task - ',
                style: TextStyle(
                      fontSize: 30,
                      fontFamily: 'PixelFont', 
                    ),),
              Text('${ChainSW.elapsed.inSeconds} Seconds',
                style: TextStyle(
                      fontSize: 30,
                      fontFamily: 'PixelFont',  
                      color: completed_pats[4]?Color.fromARGB(255, 7, 141, 28):Color.fromARGB(255, 0, 0, 0),
                    ),),
            ],
          ),
          SizedBox(height: 30,),
          const Text('Chain of Responsibility Badge',
                style: TextStyle(
                      fontSize: 40,
                      fontFamily: 'PixelFont',
                      fontWeight: FontWeight.bold, 
                    ),),
          SizedBox(height: 30,),
          if(ChainCompsTask[0]==true && ChainCompsTask[1]==true && ChainCompsTask[2]==true && ChainCompsTask[3]==true )Image.asset('assets/images/badges/badge_chain.png') 
          ],
      ),
    );
  }
}