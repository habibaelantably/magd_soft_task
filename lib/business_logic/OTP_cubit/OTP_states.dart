



import 'package:magdsoft_flutter_structure/data/network/responses/otp_response.dart';

class OTPStates {}

class OTPInitialState extends OTPStates{}

class OTPLoadingState extends OTPStates{}

class OTPSuccessState extends OTPStates{
  final OTPResponseModel otpResponseModel;

  OTPSuccessState(this.otpResponseModel);
}

class OTPErrorState extends OTPStates{

  final String error;

  OTPErrorState(this.error);
}

