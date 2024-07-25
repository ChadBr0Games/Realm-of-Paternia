import 'package:flutter/widgets.dart';
import 'package:realm_of_patternia/components/objectives.dart';
import 'package:realm_of_patternia/components/widgets/pattern_book_row.dart';
import 'package:realm_of_patternia/realm_of_patternia.dart';

class Chain_of_Responsibility_Page extends StatefulWidget {
  const Chain_of_Responsibility_Page({super.key, required this.game});
  final Realm_of_Patternia game;

  @override
  State<Chain_of_Responsibility_Page> createState() => _Chain_of_Responsibility_PageState();
}

class _Chain_of_Responsibility_PageState extends State<Chain_of_Responsibility_Page> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          BookPageRow(
            title: 'Chain of Responsibility Description',
            paragraph: 'Chain of Responsibility is a behavioral design pattern that lets you pass requests along a chain of handlers. Upon receiving a request, each handler decides either to process the request or to pass it to the next handler in the chain.',
            image: 'assets/images/Pattern_Components/chain_icon.png',
            audio: 'pattern_components/chain.mp3',
            game: widget.game
          ),
          const Row(
            children: [
              Text('Chain_of_Responsibility Components',
                style: TextStyle(
                      fontSize: 30,
                      fontFamily: 'PixelFont', 
                    ),),
            ],
          ),
          Column(
            children: List.generate(chai_strcut.length, (index) {
            return ChainComps[index] ? BookPageRow(
              title: chai_strcut[index],
              paragraph: chai_comp_details[index],
              image: chai_comp_imgs[index],
              audio: chai_comp_audio[index],
              game: widget.game,
            ):Container();
          }),
          ),
          if(ChainCompsTask[0]==true && ChainCompsTask[1]==true && ChainCompsTask[2]==true && ChainCompsTask[3]==true )Container(
                decoration: const BoxDecoration(
                  image: DecorationImage(image: AssetImage( 'assets/images/UI/Banners/Component_BG.png' ), fit: BoxFit.fill),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: Column(
                    children: [
                      const Text('Chain of Responsibility Diagram',
                        style: TextStyle(
                              fontSize: 40,
                              fontFamily: 'PixelFont', 
                            ),),
                      SizedBox(height: 30,),
                      Image.asset('assets/images/Pattern_Components/Chain of Responsibility.png'),
                    ],
                  ),
                ),
              ),
        ],
      ),
    );
  }
}