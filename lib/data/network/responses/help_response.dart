

import '../../models/help_data_model.dart';

class HelpResponseModel
{
  int? status;
  String? message;
  List<HelpDataModel> data=[];

 HelpResponseModel.fromJson(Map<String,dynamic> json)
  {
    status=json['status'];
    message=json['message'];
    json['help'].forEach((element){
      data.add(HelpDataModel.fromJson(element));
    });

  }
}



