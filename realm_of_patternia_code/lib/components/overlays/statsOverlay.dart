// ignore_for_file: unused_field

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:realm_of_patternia/components/Stats_pages/adapter_stats_page.dart';
import 'package:realm_of_patternia/components/Stats_pages/chain_of_reponsibility_stats_page.dart';
import 'package:realm_of_patternia/components/Stats_pages/facade_stats_page.dart';
import 'package:realm_of_patternia/components/Stats_pages/factory_stats_page.dart';
import 'package:realm_of_patternia/components/Stats_pages/observer_stats_page.dart';
import 'package:realm_of_patternia/components/Stats_pages/overall_stats_page.dart';
import 'package:realm_of_patternia/components/Stats_pages/singleton_stats_page.dart';
import 'package:realm_of_patternia/components/widgets/patternbuttons.dart';
import 'package:realm_of_patternia/realm_of_patternia.dart';

class StatsOverlay extends StatefulWidget {
  const StatsOverlay({super.key, required this.game});
  final Realm_of_Patternia game;

  @override
  State<StatsOverlay> createState() => _StatsOverlayState();
}

class _StatsOverlayState extends State<StatsOverlay> {
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
    final List<Widget> pages =[
      Overall_Page(game: widget.game),
      Factory_Page(game: widget.game), 
      Singleton_Page(game: widget.game), 
      Observer_Page(game: widget.game), 
      Adapter_Page(game: widget.game), 
      Chain_of_Responsibility_Page(game: widget.game), 
      Facade_Page(game: widget.game),
      ];
    return Center(
      child: Container(
        width: 1920,
        height: 1080,
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
                              onTap:() {widget.game.overlays.remove('StatsOverlay');} ,
                              child: Image.asset(_isHoveringbtn ?'assets/images/UI/Buttons/Hover_1.png':'assets/images/UI/Buttons/Regular_1.png',
                                width: 64,
                                height: 64,
                              )
                            ),
                          ),
                          const Text('Design Patterns Tasks and Badges',
                            style: TextStyle(
                              fontSize: 40,
                              fontFamily: 'PixelFont', 
                            ),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      color: Colors.transparent,
                      child: SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: List.generate(pages.length, (index) {
                            return MouseRegion(
                              onEnter: _onEnter,
                              onExit: _onExit,
                              child: GestureDetector(
                                onTap: () => _onTabSelected(index),
                                child: PatternButton(stats: true, id: index, selected: index ==_selectedIndex,)
                              ),
                            );
                          }),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Expanded(
                child: SingleChildScrollView(
                  scrollDirection: Axis.vertical,
                  child:FractionallySizedBox(widthFactor: 0.90,child: pages[_selectedIndex])
                ),
              ),
              
              const SizedBox(
                height: 30,
              )
            ],
          ),
        
      ),
    );
  }
}