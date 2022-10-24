import 'package:magdsoft_flutter_structure/data/models/account_model.dart';

class OTPResponseModel {
  int? status;
  String? message;
  AccountModel? account;

  OTPResponseModel.fromJson(Map<String, dynamic>json)
  {
    status = json['status'];
    message = json['message'];
    account = AccountModel.fromJson(json['account']);
  }
}