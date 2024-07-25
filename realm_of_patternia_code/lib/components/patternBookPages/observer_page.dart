import 'package:flutter/widgets.dart';
import 'package:realm_of_patternia/components/objectives.dart';
import 'package:realm_of_patternia/components/widgets/pattern_book_row.dart';
import 'package:realm_of_patternia/realm_of_patternia.dart';

class Observer_Page extends StatefulWidget {
  const Observer_Page({super.key, required this.game});
  final Realm_of_Patternia game;

  @override
  State<Observer_Page> createState() => _Observer_PageState();
}

class _Observer_PageState extends State<Observer_Page> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          BookPageRow(
            title: 'Observer Description',
            paragraph: 'Observer is a behavioral design pattern that lets you define a subscription mechanism to notify multiple objects about any events that happen to the object they’re observing.',
            image: 'assets/images/Pattern_Components/observer_icon.png',
            audio: 'pattern_components/observer.mp3',
            game: widget.game
          ),
          const Row(
            children: [
              Text('Observer Components',
                style: TextStyle(
                      fontSize: 30,
                      fontFamily: 'PixelFont', 
                    ),),
            ],
          ),
          Column(
            children: List.generate(obse_strcut.length, (index) {
            return ObserverComps[index]? BookPageRow(
              title: obse_strcut[index],
              paragraph: obse_comp_details[index],
              image: obse_comp_imgs[index],
              audio: obse_comp_audio[index],
              game: widget.game,
            ): Container();
          }),
          ),
          if(ObserverCompsTask[0]==true && ObserverCompsTask[0]==true && ObserverCompsTask[0]==true && ObserverCompsTask[0]==true)Container(
                decoration: const BoxDecoration(
                  image: DecorationImage(image: AssetImage( 'assets/images/UI/Banners/Component_BG.png' ), fit: BoxFit.fill),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(15),
                  child: Column(
                    children: [
                      const Text('Observer Diagram',
                        style: TextStyle(
                              fontSize: 40,
                              fontFamily: 'PixelFont', 
                            ),),
                      SizedBox(height: 30,),
                      Image.asset('assets/images/Pattern_Components/Observer.png'),
                    ],
                  ),
                ),
              ),
        ],
      ),
    );
  }
}