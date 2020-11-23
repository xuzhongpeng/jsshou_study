

import 'run.dart';
//官方媒体播放接口
abstract class MediaPlayer{
  void play(String audioType,String fileName);
}
//自定义媒体播放接口
abstract class AdvancedMediaPlayer {
  void playVlc(String fileName);
  void playMp4(String fileName);
}
//创建实现了 AdvancedMediaPlayer 接口的实体类。
class VlcPlayer implements AdvancedMediaPlayer{
  @override
  void playMp4(String fileName) {
    // TODO: implement playMp4
  }

  @override
  void playVlc(String fileName) {
    // TODO: implement playVlc
  }
  
}
class RunAdapter implements Run {
  @override
  main() {
  }
  @override
  String name="适配器模式";
}