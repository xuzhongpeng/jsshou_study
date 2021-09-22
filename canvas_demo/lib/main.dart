import 'dart:async';
import 'dart:math';
import 'dart:typed_data';
// import 'dart:ui' as ui;
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() {
  // runApp(MyApp());
  // 一、创建第一个正方形
  // 使用PictureRecorder创建一个画板
  PictureRecorder recorder = PictureRecorder();
  Canvas canvas = Canvas(recorder);

  // canvas绘制
  // 从100，100坐标开始绘制
  Offset offset = Offset(300, 300);
  // 绘制区域是100x100的区域
  Size size = Size(300, 300);
  canvas.drawRect(offset & size, Paint()..color = Colors.red);

  // 通过recorder.endRecording结束节点绘制并返回一个Picture
  Picture picture = recorder.endRecording();

  // 二、创建第二个圆形
  PictureRecorder recorder1 = PictureRecorder();
  Canvas canvas1 = Canvas(recorder1);
  Offset offset1 = Offset(0, 0);
  Size size1 = Size(300, 300);
  canvas1.drawOval(offset1 & size1, Paint()..color = Colors.blue);
  Picture picture1 = recorder1.endRecording();

  // 初始化一个SceneBuilder
  SceneBuilder sceneBuilder = SceneBuilder();
  // 通过SceneBuilder上的方法将上诉canvas生成的Picture添加到engine
  sceneBuilder.addPicture(new Offset(0, 0), picture);
  sceneBuilder.pushOffset(100, 0);
  sceneBuilder.addPicture(new Offset(600, 800), picture1);
  sceneBuilder.pop();
  // 通过sceneBuilder.build生成scene
  Scene scene = sceneBuilder.build();

  window.onDrawFrame = () {
    // 调用window.render, 它只能在onDrawFrame或onBeginFrame中调用
    window.render(scene);
    scene.dispose();
  };
  // 触发一个VSync信号，使onDrawFrame回调调用
  window.scheduleFrame();
}

// class MyApp extends StatefulWidget {
//   const MyApp({Key key}) : super(key: key);

//   @override
//   _MyAppState createState() => _MyAppState();
// }

