class ListState<T> {
  Items list;
  Tickets tickets;
  ListState({this.list, this.tickets});
}

class Items {
  List<Item> data;
  Items(this.data);
  Items.fromJson(json) {
    this.data =
        List<Item>.from(json['data'].map((v) => Item.fromJson(v)).toList());
  }
}

class Item {
  int id;
  String name;
  bool show;

  Item({this.id, this.name, this.show});

  Item.fromJson(Map<String, dynamic> json) {
    id = int.parse(json['id']);
    name = json['name'];
    show = json['show'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['show'] = this.show;
    return data;
  }
}

class Tickets {
  List<Ticket> ticket;
  Tickets.fromJson(json) {
    this.ticket =
        List<Ticket>.from(json['data'].map((v) => Ticket.fromJson(v)).toList());
  }
}

class Ticket {
  String id;
  String subject;
  String status;
  Ticket.fromJson(Map json) {
    this.id = json['id'];
    this.subject = json['subject'];
    this.status = json['status'];
  }
}
