// ignore_for_file: unused_field

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:realm_of_patternia/components/game_audio/audio_settings.dart';
import 'package:realm_of_patternia/components/objectives.dart';
import 'package:realm_of_patternia/components/widgets/fs_button.dart';
import 'package:realm_of_patternia/components/widgets/slider.dart';
import 'package:realm_of_patternia/realm_of_patternia.dart';

class OptionsOverlay extends StatefulWidget {
  const OptionsOverlay({super.key, required this.game});
  final Realm_of_Patternia game;

  @override
  State<OptionsOverlay> createState() => _OptionsOverlayState();
}

class _OptionsOverlayState extends State<OptionsOverlay> {
  int _selectedIndex = 0;

  void _onTabSelected(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  bool _isHovering = false;
  bool _isHoveringbtn = false;

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
    
    return Center(
      child: Container(
        width: 1920/1.25,
        height: 1080/1.25,
        decoration: BoxDecoration(image: DecorationImage(image: AssetImage( 'assets/images/UI/Banners/pattern_book_BG.png'), fit: BoxFit.fill)),
        child: Column(
            children: [
              
              FractionallySizedBox(
                widthFactor: 0.98,
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.fromLTRB(8,18,8,28),
                      child: Row(
                        children: [
                          MouseRegion(
                            onEnter: _onEnterButton,
                            onExit: _onExitButton,
                            cursor: SystemMouseCursors.click,
                            child: GestureDetector(
                              onTap:() {widget.game.overlays.remove('OptionsOverlay');} ,
                              child: Image.asset(_isHoveringbtn ?'assets/images/UI/Buttons/Hover_1.png':'assets/images/UI/Buttons/Regular_1.png',
                                width: 64,
                                height: 64,
                              )
                            ),
                          ),
                          const Text('Options',
                            style: TextStyle(
                              fontSize: 40,
                              fontFamily: 'PixelFont', 
                            ),
                          ),
                        ],
                      ),
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.fromLTRB(18,0,0,0),
                          child: Row(
                            children: [
                              const Text('Voice Volume:',
                                style: TextStyle(
                                      fontSize: 30,
                                      fontFamily: 'PixelFont', 
                                    ),),
                              SizedBox(width: 207,),
                              VolumeSliderScreen(volume_control: 1,),
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.fromLTRB(18,0,0,0),
                          child: Row(
                            children: [
                              const Text('Background Music volume:',
                                style: TextStyle(
                                      fontSize: 30,
                                      fontFamily: 'PixelFont', 
                                    ),),
                              SizedBox(width: 10,),
                              VolumeSliderScreen(volume_control: 2,),
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.fromLTRB(18,0,0,0),
                          child: Row(
                            children: [
                              const Text('Environment Volume:',
                                style: TextStyle(
                                      fontSize: 30,
                                      fontFamily: 'PixelFont', 
                                    ),),
                              SizedBox(width: 100,),
                              VolumeSliderScreen(volume_control: 0,),
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.fromLTRB(18,0,0,0),
                          child: FSButton(game: widget.game,),
                        ),
                      ],
                    )
                    
                  ],
                ),
              ),
              
              
              const SizedBox(
                height: 30,
              ),
              
            ],
          ),
        
      ),
    );
  }
}