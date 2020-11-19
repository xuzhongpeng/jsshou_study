import './model.dart';

class UserModel extends Model {
  String name = 'come on man';

  void setName(name) {
    this.name = name;
    notifyListeners();
  }
}
