import 'package:flutter/widgets.dart';
import 'package:realm_of_patternia/components/objectives.dart';
import 'package:realm_of_patternia/components/widgets/pattern_book_row.dart';
import 'package:realm_of_patternia/realm_of_patternia.dart';

class Factory_Page extends StatefulWidget {
  const Factory_Page({super.key, required this.game});
  final Realm_of_Patternia game;

  @override
  State<Factory_Page> createState() => _Factory_PageState();
}

class _Factory_PageState extends State<Factory_Page> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          BookPageRow(
            title: 'Factory Description',
            paragraph: 'Factory Method is a creational design pattern that provides an interface for creating objects in a superclass, but allows subclasses to alter the type of objects that will be created.',
            image: 'assets/images/Pattern_Components/factory_icon.png',
            audio: 'pattern_components/factory.mp3',
            game: widget.game
          ),
          const Row(
            children: [
              Text('Factory Components',
                style: TextStyle(
                      fontSize: 30,
                      fontFamily: 'PixelFont', 
                    ),),
            ],
          ),
          Column(
            children: List.generate(fact_strcut.length, (index) {
            return factoryComps[index]? BookPageRow(
              title: fact_strcut[index],
              paragraph: fact_comp_details[index],
              image: fact_comp_imgs[index],
              audio: fact_comp_audio[index],
              game: widget.game,
            ): Container();
          }),
          ),
          if( factoryCompsTask[0]==true && factoryCompsTask[1]==true && factoryCompsTask[2]==true && factoryCompsTask[3]==true)Container(
                decoration: const BoxDecoration(
                  image: DecorationImage(image: AssetImage( 'assets/images/UI/Banners/Component_BG.png' ), fit: BoxFit.fill),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(15),
                  child: Column(
                    children: [
                      const Text('Factory Diagram',
                        style: TextStyle(
                              fontSize: 40,
                              fontFamily: 'PixelFont', 
                            ),),
                      SizedBox(height: 30,),
                      Image.asset('assets/images/Pattern_Components/Factory.png'),
                    ],
                  ),
                ),
              ),
        ],
      ),
    );
  }
}