
import 'package:magdsoft_flutter_structure/data/network/responses/product_response.dart';

class GetProductsStates{}

class GetProductsInitialState extends GetProductsStates{}

class GetProductsLoadingState extends GetProductsStates{}

class GetProductsSuccessStates extends GetProductsStates{
  ProductsResponseModel? productsResponseModel;

  GetProductsSuccessStates(this.productsResponseModel);
}

class GetProductsErrorStates extends GetProductsStates{
  String? error;

  GetProductsErrorStates(this.error);
}