// class _MyAppState extends State<MyApp> {
//   String name = '哈哈哈';
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       home:Column(
//         children: [
//           Container(
//             height: 500,
//             child: ColoredBox(
//               color: Colors.white,
//               child:  Center(
//               widthFactor: 2,
//               heightFactor: 1,
//               child: Column(
//                 mainAxisSize: MainAxisSize.min,
//                 children: [
//                   SizedBox(
//                     width: 50,
//                     height: 50,
//                     child: ColoredBox(
//                       color: Colors.blue,
//                     ),
//                   ),
//                   SizedBox(
//                     width: 120,
//                     height: 100,
//                     child: ColoredBox(
//                       color: Colors.yellow,
//                     ),
//                   ),
//                 ],
//               ),),
//             ),
//           ),Expanded(child: Container(color: Colors.red,))
//         ],
//       ),
//     );
//   }
// }

// class MyApp1 extends StatefulWidget {
//   @override
//   _MyAppState1 createState() => _MyAppState1();
// }

// class _MyAppState1 extends State<MyApp1> {
//   ui.Image image;
//   @override
//   void initState() {
//     super.initState();
//     load('assets/test.png').then((value) => setState(() {
//           image = value;
//         }));
//     ss();
//   }

//   ss() {
//     ui.PictureRecorder recorder = ui.PictureRecorder();
//     Canvas canvas = Canvas(recorder);

//     // 调用 Canvas 的绘制接口，画一个圆形
//     canvas.drawCircle(Offset(200, 200), 100, Paint()..color = Colors.yellow);

//     // 绘制结束，生成Picture
//     picture = recorder.endRecording();
//   }

//   ui.Picture picture;
//   @override
//   Widget build(BuildContext context) {
//     return CustomPaint(
//       painter: MyCanvas(image, picture),
//     );
//   }

//   Future<ui.Image> loadUIImage(String imageAssetPath) async {
//     final ByteData data = await rootBundle.load(imageAssetPath);
//     final Completer<ui.Image> completer = Completer();
//     ui.decodeImageFromList(Uint8List.view(data.buffer), (ui.Image img) {
//       return completer.complete(img);
//     });
//     return completer.future;
//   }

//   Future<ui.Image> load(String asset) async {
//     ByteData data = await rootBundle.load(asset);
//     ui.Codec codec = await ui.instantiateImageCodec(data.buffer.asUint8List(),
//         targetWidth: 300, targetHeight: 300);
//     ui.FrameInfo fi = await codec.getNextFrame();
//     return fi.image;
//   }
// }

// class MyCanvas extends CustomPainter {
//   final ui.Image image;
//   final ui.Picture picture;

//   MyCanvas(this.image, this.picture);
//   @override
//   void paint(Canvas canvas, Size size) async {
//     Paint paint = Paint()
//       ..color = Colors.blue
//       ..style = PaintingStyle.stroke
//       ..strokeWidth = 5;
//     // 点
//     // canvas.drawPoints(
//     //     ui.PointMode.polygon,
//     //     [
//     //       Offset(100, 100),
//     //       Offset(250, 180),
//     //       Offset(200, 300),
//     //     ],
//     //     paint);
//     // paint.strokeCap = StrokeCap.round;
//     // canvas.drawPoints(ui.PointMode.points, [Offset(100, 200)], paint);

//     // 绘制线 drawLine
//     // canvas.drawLine(Offset(100, 100), Offset(250,180), paint);
//     // 圆弧
//     // Rect rect = Rect.fromCircle(
//     //     center: Offset(size.width / 2, size.height / 2), radius: 100);
//     // // canvas.drawRect(Rect.fromLTRB(100, 100, 350, 350), paint);
//     // // canvas.drawRect(
//     // //     Rect.fromCenter(center: Offset(200,300), width: 250, height: 350), paint);
//     // // canvas.drawRect(
//     // //     Rect.fromCircle(center: Offset(200, 300), radius: 150), paint);
//     // // canvas.drawRect(Rect.fromPoints(Offset(100, 200), Offset(300, 400)), paint);
//     // // canvas.drawArc(
//     // //     Rect.fromCircle(
//     // //         center: Offset(size.width / 2, size.height / 2), radius: 100),
//     // //     360 * (pi / 180),
//     // //     3600 * (pi / 180),
//     // //     false,
//     // //     paint);

//     // // drawRRect
//     // RRect rRect = RRect.fromLTRBR(100, 100, 350, 350, Radius.circular(30));
//     // // canvas.drawRRect(rRect, paint);
//     // double startAngle = 90 * (pi / 180);
//     // double sweepAngle = 90 * (pi / 180);

//     // // 路径
//     // Path path1 = new Path();

//     // /// 简单的path
//     // // Path path = new Path();
//     // // path.moveTo(100, 100);
//     // // path.lineTo(200, 200);
//     // // path.lineTo(250, 180);
//     // // path.lineTo(200, 300);
//     // // path.lineTo(100, 200);
//     // // canvas.drawPath(path, paint);
//     // /// 弧
//     // // path.moveTo(100, 100);
//     // // path.lineTo(200, 200);

//     // //// 画一个矩形区域
//     // // //// 在矩形区域画圆弧
//     // // path.addArc(rect, 90 * (pi / 180), 90 * (pi / 180));
//     // // paint.color = Colors.red;
//     // Rect pRect = Rect.fromLTRB(50, 150, 400, 350);
//     // Rect pRect1 = Rect.fromLTRB(100, 200, 350, 300);
//     // // path.addRect(pRect);
//     // // path.addRRect();
//     // // path.relativeLineTo(200, 200);

//     // //// 画一个圆角矩形
//     // // path.addRRect(rRect);

//     // //// 绘制椭圆
//     // // path.addOval(pRect);

//     // //// 通过绘制点连成线
//     // // path.addPolygon([
//     // //   Offset(100, 100),
//     // //   Offset(250, 180),
//     // //   Offset(200, 300),
//     // // ], false);

//     // ////
//     // // path.addArc(rect, startAngle, sweepAngle);
//     // // path.arcTo(rect,startAngle, sweepAngle,true);

//     // path1.moveTo(50, 300);
//     // path1.lineTo(50, 500);
//     // path1.lineTo(350, 500);

//     // // canvas.drawPath(path1,paint);

//     // paint.color = Colors.yellowAccent;
//     // // canvas.drawPoints(ui.PointMode.points,[Offset(50,200)], paint);
//     // // canvas.drawPoints(ui.PointMode.points,[Offset(300,400)], paint);

//     // var path = Path();
//     // path.moveTo(50, 500);
//     // // path1.quadraticBezierTo(100, 300, 350, 300);
//     // // path1.conicTo(100, 300, 350, 300, 3);
//     // // 绘制一个三阶贝塞尔曲线
//     // path.cubicTo(50, 200, 300, 400, 350, 150);
//     // path.extendWithPath(path, Offset(50, 30),
//     //     matrix4: Float64List.fromList(
//     //         [1, 0, 0, 0, .1, 1, 0, 0, 0, 0, 1, 0, 0, 0, 0, 2]));
//     // paint.color = Colors.red;
//     // canvas.drawPath(path, paint);

//     // // 阴影
//     // var path = Path()
//     //   ..moveTo(50.0, 50.0)
//     //   ..lineTo(300.0, 50.0)
//     //   ..lineTo(300.0, 200.0)
//     //   ..lineTo(50.0, 200.0)
//     //   ..close();
//     // canvas.drawShadow(path, Colors.blue, 3, false);
//     // // 向下平移到200 elevation设置为10
//     // canvas.drawShadow(path.shift(Offset(0, 200)), Colors.blue, 10, false);
//     // // 向下移动到400 transparentOccluder设置为true效果
//     // canvas.drawShadow(path.shift(Offset(0, 400)), Colors.blue, 10, true);

//     // 绘制文字
//     // final textStyle = ui.TextStyle(
//     //   color: Colors.white,
//     //   fontSize: 30,
//     // );
//     // // 第一步
//     // final paragraphStyle = ui.ParagraphStyle(
//     //     // 字体方向，有些国家语言是从右往左排版的
//     //     textDirection: TextDirection.ltr,
//     //     // 字体对齐方式
//     //     textAlign: TextAlign.justify,
//     //     fontSize: 20,
//     //     maxLines: 2,
//     //     // 字体超出大小时显示的提示
//     //     ellipsis: '...',
//     //     fontWeight: FontWeight.bold,
//     //     fontStyle: FontStyle.italic,
//     //     height: 5,
//     //     // 当我们设置[TextStyle.height]时 这个高度是否应用到字体顶部和底部
//     //     textHeightBehavior: TextHeightBehavior(
//     //         applyHeightToFirstAscent: true, applyHeightToLastDescent: true));
//     // // 第二步 与第三步
//     // final paragraphBuilder = ui.ParagraphBuilder(paragraphStyle)
//     //   ..addText(
//     //       'ParagraphBuilder类接收一个参数，是一个ParagraphStyle类，用于设置字体基本样式，例如字体方向、对齐方向、字体粗细等，下面我们分几个步骤来绘制文字');
//     // // 第四步
//     // var paragraph = paragraphBuilder.build();
//     // // 第五步
//     // paragraph.layout(ui.ParagraphConstraints(width: 300));
//     // 画一个辅助矩形
//     // canvas.drawRect(
//     //     Rect.fromLTRB(50, 50, 50 + paragraph.width, 50 + paragraph.height),
//     //     paint);

//     // paragraph.layout(ui.ParagraphConstraints(width: paragraph.maxIntrinsicWidth.ceilToDouble()));
//     // 第六步
//     // canvas.drawParagraph(paragraph, Offset(50, 50));
//     // 构造一个TextPainter
//     // var textPainter = TextPainter(
//     //   text: TextSpan(
//     //       text: "可多种不同效果的\n字体来支持富文本可多1",
//     //       style: TextStyle(color: Colors.white, fontSize: 20)),
//     //   textDirection: TextDirection.ltr,
//     //   textWidthBasis: TextWidthBasis.longestLine,
//     //   maxLines: 2,
//     // )
//     //   // 可以传入minWidth，maxWidth来限制它的宽度，如不传，文字会绘制在一行
//     //   ..layout(maxWidth: 300);
//     // print(textPainter.width);
//     // print(textPainter.height);
//     // var startOffset = 50.0;
//     // // 绘制辅助矩形框，在文字绘制前即可通过textPainter.width和textPainter.height来获取文字绘制的宽度
//     // canvas.drawRect(
//     //     Rect.fromLTRB(startOffset, startOffset, startOffset + textPainter.width,
//     //         startOffset + textPainter.height),
//     //     paint);
//     // textPainter.paint(canvas, Offset(startOffset, startOffset));

//     // // 绘制圆
//     // canvas.drawCircle(Offset(200,200), 100, paint);
//     // canvas.drawPoints(ui.PointMode.points, [Offset(200,200)], paint..color=Colors.white);

//     // // 画一个环
//     // RRect rrect = RRect.fromRectXY(
//     //     Rect.fromCircle(center: Offset(200, 200), radius: 150), 20.0, 40.0);
//     // RRect rrect1 = new RRect.fromRectXY(
//     //     Rect.fromCircle(center: Offset(200, 200), radius: 80), 100.0, 100.0);
//     // canvas.drawDRRect(rrect, rrect1, paint);

//     // canvas.drawAtlas(atlas, transforms, rects, colors, blendMode, cullRect, paint)
//     // canvas.drawImage(image, offset, paint)
//     // canvas.drawImageNine(image, center, dst, paint)
//     // canvas.drawImageRect(image, src, dst, paint)
//     // canvas.drawPicture(picture)
//     // canvas.drawRawAtlas(atlas, rstTransforms, rects, colors, blendMode, cullRect, paint)
//     // canvas.drawRawPoints(pointMode, points, paint)

//     // canvas.save();

//     // var path2 = path.shift(Offset(50,20));
//     // paint.color = Colors.yellow;
//     // canvas.drawPath(path2, paint);

//     // ui.PathMetrics pathMetrics = path.computeMetrics();
//     // // 绘制一半
//     // var progress = 0.5;
//     // // 将颜色更改为紫色用于区分
//     // paint.color = Colors.deepPurple;
//     // for (ui.PathMetric pathMetric in pathMetrics) {
//     //   Path extractPath = pathMetric.extractPath(
//     //     0.0,
//     //     pathMetric.length * progress,
//     //   );
//     //   canvas.drawPath(extractPath, paint);
//     // }

//     // drawArc 绘制圆弧
//     // canvas.drawArc(rect, 90 * (pi / 180), 90 * (pi / 180), false, paint);

//     // 绘制椭圆
//     // canvas.drawRect(pRect, paint);
//     // paint.color = Colors.yellow;
//     // canvas.drawOval(pRect, paint);

//     // canvas.save();
//     // canvas.rotate(10 * pi / 180);
//     // canvas.drawPath(generatePath(100, 150), paint);
//     // print(canvas.getSaveCount());

//     // Path generatePath(double x, double y) {
//     //   Path path = new Path();
//     //   path.moveTo(x, y);
//     //   path.lineTo(x + 100, y + 100);
//     //   path.lineTo(x + 150, y + 80);
//     //   path.lineTo(x + 100, y + 200);
//     //   path.lineTo(x, y + 100);
//     //   return path;
//     // }
//     // canvas.restore();
//     // canvas.drawPath(generatePath(100, 500), paint);
//     // canvas.drawRect(
//     //     Rect.fromCircle(
//     //         center: Offset(size.width / 2, size.height / 2), radius: 120),
//     //     Paint()..color = Colors.red);

//     Rect rect = Rect.fromCircle(
//         center: Offset(size.width / 2, size.height / 2), radius: 50);
//     // canvas.clipRRect(new RRect.fromRectXY(rect, 200.0, 200.0));
//     // canvas.saveLayer(rect, Paint());
//     // canvas.save();
//     // canvas.drawPaint(new Paint()..color = Colors.red);
//     // canvas.drawPaint(new Paint()..color = Colors.white);
//     // canvas.restore();
//     // canvas.restore();

//     // canvas.save();
//     // canvas.clipRRect(new RRect.fromRectXY(rect, 200.0, 200.0));
//     // canvas.drawPaint(new Paint()..color = Colors.red);
//     // canvas.drawPaint(new Paint()..color = Colors.white);
//     // canvas.restore();

//     if (image != null) {
//       canvas.drawImage(image, Offset(50, 50), paint);
//       Rect rect = Rect.fromCenter(
//           center: Offset(image.width / 2, image.height / 2),
//           width: image.width / 2,
//           height: image.height / 2);
//       canvas.drawRect(rect.shift(Offset(50, 50)), paint);
//       Rect dst = Rect.fromLTWH(50, 500, 400, 200);
//       // canvas.drawImageRect(
//       //     image,
//       //     rect,
//       //     dst,
//       //     paint);
//       canvas.drawImageNine(image, rect, dst, paint);
//     }
//     // if (picture != null) canvas.drawPicture(picture);
//   }

//   @override
//   bool shouldRepaint(covariant CustomPainter oldDelegate) {
//     return true;
//   }
// }
