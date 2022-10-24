
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:magdsoft_flutter_structure/business_logic/get_products_cubit/get_products_state.dart';
import 'package:magdsoft_flutter_structure/constants/end_points.dart';
import 'package:magdsoft_flutter_structure/data/network/responses/product_response.dart';

import '../../data/data_providers/remote/dio_helper.dart';


class GetProductsCubit extends Cubit<GetProductsStates> {
 GetProductsCubit() : super(GetProductsInitialState());

  static GetProductsCubit get(context) => BlocProvider.of(context);

  ProductsResponseModel? productsResponseModel;


  void getProductsData() {

  emit(GetProductsLoadingState());
  DioHelper.getData(
    url: getProductsEndPoint,
    query: {},)
      .then((value) {
    productsResponseModel = ProductsResponseModel.fromJson(value.data);

    if(productsResponseModel!.status==200){
          print(value.data);
          emit(GetProductsSuccessStates(productsResponseModel!));
        }else
        {
          emit(GetProductsErrorStates(productsResponseModel!.message));
        }

  }).catchError((error) {
    emit(GetProductsErrorStates(error.toString()));
  });
}
}

























