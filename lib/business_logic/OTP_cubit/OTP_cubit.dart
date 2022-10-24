
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:magdsoft_flutter_structure/business_logic/OTP_cubit/OTP_states.dart';
import 'package:magdsoft_flutter_structure/constants/end_points.dart';
import 'package:magdsoft_flutter_structure/data/data_providers/remote/dio_helper.dart';
import '../../data/network/requests/otp_request.dart';
import '../../data/network/responses/otp_response.dart';

class OTPCubit extends Cubit<OTPStates> {

  OTPCubit() : super(OTPInitialState());

  static OTPCubit get(context)=>BlocProvider.of(context);

  OTPResponseModel? otpResponseModel;

  void verifyOTP({required String code,required String phone})
  {
    OTPRequestModel model=OTPRequestModel(code: code,phone: phone);

    emit(OTPLoadingState());
    DioHelper.postData(
      url: otpEndPoint,
      body: model.toMap(),
    ).then((value) {
      otpResponseModel=OTPResponseModel.fromJson(value.data);

      if(otpResponseModel!.status==200){
        emit(OTPSuccessState(otpResponseModel!));
      }else{
        emit(OTPErrorState(otpResponseModel!.message!));
        print(otpResponseModel!.message!);
      }
    }).catchError((error){
      emit(OTPErrorState(error.toString()));
      print(error.toString());
    });

  }




}

