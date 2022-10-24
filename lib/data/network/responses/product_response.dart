

import '../../models/product_data_model.dart';

class ProductsResponseModel
{
  int? status;
  String? message;
  List<ProductsDataModel> data=[];

  ProductsResponseModel.fromJson(Map<String,dynamic> json)
  {
    status=json['status'];
    message=json['message'];
    json['products'].forEach((element){
      data.add(ProductsDataModel.fromJson(element));
    });

  }

}



