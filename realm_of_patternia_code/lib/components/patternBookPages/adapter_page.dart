import 'package:flutter/widgets.dart';
import 'package:realm_of_patternia/components/objectives.dart';
import 'package:realm_of_patternia/components/widgets/pattern_book_row.dart';
import 'package:realm_of_patternia/realm_of_patternia.dart';

class Adapter_Page extends StatefulWidget {
  const Adapter_Page({super.key, required this.game});
  final Realm_of_Patternia game;

  @override
  State<Adapter_Page> createState() => _Adapter_PageState();
}

class _Adapter_PageState extends State<Adapter_Page> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          BookPageRow(
            title: '',
            paragraph: 'Adapter is a structural design pattern that allows objects with incompatible interfaces to collaborate.',
            image: 'assets/images/Pattern_Components/factory_icon.png',
            audio: 'pattern_components/adapter.mp3',
            game: widget.game
          ),
          const Row(
            children: [
              Text('Adapter Components',
                style: TextStyle(
                      fontSize: 30,
                      fontFamily: 'PixelFont', 
                    ),),
            ],
          ),
          Column(
            children: List.generate(adap_strcut.length, (index) {
            return AdapterComps[index]? BookPageRow(
              title: adap_strcut[index],
              paragraph: adap_comp_details[index],
              image: adap_comp_imgs[index],
              audio: adap_comp_audio[index],
              game: widget.game,
            ):Container();
          }),
          
          ),
          if(AdapterCompsTask[0]==true && AdapterCompsTask[1]==true && AdapterCompsTask[2]==true &&AdapterCompsTask[3]==true)Container(
                decoration: const BoxDecoration(
                  image: DecorationImage(image: AssetImage( 'assets/images/UI/Banners/Component_BG.png' ), fit: BoxFit.fill),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(15),
                  child: Column(
                    children: [
                      const Text('Adapter Diagram',
                        style: TextStyle(
                              fontSize: 40,
                              fontFamily: 'PixelFont', 
                            ),),
                      SizedBox(height: 30,),
                      Image.asset('assets/images/Pattern_Components/Adapter.png'),
                    ],
                  ),
                ),
              ),
        ],
      ),
    );
  }
}