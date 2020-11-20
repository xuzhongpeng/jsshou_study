import './run.dart';

abstract class ProtoType{
  String _id;
  ProtoType(this._id);
  String get id=>_id;
  void set id(String id)=>this._id=id;
  ProtoType clone();
}

class RunPrototype implements Run {
  @override
  main(){

  }
  @override
  String name="原型模式";
}
