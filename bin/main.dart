import "package:lpinyin/lpinyin.dart";

void main() {
  List<String> a = ['测试', 'D白', '2da', '1大发', 'aaa', 'CCC'];
  List<String> b =
      a.map((item) => PinyinHelper.getFirstWordPinyin(item)).toList();
  b = b.map((item) => item.toLowerCase()).toList();
  b.sort((a, b) => a.compareTo(b));

  print(b.toString());
}
