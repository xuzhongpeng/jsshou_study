import './run.dart';

abstract class ProtoType{
  String _id;
  ProtoType(this._id);
  String get id=>_id;
  void set id(String id)=>this._id=id;
  ProtoType clone();
}
class ConcretePrototype1 extends ProtoType{
  ConcretePrototype1(String id) : super(id);
  
  @override
  ProtoType clone() {
    ProtoType protoType = new ConcretePrototype1(this.id);
    return protoType;
  }
}
class ConcretePrototype2 extends ProtoType{
  ConcretePrototype2(String id) : super(id);
  
  @override
  ProtoType clone() {
    ProtoType protoType = new ConcretePrototype2(this.id);
    return protoType;
  }
}
class RunPrototype implements Run {
  @override
  main(){
    var a= ConcretePrototype1("1");
    // var b= ConcretePrototype2("1");
    print(a);
    print(a.clone());
  }
  @override
  String name="原型模式";
}
