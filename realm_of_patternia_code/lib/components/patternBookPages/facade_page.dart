// ignore_for_file: camel_case_types

import 'package:flutter/widgets.dart';
import 'package:realm_of_patternia/components/objectives.dart';
import 'package:realm_of_patternia/components/widgets/pattern_book_row.dart';
import 'package:realm_of_patternia/realm_of_patternia.dart';

class Facade_Page extends StatefulWidget {
  const Facade_Page({super.key, required this.game});
  final Realm_of_Patternia game;

  @override
  State<Facade_Page> createState() => _Facade_PageState();
}

class _Facade_PageState extends State<Facade_Page> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        BookPageRow(
            title: 'Facade Description',
            paragraph: 'Facade is a structural design pattern that provides a simplified interface to a library, a framework, or any other complex set of classes.',
            image: 'assets/images/Pattern_Components/facade_icon.png',
            audio: 'pattern_components/facade.mp3',
            game: widget.game
          ),
        const Row(
          children: [
            Text('Facade Components',
              style: TextStyle(
                    fontSize: 30,
                    fontFamily: 'PixelFont', 
                  ),),
          ],
        ),
        Column(
          children: List.generate(faca_strcut.length, (index) {
          return FacadeComps[index]? BookPageRow(
            title: faca_strcut[index],
            paragraph: faca_comp_details[index],
            image: faca_comp_imgs[index],
            audio: faca_comp_audio[index],
            game: widget.game,
          ): Container();
        }),
        ),
          if (FacadeCompsTask[0]==true && FacadeCompsTask[1]==true && FacadeCompsTask[2]==true && FacadeCompsTask[3]==true)Container(
                decoration: const BoxDecoration(
                  image: DecorationImage(image: AssetImage( 'assets/images/UI/Banners/Component_BG.png' ), fit: BoxFit.fill),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(15),
                  child: Column(
                    children: [
                      const Text('Facade Diagram',
                        style: TextStyle(
                              fontSize: 40,
                              fontFamily: 'PixelFont', 
                            ),),
                      SizedBox(height: 30,),
                      Image.asset('assets/images/Pattern_Components/Facade.png'),
                    ],
                  ),
                ),
              ),
      ],
    );
  }
}