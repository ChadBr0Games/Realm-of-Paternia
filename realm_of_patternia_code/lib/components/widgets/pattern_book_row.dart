import 'package:flame_audio/flame_audio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:realm_of_patternia/realm_of_patternia.dart';

class BookPageRow extends StatefulWidget {
  const BookPageRow({super.key, required this.title, required this.paragraph, required this.image, required this.audio, required this.game});
  final String title, paragraph, image, audio;
  final Realm_of_Patternia game;

  @override
  State<BookPageRow> createState() => _BookPageRowState();
}

class _BookPageRowState extends State<BookPageRow> {

  bool _isHovering = false;
  double play_btn_size=32;
  

  void _onEnter(PointerEvent details) {
    setState(() {
      _isHovering = true;
    });
  }

  void _onExit(PointerEvent details) {
    setState(() {
      _isHovering = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        decoration: BoxDecoration(
          image: DecorationImage(image: AssetImage( 'assets/images/UI/Banners/Component_BG.png' ), fit: BoxFit.fill),
        ),
        child: Column(
          children: [
            Row(
              
              children: [
                MouseRegion(
                  cursor: SystemMouseCursors.click,
                  onEnter: _onEnter,
                  onExit: _onExit,
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(8,8,18,8),
                    child: GestureDetector(
                      
                      child: widget.game.voice_is_playing&&true? 
                        Image.asset(_isHovering ?'assets/images/UI/Buttons/Hover_3.png':'assets/images/UI/Buttons/Regular_3.png',
                        width:play_btn_size,
                        height:play_btn_size,
                        )
                        :
                        Image.asset(_isHovering ?'assets/images/UI/Buttons/Hover_2.png':'assets/images/UI/Buttons/Regular_2.png',
                        width:play_btn_size,
                        height:play_btn_size,
                        ),
                      
                        onTap: () {
                          if(widget.game.voice_is_playing){
                            FlameAudio.bgm.voicestop();
                            widget.game.voice_is_playing=false;
                          }else{
                            FlameAudio.bgm.voiceplay(widget.audio);
                            widget.game.voice_is_playing=true;
                          }
                          
                          },// Size of the image icon
                      ),
                  ),
                    
                    
                  ),
                
                Text(widget.title, 
                      style: const TextStyle(
                        fontSize: 30,
                        fontFamily: 'PixelFont', 
                      ),),
              ],
              ),
              Align(
                alignment: Alignment.topLeft,
                child: SingleChildScrollView(
                  
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Container(
                        
                        width: 1000,
                        child: Padding(
                          padding: EdgeInsets.fromLTRB(9, 9, 9, 9),
                          child: Container(
                            alignment: Alignment.centerLeft,
                            child: Text(widget.paragraph, 
                              style: const TextStyle(
                                fontSize: 25,
                                fontFamily: 'PixelFont', 
                              ),
                              softWrap: true,
                              overflow: TextOverflow.visible,
                              textAlign: TextAlign.left,
                              
                              
                              ),
                          ),
                          ),
                      ),
                      
                        
                          
                          
                          Padding(
                            padding: EdgeInsets.fromLTRB(20, 20, 20, 20),
                            child: Image.asset(widget.image),
                          ),
                        
                      ],
                  
                  ),
                ),
              )
            
          ],
        ),
        
      ),
    );
  }
}