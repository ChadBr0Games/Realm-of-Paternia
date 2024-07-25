import 'package:flutter/widgets.dart';
import 'package:realm_of_patternia/components/objectives.dart';
import 'package:realm_of_patternia/components/widgets/pattern_book_row.dart';
import 'package:realm_of_patternia/realm_of_patternia.dart';

class Singleton_Page extends StatefulWidget {
  const Singleton_Page({super.key, required this.game});
  final Realm_of_Patternia game;

  @override
  State<Singleton_Page> createState() => _Singleton_PageState();
}

class _Singleton_PageState extends State<Singleton_Page> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          BookPageRow(
            title: 'Singleton Description',
            paragraph: 'Singleton is a creational design pattern that lets you ensure that a class has only one instance, while providing a global access point to this instance.',
            image: 'assets/images/Pattern_Components/singleton_icon.png',
            audio: 'pattern_components/singleton.mp3',
            game: widget.game
          ),
          const Row(
            children: [
              Text('Singleton Components',
                style: TextStyle(
                      fontSize: 30,
                      fontFamily: 'PixelFont', 
                    ),),
            ],
          ),
          Column(
            children: List.generate(sing_strcut.length, (index) {
            return SingletonComps[index] ? BookPageRow(
              title: sing_strcut[index],
              paragraph: sing_comp_details[index],
              image: sing_comp_imgs[index],
              audio: sing_comp_audio[index],
              game: widget.game,
            ): Container();
          }),
          ),
          if (SingletonCompsTask[0]==true && SingletonCompsTask[1]==true )Container(
                decoration: const BoxDecoration(
                  image: DecorationImage(image: AssetImage( 'assets/images/UI/Banners/Component_BG.png' ), fit: BoxFit.fill),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(15),
                  child: Column(
                    children: [
                      const Text('Singleton Diagram',
                        style: TextStyle(
                              fontSize: 40,
                              fontFamily: 'PixelFont', 
                            ),),
                      SizedBox(height: 30,),
                      Image.asset('assets/images/Pattern_Components/Singleton.png'),
                    ],
                  ),
                ),
              ),
        ],
      ),
    );
  }
}