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
    var pencil = getPen("Pencil");
    var colorPen = getPen("ColorPen");
    pencil.draw();
    colorPen.draw();
  }

  Pen getPen(String penStr) {
    if (penStr == "Pencil") {
      return new Pencil();
    } else if (penStr == "ColorPen") {
      return new ColorPen();
    } else {
      return null;
    }
  }
}
