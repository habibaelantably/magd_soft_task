
import 'package:magdsoft_flutter_structure/data/network/responses/help_response.dart';

class GetHelpStates{}

class GetHelpInitialState extends GetHelpStates{}

class GetHelpLoadingState extends GetHelpStates{}

class GetHelpSuccessStates extends GetHelpStates{

  HelpResponseModel? helpResponseModel;
  GetHelpSuccessStates(this.helpResponseModel);

}

class GetHelpErrorStates extends GetHelpStates{
  String? error;
  GetHelpErrorStates(this.error);
}