import 'dart:math';

//import 'package:flame_audio/flame_audio.dart';
import 'package:flutter/material.dart';
import 'package:realm_of_patternia/components/game_tasks/game_tasks_comps.dart';
import 'package:realm_of_patternia/components/objectives.dart';
import 'package:realm_of_patternia/realm_of_patternia.dart';
List<bool> bul = [false,false,false,false];
//List<bool> bul= [true,true,true,true,];

class FacadeTask extends StatelessWidget {
  const FacadeTask({super.key, required this.game});
  final Realm_of_Patternia game;
  @override
  Widget build(BuildContext context) {
    return dragTask(game: game);
  }
}

class dragTask extends StatefulWidget {
  const dragTask({super.key, required this.game});
  final Realm_of_Patternia game;

  @override
  State<dragTask> createState() => _dragTaskState();
}

class _dragTaskState extends State<dragTask> {
  List<String> lst =  ['','','',''];
  int correct = 0;
  
  
  @override


  Widget build(BuildContext context) {
    return Container(
      child: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.fromLTRB(0, 50, 0, 100),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  dragComp(0,faca_strcut[0]),
                  dragComp(1,faca_strcut[1]),
                  dragComp(2,faca_strcut[2]),
                  dragComp(3,faca_strcut[3]),
                
                  
                ],
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
              dragTarg(widget.game),
        
            ],
            )
          ],
        ),
      ),
    );
  }





Widget dragComp(int comp, String text){
  return Draggable<int>(
              data: comp,
              feedback: ComponentButton(text: text, inDiagram: bul[comp]),
              child: ComponentButton(text: text, inDiagram: bul[comp],),
              onDragCompleted: () {
              setState(() {
                
              });  
              },
            );
}

Widget dragTarg(Realm_of_Patternia game, {MaterialColor col = Colors.cyan} ){
  

  return DragTarget<int>(
              builder: (
                BuildContext context,
                List<dynamic> accepted,
                List<dynamic> rejected,
              ) {
                return Container(
                        decoration: BoxDecoration(
                          image: DecorationImage(image: AssetImage( 'assets/images/UI/Banners/Component_BG.png' ), fit: BoxFit.fill),
                          ),
                          child: PatternDiagram(),
                      );
              },
              onAcceptWithDetails: (DragTargetDetails<int> details) {
                setState(() {
                  if (!bul[details.data]){
                    
                      lst[details.data] = faca_strcut[details.data];
                      bul[details.data]=true;
                      FacadeCompsTask=bul;
                      correct+=1;
                      //print(bul);
                  }else {
                    //FlameAudio.play(file);
                  }
                  
                  if(correct==bul.length){
                    completed_pats[game.chal]=true;
                  }
                  
                });
              },
            );
}

