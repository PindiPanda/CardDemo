import 'package:flutter/material.dart';

Positioned cardDemo(
  DecorationImage img,
  double bottom,
  double right,
  double left,
  double cardWidth,
  double rotation,
  double skew,
  BuildContext context,
  Function dismissImg,
  int flag,
  Function addImg,
  Function swipeRight,
  Function swipeLeft,
) {
  Size screenSize = MediaQuery.of(context).size;
  return Positioned(
    bottom: 130.0 + bottom,
    right: flag == 0 ? right != 0.0 ? right : null : null,
    left: flag == 1 ? right != 0.0 ? right : null : null,
    child: GestureDetector(
      onPanUpdate: (details) {
        if (details.delta.dy < 0) {
          if (details.delta.dx > 0) {
            swipeRight();
          }
          if (details.delta.dx < 0) {
            swipeLeft();
          }
        }
      },
      child: Transform(
        alignment: flag == 0 ? Alignment.bottomRight : Alignment.bottomLeft,
        transform: Matrix4.skewX(skew),
        child: RotationTransition(
          turns: AlwaysStoppedAnimation(
              flag == 0 ? rotation / 360 : -rotation / 360),
          child: Hero(
            tag: 'img',
            child: GestureDetector(
              onTap: () {},
              child: Card(
                color: Colors.transparent,
                elevation: 4.0,
                child: Container(
                  alignment: Alignment.center,
                  width: screenSize.width / 1.2 + cardWidth,
                  height: screenSize.height / 1.7,
                  decoration: BoxDecoration(
                    color: Colors.grey[400],
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                  child: Column(
                    children: <Widget>[
                      Container(
                        width: screenSize.width / 1.2 + cardWidth,
                        height: screenSize.height / 2.2,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(8.0),
                            topRight: Radius.circular(8.0),
                          ),
                          image: img,
                        ),
                      ),
                      Container(
                        width: screenSize.width / 1.2 + cardWidth,
                        height:
                            screenSize.height / 1.7 - screenSize.height / 2.2,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: <Widget>[
                            Container(
                              height: 60.0,
                              width: 130.0,
                              alignment: Alignment.center,
                              decoration: BoxDecoration(
                                color: Colors.green[700],
                                borderRadius: BorderRadius.circular(60.0),
                              ),
                              child: FlatButton(
                                padding: EdgeInsets.all(0.0),
                                child: Text(
                                  "TREES",
                                  style: TextStyle(
                                    color: Colors.white,
                                  ),
                                ),
                                onPressed: () {
                                  debugPrint('Left');
                                  swipeLeft();
                                },
                              ),
                            ),
                            Container(
                              height: 60.0,
                              width: 130.0,
                              alignment: Alignment.center,
                              decoration: BoxDecoration(
                                color: Colors.yellow[700],
                                borderRadius: BorderRadius.circular(60.0),
                              ),
                              child: FlatButton(
                                padding: EdgeInsets.all(0.0),
                                child: Text(
                                  "BEES",
                                  style: TextStyle(
                                    color: Colors.white,
                                  ),
                                ),
                                onPressed: () {
                                  debugPrint('Right');
                                  swipeRight();
                                },
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    ),
  );
}
