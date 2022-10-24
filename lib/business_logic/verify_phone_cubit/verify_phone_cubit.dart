
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:magdsoft_flutter_structure/business_logic/verify_phone_cubit/verify_phone_states.dart';
import 'package:magdsoft_flutter_structure/constants/end_points.dart';
import 'package:magdsoft_flutter_structure/data/data_providers/remote/dio_helper.dart';
import 'package:magdsoft_flutter_structure/data/network/requests/login_request.dart';
import 'package:magdsoft_flutter_structure/data/network/responses/login_response.dart';

class VerifyPhoneCubit extends Cubit<VerifyPhoneStates> {
  
  VerifyPhoneCubit() : super(VerifyPhoneInitialState());

  static VerifyPhoneCubit get(context)=>BlocProvider.of(context);

  VerifyPhoneResponseModel? verifyPhoneResponseModel;

  void verifyPhone({required String name,required String phone})
  {
    VerifyPhoneRequestModel model=VerifyPhoneRequestModel(name: name,phone: phone);

    emit(VerifyPhoneLoadingState());

    DioHelper.postData(
        url: verifyPhoneEndPoint,
        body: model.toMap(),
    ).then((value) {
      verifyPhoneResponseModel=VerifyPhoneResponseModel.fromJson(value.data);
      if(verifyPhoneResponseModel!.status==200){
        print(value.data);
      //CacheHelper.saveDataSharedPreference(key: 'login data', value: model);
      emit(VerifyPhoneSuccessState(verifyPhoneResponseModel!));
      }else{
        emit(VerifyPhoneErrorState(verifyPhoneResponseModel!.message!));
      }
    }).catchError((error){
      emit(VerifyPhoneErrorState(error.toString()));
    });
    
  }
  
  


}

