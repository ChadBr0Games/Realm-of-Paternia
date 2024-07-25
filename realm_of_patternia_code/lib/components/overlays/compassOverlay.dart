import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:realm_of_patternia/realm_of_patternia.dart';

class CompassOverlay extends StatelessWidget {
  const CompassOverlay({super.key, required this.game});
  final Realm_of_Patternia game;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Image.asset('assets/images/Deco/compass.png'),
    );
  }
}