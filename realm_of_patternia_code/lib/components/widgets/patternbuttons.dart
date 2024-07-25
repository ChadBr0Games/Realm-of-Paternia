import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:realm_of_patternia/components/objectives.dart';

class PatternButton extends StatefulWidget {
  const PatternButton({super.key, required this.stats, required this.id, required this.selected});
  final int id;
  final bool selected;
  final bool stats;

  @override
  State<PatternButton> createState() => _PatternButtonState();
}

class _PatternButtonState extends State<PatternButton> {

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
        width: 240,
        height: 110,
        decoration: BoxDecoration(
          image: DecorationImage(image: AssetImage(widget.selected ? 'assets/images/UI/Buttons/Button_Hover_3Slides.png' : _isHovering ? ( 'assets/images/UI/Buttons/Button_Hover_3Slides.png' ) : 'assets/images/UI/Buttons/Button_Blue_3Slides.png' ), fit: BoxFit.fill),
        
        ),
        
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              child: Text(widget.stats? spats[widget.id]:pats[widget.id],
                style: TextStyle(
                  fontSize: 20,
                  color: widget.selected ? const Color.fromARGB(255, 70, 70, 70) : _isHovering ? const Color.fromARGB(255, 70, 70, 70): Colors.white,
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