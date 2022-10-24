class ProductsDataModel
{
  late int id;
  late String company;
  late String name;
  late String type;
  late String price;
  late String description;

  ProductsDataModel({
    required this.id,
    required this.company,
    required this.name,
    required this.type,
    required this.price,
    required this.description,
});

  ProductsDataModel.fromJson(Map<String,dynamic> json)
  {
    id=json['id'];
    company=json['company'];
    name=json['name'];
    type=json['type'];
    price=json['price'];
    description=json['description'];
  }

  Map<String,dynamic> toMap()
  {
    return
      {
        'id':id,
        'company':company,
        'name':name,
        'type':type,
        'price':price,
        'description':description
      };
  }
}