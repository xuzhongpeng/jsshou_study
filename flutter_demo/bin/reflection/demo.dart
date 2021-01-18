import 'package:reflectable/mirrors.dart';
import 'package:reflectable/reflectable.dart';

const reflector = const Reflector();

class Reflector extends Reflectable {
  const Reflector()
      : super(
          invokingCapability,
          typingCapability,
          reflectedTypeCapability,
        );
}

@reflector
class Dictionary {
  String english, myLang;
  int index;
}

main() {
  testReflection();
}

testReflection() {
  ClassMirror classMirror = reflector.reflectType(Dictionary);
  Dictionary dic = classMirror.newInstance("", []);
  classMirror.declarations.values.forEach((field) {
    VariableMirror variableMirror = field;
    Type type = variableMirror.dynamicReflectedType;
    print("field: " +
        variableMirror.simpleName +
        " has type: " +
        type.toString());
    /*??????????????????????????????????????????
    Now How To Get Field types i.e. String & int
    How to instantiate class object
    How to set fields values
    ???????????????????????????????????????????*/
  });
  InstanceMirror instanceMirror = reflector.reflect(dic);
  instanceMirror.invokeSetter("index", 3);
  print(dic.index);
}
