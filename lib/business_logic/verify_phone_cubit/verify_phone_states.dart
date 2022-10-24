

import '../../data/network/responses/login_response.dart';

class VerifyPhoneStates {}

class VerifyPhoneInitialState extends VerifyPhoneStates{}

class VerifyPhoneLoadingState extends VerifyPhoneStates{}

class VerifyPhoneSuccessState extends VerifyPhoneStates{

  final VerifyPhoneResponseModel verifyPhoneResponseModel;

  VerifyPhoneSuccessState(this.verifyPhoneResponseModel);

}

class VerifyPhoneErrorState extends VerifyPhoneStates{

  final String error;

  VerifyPhoneErrorState(this.error);
}

