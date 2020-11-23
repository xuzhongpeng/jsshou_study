import 'run.dart';

//官方媒体播放接口
abstract class MediaPlayer {
  void play(String audioType, String fileName);
}

//自定义媒体播放接口
abstract class AdvancedMediaPlayer {
  void playVlc(String fileName);
  void playMp4(String fileName);
}

//创建实现了 AdvancedMediaPlayer 接口的实体类。
class VlcPlayer implements AdvancedMediaPlayer {
  @override
  void playMp4(String fileName) {}

  @override
  void playVlc(String fileName) {
    print("Playing vlc file. Name: " + fileName);
  }
}

class Mp4Player implements AdvancedMediaPlayer {
  @override
  void playVlc(String fileName) {
    //什么也不做
  }

  @override
  void playMp4(String fileName) {
    print("Playing mp4 file. Name: " + fileName);
  }
}

// 创建实现了 MediaPlayer 接口的适配器类。
class MediaAdapter implements MediaPlayer {
  AdvancedMediaPlayer advancedMusicPlayer;
  MediaAdapter(String audioType) {
    if (audioType == "vlc") {
      advancedMusicPlayer = new VlcPlayer();
    } else if (audioType == "mp4") {
      advancedMusicPlayer = new Mp4Player();
    }
  }
  @override
  void play(String audioType, String fileName) {
    if (audioType == "vlc") {
      advancedMusicPlayer.playVlc(fileName);
    } else if (audioType == "mp4") {
      advancedMusicPlayer.playMp4(fileName);
    }
  }
}

// 创建实现了 MediaPlayer 接口的实体类。
class AudioPlayer implements MediaPlayer {
  MediaAdapter mediaAdapter;

  @override
  void play(String audioType, String fileName) {
    //播放 mp3 音乐文件的内置支持
    if (audioType == "mp3") {
      print("Playing mp3 file. Name: " + fileName);
    }
    //mediaAdapter 提供了播放其他文件格式的支持
    else if (audioType == "vlc" || audioType == "mp4") {
      mediaAdapter = new MediaAdapter(audioType);
      mediaAdapter.play(audioType, fileName);
    } else {
      print("Invalid media. " + audioType + " format not supported");
    }
  }
}

class RunAdapter implements Run {
  @override
  main() {}
  @override
  String name = "适配器模式";
}
