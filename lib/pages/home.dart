import 'dart:developer';

import 'package:flare_flutter/flare_actor.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:percent_indicator/percent_indicator.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/services.dart';



class Homepage extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    return _HomepageState();
  }

}

class _HomepageState extends State<Homepage> {

  String BottomMenuAnimation = 'Stay';
  bool Tool_Status = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.grey[200],
        shadowColor: Colors.transparent,
        actions: [
          Container(
            alignment: Alignment.topRight,
            child: Padding(
              padding: const EdgeInsets.fromLTRB(0, 15, 15, 0),
              child: Icon(
                FontAwesomeIcons.cog,
                size: 30,
                color: Color.fromRGBO(46, 120, 93, 0.9),
              ),
            ),
          ),
        ],
      ),
      body: Container(
        color: Colors.grey[200],
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.fromLTRB(0, 0, 0, 12),
                    child: Center(
                      child: Image.asset(
                        'assets/Plant.png',
                        scale: 2.5,
                      ),
                    ),
                  ),
                  Container(
                    alignment: Alignment.center,
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding: const EdgeInsets.fromLTRB(0, 0, 0, 4),
                              child: Row(children: [
                                Icon(
                                  FontAwesomeIcons.solidHeart,
                                  size: 15,
                                  color: Colors.red,
                                ),
                                Text('  Life')
                              ]),
                            ),
                            Padding(
                              padding: const EdgeInsets.fromLTRB(0, 0, 0, 4),
                              child: Row(children: [
                                Icon(FontAwesomeIcons.tint,
                                    size: 15, color: Colors.blue),
                                Text('  Water')
                              ]),
                            ),
                            Row(children: [
                              Icon(FontAwesomeIcons.seedling,
                                  size: 15, color: Colors.green),
                              Text('  Growth')
                            ]),
                          ],
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            Padding(
                              padding:
                                  const EdgeInsets.fromLTRB(10, 0, 0, 10),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  LinearPercentIndicator(
                                    width: 140.0,
                                    lineHeight: 10.0,
                                    percent: 0.8,
                                    backgroundColor: Colors.grey[350],
                                    progressColor: Colors.red,
                                  ),
                                ],
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.fromLTRB(0, 0, 0, 10),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  LinearPercentIndicator(
                                    width: 140.0,
                                    lineHeight: 10.0,
                                    percent: 0.2,
                                    backgroundColor: Colors.grey[350],
                                    progressColor: Colors.blue[400],
                                  ),
                                ],
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.fromLTRB(0, 0, 0, 0),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  LinearPercentIndicator(
                                    width: 140.0,
                                    lineHeight: 10.0,
                                    percent: 0.5,
                                    backgroundColor: Colors.grey[350],
                                    progressColor: Colors.green,
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: Container(
        color: Colors.grey[200],
        width: 415,
        height: 145,
        child: Stack(
          overflow: Overflow.clip,
          alignment: Alignment.center,
          children: [
            Positioned(
              bottom: 0,
              child: SizedBox(
                width: 415,
                height: 145,
                child: GestureDetector(
                  onTapUp: (tapInfo){
                    var globalTapPosition = tapInfo.globalPosition;
                    var localTapPosition = (context.findRenderObject() as RenderBox).globalToLocal(tapInfo.globalPosition);

                    bool ToolTouch = localTapPosition.dx > 170 && localTapPosition.dx < 238 && localTapPosition.dy > 705;
                    bool CartTouch = localTapPosition.dx > 39 && localTapPosition.dx < 105 && localTapPosition.dy > 744;
                    bool CollectionTouch = localTapPosition.dx > 315 && localTapPosition.dx < 373 && localTapPosition.dy > 744;

                    bool TreeTouch = localTapPosition.dx > 0 && localTapPosition.dx < 48 && localTapPosition.dy > 694 && localTapPosition.dy < 742;
                    bool InventoryTouch = localTapPosition.dx > 362 && localTapPosition.dx < 410 && localTapPosition.dy > 694 && localTapPosition.dy < 742;

                    bool WaterTouch = localTapPosition.dx > 125 && localTapPosition.dx < 159 && localTapPosition.dy > 686 && localTapPosition.dy < 726;
                    bool FertilizerTouch = localTapPosition.dx > 180 && localTapPosition.dx < 657 && localTapPosition.dy > 657 && localTapPosition.dy < 694;
                    bool ChemicalTouch = localTapPosition.dx > 240 && localTapPosition.dx < 284 && localTapPosition.dy > 686 && localTapPosition.dy < 726;

                    String _Animation = "Stay";

                    if(ToolTouch){
                      if(Tool_Status){
                        _Animation = "Tool-Close";
                        Tool_Status = false;
                      }else{
                        _Animation = "Tool-Open";
                        Tool_Status = true;
                      }
                    }
                    else if(CartTouch){
                      _Animation = "Cart";
                    }
                    else if(CollectionTouch){
                      _Animation = "Collection";
                    }
                    else if(TreeTouch){
                      _Animation = "Tree";
                    }
                    else if(InventoryTouch){
                      _Animation = "Inventory";
                    }
                    else if(WaterTouch && Tool_Status){
                      _Animation = "Tool-Water";
                    }
                    else if(FertilizerTouch && Tool_Status){
                      _Animation = "Tool-Fertilizer";
                    }
                    else if(ChemicalTouch && Tool_Status){
                      _Animation = "Tool-Chemical";
                    }
                    else{
                      _Animation = "Stay";
                    }

                    setState(() {
                      BottomMenuAnimation = _Animation;
                    });
  
                  },
                  child: FlareActor(
                    'assets/Bottom_Menu.flr',
                    fit: BoxFit.cover,
                    animation: BottomMenuAnimation,
                  ),
                ),
              ),
            ),
          ],
        ),
        //child: FlareActor('Bottom_Menu.flr'),
      ),
    );
  }
}
