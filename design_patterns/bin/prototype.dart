import './run.dart';

abstract class ProtoType{
  String _id;
  ProtoType(this._id);
  String get id=>_id;
  void set id(String id)=>this._id=id;
  ProtoType clone();
}
class ConcretePrototype extends ProtoType{
  ConcretePrototype(String id,this.name) : super(id);
  final String name;
  @override
  ConcretePrototype clone() {
    ProtoType protoType = new ConcretePrototype(this.id,this.name);
    return protoType;
  }
}
class RunPrototype implements Run {
  @override
  main(){
    var a= ConcretePrototype("1","clone");
    var b= a.clone();
    print("实例a的hashCode:"+a.hashCode.toString());
    print("实例b的hashCode:"+b.hashCode.toString());
    print("实例a的name:"+a.name);
    print("实例b的name:"+b.name);
  }
  @override
  String name="原型模式";
}
