import 'package:flutter/material.dart';
import 'dart:math';

const double width = 400; //棋盘大小

const int caseWidth = 10; //多少个网格

const double oneWidth = width / caseWidth; //一个格子的长度

enum NowChesser { white, black }

class CustomPaintRoute extends StatefulWidget {
  @override
  _CloseTapTapState createState() => _CloseTapTapState();
}

class _CloseTapTapState extends State<CustomPaintRoute> {
  List<Point> blackList = [Point(1, 1)]; //黑棋
  List<Point> whiteList = [Point(1, 2)]; //白棋
  bool isSuccess = false; //判断胜负

  //定义当前走棋的人
  NowChesser chesser = NowChesser.black;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    // chesser = NowChesser.black;
  }

  @override
  Widget build(BuildContext context) {
    // list.add(Point(1, 1));
    return Container(
      color: Colors.grey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            height: 100,
            child: isSuccess
                ? Text(
                    (chesser == NowChesser.black ? '白棋' : '黑棋') + '胜利了',
                    style: TextStyle(
                        color: Colors.blue, inherit: false, fontSize: 50),
                  )
                : Container(),
          ),
          Center(
            child: Builder(builder: (context) {
              return GestureDetector(
                child: CustomPaint(
                  size: Size(width, width), //指定画布大小
                  painter:
                      MyPainter(blackList: blackList, whitekList: whiteList),
                ),
                onTapDown: (TapDownDetails details) {
                  Offset position = details.globalPosition;
                  RenderBox renderBox = context.findRenderObject() as RenderBox;
                  if(renderBox == null) {
                    return;
                  }
                  final Offset topLeftPosition = renderBox.localToGlobal(Offset.zero);
                  var point = position - topLeftPosition;
                  var x = (point.dx / oneWidth).round();
                  var y = (point.dy / oneWidth).round();
                  var all = [...blackList, ...whiteList];
                  var a = all.indexWhere(
                      (element) => element.x == x && element.y == y);
                  if (a == -1 && isSuccess == false) {
                    print("当前棋子坐标：" + Point(x, y).toString());
                    checkSuccess(Point(x, y));
                    setState(() {
                      chesser == NowChesser.black
                          ? blackList.add(Point(x, y))
                          : whiteList.add(Point(x, y));
                    });
                    switchChesser();
                  }
                },
              );
            }),
          ),
          Container(
              height: 100,
              child: RaisedButton(
                child: Text('清除棋盘'),
                onPressed: () {
                  clearPoint();
                },
              ))
        ],
      ),
    );
  }

  //转换棋手
  switchChesser() {
    chesser = chesser == NowChesser.black ? NowChesser.white : NowChesser.black;
  }

  //判断胜负
  checkSuccess(Point nowPoint) {
    List<Point> list = chesser == NowChesser.black ? blackList : whiteList;
    List relative = [];
    searchRelative(list, nowPoint);
    // if (isSuccess == true) {
    //   isSuccess = false;
    // }
  }

//清楚棋盘
  clearPoint() {
    setState(() {
      whiteList = [];
      blackList = [];
      isSuccess = false;
    });
  }

  //找寻与刚下的棋子四周的棋
  searchRelative(List<Point> all, Point nowPoint) {
    // isSuccess = false; //测试用
    Point searchPoint = nowPoint;
    int oneDirection = 1; //一个方向上的棋子个数
    //横竖上下斜角
    void mackDirection(int n, bool change) {
      for (int i = 1; i < 5 && isSuccess == false; i++) {
        // print(next);
        Point next;
        if (n == 0) {
          if (change) {
            next = Point(searchPoint.x - i, searchPoint.y);
            print('**********向左**********');
          } else {
            next = Point(searchPoint.x + i, searchPoint.y);
            print('**********向右**********');
          }
        }
        //上下
        else if (n == 1) {
          if (change) {
            next = Point(searchPoint.x, searchPoint.y - i);
            print('**********向上**********');
          } else {
            next = Point(searchPoint.x, searchPoint.y + i);
            print('**********向下**********');
          }
        } else if (n == 2) {
          if (change) {
            next = Point(searchPoint.x - i, searchPoint.y - i);
            print('**********向斜左上**********');
          } else {
            next = Point(searchPoint.x + i, searchPoint.y + i);
            print('**********向斜右下**********');
          }
        } else if (n == 3) {
          if (change) {
            next = Point(searchPoint.x + i, searchPoint.y - i);
            print('**********向斜右上**********');
          } else {
            next = Point(searchPoint.x - i, searchPoint.y + i);
            print('**********向斜左下**********');
          }
        } else {
          break;
        }
        if (all.indexWhere((item) => item.x == next.x && item.y == next.y) !=
            -1) {
          print(next);
          oneDirection++;
          check(oneDirection);
          if (isSuccess) {
            break;
          }
        } else {
          break;
        }
      }
    }

    for (int n = 0; n < 4 && isSuccess == false; n++) {
      oneDirection = 1;
      mackDirection(n, true);
      mackDirection(n, false);
    }
  }

  //判断胜负
  check(int count) {
    if (count == 5) {
      print('胜利了');
      setState(() {
        isSuccess = true;
      });
    }
  }
}

class Point {
  int x;
  int y;
  Point(this.x, this.y);
  @override
  String toString() {
    return 'x:' + x.toString() + "," + "y:" + y.toString();
  }
}

class MyPainter extends CustomPainter {
  final List<Point> blackList; //黑棋
  final List<Point> whitekList; //黑棋
  MyPainter({ this.blackList,  this.whitekList});
  @override
  void paint(Canvas canvas, Size size) {
    double eWidth = size.width / caseWidth;
    double eHeight = size.height / caseWidth;

    //画棋盘背景
    var paint = Paint()
      ..isAntiAlias = true
      ..style = PaintingStyle.fill //填充
      ..color = Color(0x77cdb175); //背景为纸黄色
    canvas.drawRect(Offset.zero & size, paint);

    //画棋盘网格
    paint
      ..style = PaintingStyle.stroke //线
      ..color = Colors.black87
      ..strokeWidth = 1.0;

    for (int i = 0; i <= caseWidth; ++i) {
      double dy = eHeight * i;
      canvas.drawLine(Offset(0, dy), Offset(size.width, dy), paint);
    }

    for (int i = 0; i <= caseWidth; ++i) {
      double dx = eWidth * i;
      canvas.drawLine(Offset(dx, 0), Offset(dx, size.height), paint);
    }

    //画一个黑子
    blackList.forEach((point) {
      paint
        ..style = PaintingStyle.fill
        ..color = Colors.black;
      canvas.drawCircle(
        Offset(point.x * eWidth, point.y * eHeight),
        min(eWidth / 2, eHeight / 2) - 2,
        paint,
      );
    });
    //画一个白子
    whitekList.forEach((point) {
      paint
        ..style = PaintingStyle.fill
        ..color = Colors.white;
      canvas.drawCircle(
        Offset(point.x * eWidth, point.y * eHeight),
        min(eWidth / 2, eHeight / 2) - 2,
        paint,
      );
    });
  }

  //在实际场景中正确利用此回调可以避免重绘开销，本示例我们简单的返回true
  @override
  bool shouldRepaint(CustomPainter oldDelegate) => true;
}
