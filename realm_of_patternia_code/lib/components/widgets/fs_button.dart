
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:realm_of_patternia/components/objectives.dart';
import 'package:realm_of_patternia/realm_of_patternia.dart';
import 'package:fullscreen_window/fullscreen_window.dart';

class FSButton extends StatefulWidget {
  const FSButton({super.key, required this.game});
  final Realm_of_Patternia game;

  @override
  State<FSButton> createState() => _FSButtonState();
}

class _FSButtonState extends State<FSButton> {

  
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
    
    return Padding(
      padding: const EdgeInsets.fromLTRB(0,18,8,28),
      child: Row(
        children: [
          const Text('Display Mode:',
            style: TextStyle(
                  fontSize: 30,
                  fontFamily: 'PixelFont', 
                ),),
          SizedBox(width: 324,),
          Text(isFS?'FullScreen':'Windowed',
            style: TextStyle(
                  fontSize: 30,
                  fontFamily: 'PixelFont', 
                ),),
          SizedBox(width: 47,),
          MouseRegion(
            onEnter: _onEnterButton,
            onExit: _onExitButton,
            cursor: SystemMouseCursors.click,
            child: GestureDetector(
              onTap: toggleFullscreen ,
              child: Image.asset(_isHoveringbtn ?(isFS?'assets/images/UI/Pointers/08.png':'assets/images/UI/Pointers/02.png'):(isFS?'assets/images/UI/Pointers/09.png':'assets/images/UI/Pointers/07.png'),
                width: 64,
                height: 64,
              )
            ),
          ),
        ],
      ),
    );
  }
  void toggleFullscreen() {
    setState(() {
      isFS = !isFS;
    });

    if (isFS) {
      FullScreenWindow.setFullScreen(true);
    } else {
      FullScreenWindow.setFullScreen(false); 
    }
  }

}