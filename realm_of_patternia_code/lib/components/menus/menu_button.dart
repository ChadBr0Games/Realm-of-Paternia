// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';

class MenuButton extends StatefulWidget {
  final String text;
  var onPress;

  MenuButton({super.key, required this.text, required this.onPress});

  @override
  State<MenuButton> createState() => _MenuButtonState();
}

class _MenuButtonState extends State<MenuButton> {

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
      child: GestureDetector(
        onTap: widget.onPress,
        child: Container(
          width: _isHovering ? 270 :260,
          height: 80,
          padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 20),
          decoration: BoxDecoration(
            image: DecorationImage(image: AssetImage( 'assets/images/UI/Buttons/test_menu_button.png' ), fit: BoxFit.cover),
            
          ),
          child: Column(
            children: [
              Center(
                child:_isHovering ? Text(
                  widget.text,
                  style: const TextStyle(
                    fontSize: 22,
                    color: Colors.yellow,
                    fontFamily: 'PixelFont', // You need to add a pixel art font to your project
                  ),
                ) : Text(
                  widget.text,
                  style: const TextStyle(
                    fontSize: 20,
                    color: Colors.white,
                    fontFamily: 'PixelFont', // You need to add a pixel art font to your project
                  ),
                ),
              ),
            ],
          ),
          
        
        ),
      ),
    );
  }
}