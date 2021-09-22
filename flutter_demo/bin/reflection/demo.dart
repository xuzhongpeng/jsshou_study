// import 'package:reflectable/mirrors.dart';
// import 'package:reflectable/reflectable.dart';

// const reflector = const Reflector();

// class Reflector extends Reflectable {
//   const Reflector()
//       : super(
//           invokingCapability,
//           typingCapability,
//           reflectedTypeCapability,
//         );
// }

// @reflector
// class Dictionary {
//   String english, myLang;
//   int index;
// }

// main() {
//   testReflection();
// }

// testReflection() {
//   ClassMirror classMirror = reflector.reflectType(Dictionary);
//   Dictionary dic = classMirror.newInstance("", []);
//   classMirror.declarations.values.forEach((field) {
//     print("field: " +
//         field.simpleName +
//         " has type: " +
//         field.runtimeType.toString());
//   });
//   InstanceMirror instanceMirror = reflector.reflect(dic);
//   instanceMirror.invokeSetter("index", 3);
//   instanceMirror.invokeSetter('memberName', ["2"]);
//   print(dic.index);
// }
