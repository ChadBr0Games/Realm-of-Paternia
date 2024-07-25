import 'package:flame_audio/flame_audio.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:realm_of_patternia/components/game_audio/audio_settings.dart';

class VolumeSliderScreen extends StatefulWidget {
  VolumeSliderScreen({required this.volume_control,super.key});
  int volume_control;

  @override
  State<VolumeSliderScreen> createState() => _VolumeSliderScreenState();
}

class _VolumeSliderScreenState extends State<VolumeSliderScreen> {
  
  
  double _currentVolume = 50;

  @override
  Widget build(BuildContext context) {
    if (widget.volume_control == 0){
      _currentVolume= playerVolume; 
    }else if (widget.volume_control == 1){
      _currentVolume =voiceVolume; 
    }else if (widget.volume_control == 2){
      _currentVolume= backgroundVolume; 
    }
    return Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Row(
              children: [
                Container(
                  alignment: Alignment.centerRight,
                  width: 80,
                  child: Text('${(_currentVolume*100).ceil()}%',
                      style: const TextStyle(
                            fontSize: 30,
                            fontFamily: 'PixelFont', 
                          ),),
                ),
                Container(
                  width: 320,
                  height: 62,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage('assets/images/UI/Buttons/slider_background.png'), // Your slider background image
                      fit: BoxFit.contain
                    ),
                  ),
                  child: Stack(
                    alignment: Alignment.centerLeft,
                    children: [
                      Positioned(
                        left: (_currentVolume) * 272, // Adjust this to match your slider's width
                        child: Container(
                          width: 48,
                          height: 58,
                          decoration: BoxDecoration(
                            image: DecorationImage(
                              image: AssetImage('assets/images/UI/Buttons/slider_handle.png'), // Your slider handle image
                              fit: BoxFit.contain,
                            ),
                          ),
                        ),
                      ),
                      Slider(
                      value: _currentVolume*100,
                      min: 0,
                      max: 100,
                      activeColor: Colors.transparent, // Hide the default active track
                      inactiveColor: Colors.transparent, 
                      thumbColor: Colors.transparent,
                      secondaryActiveColor: Colors.transparent,
                      overlayColor: MaterialStateColor.resolveWith((states) => Colors.transparent),
                      onChanged: (double value) {
                        setState(() {
                          if (widget.volume_control == 0){
                            playerVolume = value/100; 
                            FlameAudio.bgm.setVolume();
                          }else if (widget.volume_control == 1){
                            voiceVolume = value/100; 
                            FlameAudio.bgm.voicesetVolume();
                          }else if (widget.volume_control == 2){
                            backgroundVolume = value/100; 
                            FlameAudio.bgm.bgmsetVolume();
                          }
                          
                          _currentVolume = value;
                        });
                      },
                                              ),
                    ],
                  ),
                ),
              ],
            ),
            
          ],
        ),
      );
  }
}