import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
//import 'package:realm_of_patternia/components/objectives.dart';

class ComponentButton extends StatefulWidget {
  const ComponentButton({super.key, required this.text, required this.inDiagram});
  final String text;
  final bool inDiagram;

  @override
  State<ComponentButton> createState() => _ComponentButtonState();
}

class _ComponentButtonState extends State<ComponentButton> {

  bool _isHovering = false;

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
    return MouseRegion(
      onEnter: _onEnter,
      onExit: _onExit,
      child: Container(
        width: 280,
        height: 100,
        decoration: BoxDecoration(
          image: DecorationImage(image: AssetImage( widget.inDiagram ? 'assets/images/UI/Buttons/Button_Hover_3Slides.png' : _isHovering ? ( 'assets/images/UI/Buttons/Button_Hover_3Slides.png' ) : 'assets/images/UI/Buttons/Button_Blue_3Slides.png' ), fit: BoxFit.fill),
        
        ),
        
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              child: Text(widget.text,
                style: TextStyle(
                  fontSize: 20,
                  color:  widget.inDiagram ? const Color.fromARGB(255, 70, 70, 70) : _isHovering ? const Color.fromARGB(255, 70, 70, 70): Colors.white,
                  fontFamily: 'PixelFont', 
                ),
                softWrap: true,
                maxLines: 2,
                overflow: TextOverflow.visible,
                textAlign: TextAlign.center,
              ),
            ),
            SizedBox(height: 24,)
          ],
          ),                 
      ),
    );
  }
}