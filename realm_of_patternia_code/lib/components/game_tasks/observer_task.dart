import 'dart:math';

//import 'package:flame_audio/flame_audio.dart';
import 'package:flutter/material.dart';
import 'package:realm_of_patternia/components/game_tasks/game_tasks_comps.dart';
import 'package:realm_of_patternia/components/objectives.dart';
import 'package:realm_of_patternia/realm_of_patternia.dart';
List<bool> bul = [false,false,false,false];
//List<bool> bul= [true,true,true,true,];

class ObserverTask extends StatelessWidget {
  const ObserverTask({super.key, required this.game});
  final Realm_of_Patternia game;
  @override
  Widget build(BuildContext context) {
    return  dragTask(game: game,);
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
      child:  SingleChildScrollView(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.fromLTRB(0, 50, 0, 100),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    dragComp(0,obse_strcut[0]),
                    dragComp(1,obse_strcut[1]),
                    dragComp(2,obse_strcut[2]),
                    dragComp(3,obse_strcut[3]),
                  
                    
                  ],
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                dragTarg(widget.game),
          
              ],
              ),
              
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
                    
                      lst[details.data] = obse_strcut[details.data];
                      bul[details.data]=true;
                      ObserverCompsTask=bul;
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
      child: Container(
        
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
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      if(bul[0])
                      _buildTextBox(['foreach (s in Subscribers)','s.update(this)'], Colors.grey[300], FontWeight.normal, 200, CrossAxisAlignment.start,),
                      if(bul[0])
                      _buildTextBox(['mainState = newState','notifySubscribers()'], Colors.grey[300], FontWeight.normal, 200, CrossAxisAlignment.start,),
                      SizedBox(height: 244,),
                    ]
                  
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(20, 50, 50, 50),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      if(bul[0])
                      _buildClassBox(['Publisher'],200, CrossAxisAlignment.center, FontWeight.bold),
                      if(bul[0])
                      _buildClassBox(['- subscribers: Subscriber[]','- mainState'],200, CrossAxisAlignment.start, FontWeight.normal),
                      if(bul[0])
                      _buildClassBox(['+ subscribe(s: Subscriber)', '+ unsubscribe(s: Subscriber)', '+ notifySubscribers()', '+ mainBusinessLogic()'],200, CrossAxisAlignment.start, FontWeight.normal),
            
            
                      SizedBox(height: 44,),
                      if(bul[3])
                      _buildTextBox(['s = new ConcreteSubscriber()','publisher.subscribe(s)'], Colors.grey[300], FontWeight.normal, 200, CrossAxisAlignment.start,),
                      
                      SizedBox(height: 44,),
                      if(bul[3])
                      _buildClassBox(['Client'], 100, CrossAxisAlignment.center, FontWeight.normal),
            
                      SizedBox(height: 104,),
                    ]
                  
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(50, 50, 50, 50),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      if(bul[1])
                      _buildInterfaceBox(['Subscriber'],200, CrossAxisAlignment.center, FontWeight.bold),
                      if(bul[1])
                      _buildClassBox(['+ update(context)'],200, CrossAxisAlignment.start, FontWeight.normal),
            
                      SizedBox(height: 80,),
            
                      if(bul[2])
                      _buildClassBox(['Concrete','Subscribers'], 200, CrossAxisAlignment.center, FontWeight.bold),
            
                      if(bul[2])
                      _buildClassBox(['...'],200, CrossAxisAlignment.start,FontWeight.normal),
                      if(bul[2])
                      _buildClassBox(['+ update(context)'],200, CrossAxisAlignment.start,FontWeight.normal),
            
                      SizedBox(height: 170,),
            
                      
                    ],
                    
                    
                  ),
                )
            
                
              ],
            ),
          ],
        ),
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
      ..color = Color.fromARGB(255, 104, 104, 104)
      ..strokeWidth = 2;

    /*final arrowPaint = Paint()
      ..color = Color.fromARGB(255, 104, 104, 104)
      ..strokeWidth = 2;*/

    final dottedPaint = Paint()
      ..color = Color.fromARGB(255, 104, 104, 104)
      ..strokeWidth = 2
      ..style = PaintingStyle.stroke;

    //final arrowHeadSize = 10.0;
    final dashWidth = 5.0;
    final dashSpace = 5.0;
    //final double FAVL=27;

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
        case 'up':
          final ah1 = Offset(s*t, u);
          final ah2 = Offset(s*(t+0.0087), u+20);
          canvas.drawLine(ah1, ah2, paint);

          final ah3 = Offset(s*t, u);
          final ah4 = Offset(s*(t-0.0087), u+20);
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
      
      

    }

    void _aggregationArrow(double s, double t, double u){
      final aa1 = Offset(s*t, u);
      final aa2 = Offset(s*(t+0.016), u-10);
      canvas.drawLine(aa1, aa2, paint);

      final aa3 = Offset(s*t, u);
      final aa4 = Offset(s*(t+0.016), u+10);
      canvas.drawLine(aa3, aa4, paint);

      final aa5 = Offset(s*(t+0.016), u-10);
      final aa6 = Offset(s*(t+0.032), u);
      canvas.drawLine(aa5, aa6, paint);

      final aa7 = Offset(s*(t+0.016), u+10);
      final aa8 = Offset(s*(t+0.032), u);
      canvas.drawLine(aa7, aa8, paint);
    }


    if(bul[0]){
      final p13 = Offset(size.width*0.289, 220);
      final p14 = Offset(size.width*0.42, 270);
      drawDottedLine(p13, p14, dashWidth, dashSpace);

      final p15 = Offset(size.width*0.289, 280);
      final p16 = Offset(size.width*0.42, 280);
      drawDottedLine(p15, p16, dashWidth, dashSpace);

      _aggregationArrow(size.width, 0.588, 180);
      final p1 = Offset(size.width*0.620, 180);
      final p2 = Offset(size.width*0.695, 180);
      canvas.drawLine(p1, p2, paint);
      _drawArrowHead(size.width, 0.695, 180, 'right');
    }


    if(bul[2]){
      drawFullArrowVert(size.width, 0.82, 300);
      final p11 = Offset(size.width*0.82, 315);
      final p12 = Offset(size.width*0.82, 380);
      drawDottedLine(p11, p12, dashWidth, dashSpace);
    }

    if(bul[3]){
      _drawArrowHead(size.width, 0.465, 296, 'up');
      final p3 = Offset(size.width*0.465, 296);
      final p4 = Offset(size.width*0.465, 350);
      canvas.drawLine(p3, p4, paint);

      _drawArrowHead(size.width, 0.695, 370, 'right');
      final p5 = Offset(size.width*0.578, 370);
      final p6 = Offset(size.width*0.695, 370);
      drawDottedLine(p5, p6, dashWidth, dashSpace);
      
      final p7 = Offset(size.width*0.465, 465);
      final p8 = Offset(size.width*0.465, 395);
      canvas.drawLine(p7, p8, paint);
      final p9 = Offset(size.width*0.480, 465);
      final p10 = Offset(size.width*0.520, 395);
      drawDottedLine(p9, p10, dashWidth, dashSpace);
    }

    
    
    

    




    
  }

  

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
}