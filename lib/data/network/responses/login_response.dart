class VerifyPhoneResponseModel {
   int? status;
   String? message;
   String? code;

  VerifyPhoneResponseModel.fromJson(Map<String, dynamic>json)
  {
    status = json['status'];
    message = json['message'];
    code = json['code'];
  }
}