Widget PatternDiagram(){
  return CustomPaint(
      painter: UMLPainter(),
      child: Column(
        children: [
          Padding(
            padding: EdgeInsets.all(20.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text( correct == 4 ?'Diagram Completed':'Drag and Drop Components',
                style: const TextStyle(
                  fontSize: 20,
                  color:   Colors.white,
                  fontFamily: 'PixelFont', 
                ),)
              ],
            ),
          ),
          Row(
            children: [
              Padding(
                padding: const EdgeInsets.fromLTRB(50, 50, 20, 50),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    if(bul[3])
                    _buildClassBox(['Client'], 100, CrossAxisAlignment.center, FontWeight.bold),
                    if(bul[3])
                    SizedBox(height: 194,),
                  ]
                
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(20, 50, 20, 50),
                child: Column(
                  children: [
                    if(bul[0])
                    SizedBox(height: 44,),
          
          
                    if(bul[0])
                    _buildClassBox(['Facade'], 200, CrossAxisAlignment.center, FontWeight.bold),
          
                    if(bul[0])
                    _buildClassBox(['- linksToSubsystemObjects', '- optionalAdditionalFacade'],200, CrossAxisAlignment.start,FontWeight.normal),
                    if(bul[0])
                    _buildClassBox(['+ subsystemOperation'],200, CrossAxisAlignment.start,FontWeight.normal),
                    if(bul[0])
                    SizedBox(height: 64,),
          
                    
                    if(bul[2])
                    Row(
                      children: [
                        _buildClassBox(['Subsystem', 'class'], 200, CrossAxisAlignment.center, FontWeight.bold),
                        _buildClassBox(['Subsystem', 'class'], 200, CrossAxisAlignment.center, FontWeight.bold),
                      ],
                    ),
                    if(bul[2])
                    SizedBox(height: 104,),
                  ]
                
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(20, 50, 20, 50),
                child: Column(
                  children: [
                    if(bul[1])
                    SizedBox(height: 44,),
                    if(bul[1])
                    _buildClassBox(['Additional', 'Facade'],200, CrossAxisAlignment.center, FontWeight.bold),
                    if(bul[1])
                    _buildClassBox(['...'],200, CrossAxisAlignment.start, FontWeight.normal),
                    if(bul[1])
                    _buildClassBox(['+ anotherOPeration()'],200, CrossAxisAlignment.start, FontWeight.normal),
                    
                    if(bul[2])
                    SizedBox(height: 64,),
                    if(bul[2])
                    Row(
                      children: [
                        _buildClassBox(['Subsystem', 'class'], 200, CrossAxisAlignment.center, FontWeight.bold),
                        _buildClassBox(['Subsystem', 'class'], 200, CrossAxisAlignment.center, FontWeight.bold),
                      ],
                    ),
                    if(bul[2])
                    SizedBox(height: 104,),
          
                    
          
                    
          
                    
                  ],
                  
                  
                ),
              )
          
              
            ],
          ),
        ],
      ),
    );
}
Widget _buildTextBox(List<String> text, Color? color, FontWeight FW,double width,CrossAxisAlignment CAA,) {
    return Container(
      padding: EdgeInsets.all(10),
      margin: EdgeInsets.symmetric(vertical: 10,),
      alignment: Alignment.centerLeft,
      decoration: BoxDecoration(
        border: Border.all(color: Colors.black),
        color: color,
      ),
      child: Container(
        width: width,
        child: Column(
          crossAxisAlignment: CAA,
          children: [
            ...text.map((e) => Text(
              e,
              style: TextStyle( 
                  color: Colors.black,
                  fontWeight: FW
                ),
            ))
        ],
        ),
      )
    );
  }

  Widget _buildClassBox(List<String> methods, double width,CrossAxisAlignment CAA, FontWeight FW) {
    return ElevatedButton(
        onPressed: (){},
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.white,
          shape: RoundedRectangleBorder(
            
            borderRadius: BorderRadius.circular(4.0),
            side: BorderSide(color: Colors.grey, width: 2)
          ),
          padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 14.0),
        ), child: Container(
          width: width,
          child: Column(
            crossAxisAlignment: CAA,
            children: [
              ...methods.map((method) => Text(
                method,
                style: TextStyle( 
                color: Colors.black,
                fontWeight: FW
              ),
                )).toList(),
            ],
          ),
        )
          
          );
  }

  Widget _buildInterfaceBox(List<String> methods, double width,CrossAxisAlignment CAA, FontWeight FW) {
    return ElevatedButton(
        onPressed: (){},
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.white,
          shape: RoundedRectangleBorder(
            
            borderRadius: BorderRadius.circular(4.0),
            side: BorderSide(color: Colors.grey, width: 2)
          ),
          padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 14.0),
        ), child: Container(
          width: width,
          child: Column(
            crossAxisAlignment: CAA,
            children: [
              Text(
                '<<interface>>',
                style: TextStyle(color: Colors.black, fontStyle: FontStyle.italic),
              ),

              ...methods.map((method) => Text(
                method,
                style: TextStyle( 
                color: Colors.black,
                fontWeight: FW
              ),
                )).toList(),
            ],
          ),
        )
          
          );
  }
}


class UMLPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = Color.fromARGB(255, 92, 92, 92)
      ..strokeWidth = 2;

    /*final arrowPaint = Paint()
      ..color = Color.fromARGB(255, 92, 92, 92)
      ..strokeWidth = 2;*/

    final dottedPaint = Paint()
      ..color = Color.fromARGB(255, 92, 92, 92)
      ..strokeWidth = 2
      ..style = PaintingStyle.stroke;

    //final arrowHeadSize = 10.0;
    //final dashWidth = 5.0;
    //final dashSpace = 5.0;
    final double FAVL=27;

    void _drawArrowHead(double s, double t, double u, String direction) {
      switch (direction){
        case 'right':
          final ah1 = Offset(s*t, u);
          final ah2 = Offset(s*(t-0.02), u-8);
          canvas.drawLine(ah1, ah2, paint);

          final ah3 = Offset(s*t, u);
          final ah4 = Offset(s*(t-0.02), u+8);
          canvas.drawLine(ah3, ah4, paint);
        case 'left':
          final ah1 = Offset(s*t, u);
          final ah2 = Offset(s*(t+0.02), u-8);
          canvas.drawLine(ah1, ah2, paint);

          final ah3 = Offset(s*t, u);
          final ah4 = Offset(s*(t+0.02), u+8);
          canvas.drawLine(ah3, ah4, paint);
        case 'down':
          final ah1 = Offset(s*t, u);
          final ah2 = Offset(s*(t+0.0087), u-20);
          canvas.drawLine(ah1, ah2, paint);

          final ah3 = Offset(s*t, u);
          final ah4 = Offset(s*(t-0.0087), u-20);
          canvas.drawLine(ah3, ah4, paint);





      }
    
  }

  void drawDottedLine(
        Offset start, Offset end, double dashWidth, double dashSpace) {
      double startX = start.dx;
      double startY = start.dy;
      final dx = end.dx - start.dx;
      final dy = end.dy - start.dy;
      final distance = sqrt(dx * dx + dy * dy);
      final direction = Offset(dx / distance, dy / distance);
      double remainingLength = distance;
      while (remainingLength >= 0) {
        final currentLength =
            remainingLength > dashWidth ? dashWidth : remainingLength;
        final nextX = startX + direction.dx * currentLength;
        final nextY = startY + direction.dy * currentLength;
        canvas.drawLine(
            Offset(startX, startY), Offset(nextX, nextY), dottedPaint);
        startX = nextX + direction.dx * dashSpace;
        startY = nextY + direction.dy * dashSpace;
        remainingLength -= dashWidth + dashSpace;
        
      }
    }

    void drawFullArrowVert(double s, double t, double u){
      final fa1 = Offset(s*t, u);
      final fa2 = Offset(s*(t-0.013), u+15);
      canvas.drawLine(fa1, fa2, paint);

      final fa3 = Offset(s*t, u);
      final fa4 = Offset(s*(t+0.013), u+15);
      canvas.drawLine(fa3, fa4, paint);

      final fa5 = Offset(s*(t-0.013), u+15);
      final fa6 = Offset(s*(t+0.013), u+15);
      canvas.drawLine(fa5, fa6, paint);
      
      final fa7 = Offset(s*t, u+15);
      final fa8 = Offset(s*t, u+FAVL);
      canvas.drawLine(fa7, fa8, paint);

    }
    if(bul[3]){
      _drawArrowHead(size.width, 0.278, 210, 'right');
      final p1 = Offset(size.width*0.15, 210);
      final p2 = Offset(size.width*0.2789, 210);
      canvas.drawLine(p1, p2, paint);
    }

    if(bul[0]){
      _drawArrowHead(size.width, 0.696, 210, 'right');
      final p11 = Offset(size.width*0.470, 210);
      final p12 = Offset(size.width*0.696, 210);
      canvas.drawLine(p11, p12, paint);
      _drawArrowHead(size.width, 0.438, 342, 'down');
      final p3 = Offset(size.width*0.438, 280);
      final p4 = Offset(size.width*0.438, 342);
      canvas.drawLine(p3, p4, paint);
      _drawArrowHead(size.width, 0.308, 342, 'down');
      final p5 = Offset(size.width*0.308, 280);
      final p6 = Offset(size.width*0.308, 342);
      canvas.drawLine(p5, p6, paint);
    }
    if(bul[1]){
      _drawArrowHead(size.width, 0.738, 342, 'down');
      final p7 = Offset(size.width*0.738, 280);
      final p8 = Offset(size.width*0.738, 342);
      canvas.drawLine(p7, p8, paint);
      _drawArrowHead(size.width, 0.848, 342, 'down');
      final p9 = Offset(size.width*0.848, 280);
      final p10 = Offset(size.width*0.848, 342);
      canvas.drawLine(p9, p10, paint);
    }
    

  }

  

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
}



