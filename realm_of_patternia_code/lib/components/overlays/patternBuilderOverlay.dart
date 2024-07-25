// ignore_for_file: file_names

import 'package:flame_audio/flame_audio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:realm_of_patternia/components/game_tasks/adapter_task.dart';
import 'package:realm_of_patternia/components/game_tasks/chain_of_responsibility_task.dart';
import 'package:realm_of_patternia/components/game_tasks/facade_task.dart';
import 'package:realm_of_patternia/components/game_tasks/factory_task.dart';
import 'package:realm_of_patternia/components/game_tasks/observer_task.dart';
import 'package:realm_of_patternia/components/game_tasks/singleton_task.dart';
import 'package:realm_of_patternia/components/objectives.dart';
import 'package:realm_of_patternia/realm_of_patternia.dart';

class PatternBuilderOverlay extends StatefulWidget {
  const PatternBuilderOverlay({super.key, required this.game});
  final Realm_of_Patternia game;

  @override
  State<PatternBuilderOverlay> createState() => _PatternBuilderOverlayState();
}

class _PatternBuilderOverlayState extends State<PatternBuilderOverlay> {

  bool _isHoveringbtn = false;
    

  void _onEnterButton(PointerEvent details) {
    setState(() {
      _isHoveringbtn = true;
    });
  }

  void _onExitButton(PointerEvent details) {
    setState(() {
      _isHoveringbtn = false;
    });
  }
  @override
  Widget build(BuildContext context) {
    
    widget.game.GamePaused = true;
    Widget puzzle;
    //print(pats[widget.game.chal]);
    switch (pats[widget.game.chal]){
      
      case 'Factory':
        puzzle = FactoryTask(game: widget.game,);

      case 'Singleton':
        puzzle = SingletonTask(game: widget.game,);
        
      case 'Observer':
        puzzle = ObserverTask(game: widget.game,);

      case 'Adapter':
        puzzle = AdapterTask(game: widget.game,);

      case 'Chain of Responsibility':
        puzzle = ChainTask(game: widget.game,);

      case 'Facade':
        puzzle = FacadeTask(game: widget.game,);
      default:
        puzzle = FactoryTask(game: widget.game,);

    }
    
    return  Scaffold(
      
      backgroundColor: Colors.transparent,
      body: Center(
        child: Container(
          width: 1920,
          height: 1080,
          decoration: BoxDecoration(image: DecorationImage(image: AssetImage( 'assets/images/UI/Banners/pattern_builder_BG.png'), fit: BoxFit.fill)),
          
          child: FractionallySizedBox(
              widthFactor: 0.98,
              heightFactor: 0.96,
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.fromLTRB(8,18,8,8),
                    child: Row(
                      children: [
                        MouseRegion(
                          onEnter: _onEnterButton,
                          onExit: _onExitButton,
                          cursor: SystemMouseCursors.click,
                          child: GestureDetector(
                            onTap:() {
                              widget.game.overlays.remove('PatternBuilderOverlay');
                              widget.game.GamePaused = false;
                              
                              if(num_comp_pats==pats.length){
                                GameSW.stop();
                                widget.game.overlays.add('StatsOverlay');
                              }

                              switch (pats[widget.game.chal]){
      
                                case 'Factory':
                                  if( factoryCompsTask[0]==true && factoryCompsTask[1]==true && factoryCompsTask[2]==true && factoryCompsTask[3]==true){
                                    close_function();
                                    FactorySW.stop();
                                  }
                                  

                                case 'Singleton':
                                  if (SingletonCompsTask[0]==true && SingletonCompsTask[1]==true ){
                                    close_function();
                                    SingletonSW.stop();
                                  }
                                  
                                  
                                case 'Observer':
                                  if(ObserverCompsTask[0]==true && ObserverCompsTask[0]==true && ObserverCompsTask[0]==true && ObserverCompsTask[0]==true){
                                    close_function();
                                    ObserverSW.stop();
                                  }
                                  

                                case 'Adapter':
                                  if(AdapterCompsTask[0]==true && AdapterCompsTask[1]==true && AdapterCompsTask[2]==true &&AdapterCompsTask[3]==true){
                                    close_function();
                                    AdapterSW.stop();
                                  }
                                  

                                case 'Chain of Responsibility':
                                  if(ChainCompsTask[0]==true && ChainCompsTask[1]==true && ChainCompsTask[2]==true && ChainCompsTask[3]==true ){
                                    close_function();
                                    ChainSW.stop();
                                  }
                                  

                                case 'Facade':
                                  if (FacadeCompsTask[0]==true && FacadeCompsTask[1]==true && FacadeCompsTask[2]==true && FacadeCompsTask[3]==true){
                                    close_function();
                                    FacadeSW.stop();
                                  }
                                  


                              }
                            } ,
                            child: Image.asset(_isHoveringbtn ?'assets/images/UI/Buttons/Hover_1.png':'assets/images/UI/Buttons/Regular_1.png',
                              width: 64,
                              height: 64,
                            )
                          ),
                        ),
                        Text('Design Pattern: ${pats[widget.game.chal]}',
                          style: TextStyle(
                            fontSize: 30,
                            fontFamily: 'PixelFont', 
                          ),
                        ),
                      ],
                    ),
                  ),
                  
                  Expanded(
                    child: SingleChildScrollView(
                      scrollDirection: Axis.vertical,
                      child:FractionallySizedBox(widthFactor: 0.90,child: puzzle)
                    ),
                  ),
                  const SizedBox(
                    height: 30,
                  )
                ],
              )
              )
          
        ),
      ),
    );
  }
}