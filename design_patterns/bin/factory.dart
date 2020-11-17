
import 'run.dart';

abstract class Pen {
  draw();
}

class Pencil implements Pen {
  draw() {
    print("this is Pencil");
  }
}

class ColorPen implements Pen {
  draw() {
    print("this is ColorPen");
  }
}

class RunFactory implements Run {
  @override
  main() {
    var pencil = new Pencil();
    var colorPen = new ColorPen();
    pencil.draw();
    colorPen.draw();
  }
}
