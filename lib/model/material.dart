class MaterialMod {
  Type type;

  MaterialMod(this.type);

  MaterialMod.fromJson(Map<String, dynamic> json) {
    type = (json['Type'] != null ? new Type.fromJson(json['Type']) : null)!;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.type != null) {
      data['Type'] = this.type.toJson();
    }
    return data;
  }
}

class Type {
  Category category;

  Type({required this.category});

  Type.fromJson(Map<String, dynamic> json) {
    category = json['Category'] != null
        ? new Category.fromJson(json['Category'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.category != null) {
      data['Category'] = this.category.toJson();
    }
    return data;
  }
}

class Category {
  Name name;

  Category({required this.name});

  Category.fromJson(Map<String, dynamic> json) {
    name = json['Name'] != null ? new Name.fromJson(json['Name']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.name != null) {
      data['Name'] = this.name.toJson();
    }
    return data;
  }
}

class Name {
  String add;
  String category;
  String chem;
  String name;
  String type;
  String use;

  Name({this.add, this.category, this.chem, this.name, this.type, this.use});

  Name.fromJson(Map<String, dynamic> json) {
    add = json['add'];
    category = json['category'];
    chem = json['chem'];
    name = json['name'];
    type = json['type'];
    use = json['use'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['add'] = this.add;
    data['category'] = this.category;
    data['chem'] = this.chem;
    data['name'] = this.name;
    data['type'] = this.type;
    data['use'] = this.use;
    return data;
  }
}
