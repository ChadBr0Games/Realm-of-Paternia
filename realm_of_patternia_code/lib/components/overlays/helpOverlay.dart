// ignore_for_file: unused_field

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:realm_of_patternia/realm_of_patternia.dart';

class HelpOverlay extends StatefulWidget {
  const HelpOverlay({super.key, required this.game});
  final Realm_of_Patternia game;

  @override
  State<HelpOverlay> createState() => _HelpOverlayState();
}

class _HelpOverlayState extends State<HelpOverlay> {
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
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Column(
              children: [
                
                FractionallySizedBox(
                  widthFactor: 0.98,
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
                                onTap:() {widget.game.overlays.remove('HelpOverlay');} ,
                                child: Image.asset(_isHoveringbtn ?'assets/images/UI/Buttons/Hover_1.png':'assets/images/UI/Buttons/Regular_1.png',
                                  width: 64,
                                  height: 64,
                                )
                              ),
                            ),
                            const Text('Controls Help',
                              style: TextStyle(
                                fontSize: 40,
                                fontFamily: 'PixelFont', 
                              ),
                            ),
                          ],
                        ),
                      ),
                      
                      Image.asset('assets/images/UI/Banners/Help.png'),
                      Image.asset('assets/images/UI/Banners/Help2.png'),
                            
                      
                      
                    ],
                  ),
                ),
                
                
                
              ],
            ),
        ),
        
      ),
    );
  }
}