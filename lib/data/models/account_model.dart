class AccountModel {
  int? id;
  String? name;
  String? phone;

  AccountModel.fromJson(Map<String, dynamic>json)
  {
    id = json['id'];
    name = json['name'];
    phone = json['phone'];
  }
}