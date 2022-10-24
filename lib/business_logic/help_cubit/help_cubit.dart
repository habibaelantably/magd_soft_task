
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:magdsoft_flutter_structure/data/models/help_data_model.dart';

import '../../constants/end_points.dart';
import '../../data/data_providers/remote/dio_helper.dart';
import '../../data/network/responses/help_response.dart';
import 'help_states.dart';


class HelpCubit extends Cubit<GetHelpStates> {
  HelpCubit() : super(GetHelpInitialState());

  static HelpCubit get(context) => BlocProvider.of(context);

  HelpResponseModel? helpResponseModel;
  HelpDataModel? helpDataModel;


  void getHelpData() {

    emit(GetHelpLoadingState());
    DioHelper.getData(
      url: getHelpEndPoint,
      query: {},)
        .then((value) {
      helpResponseModel = HelpResponseModel.fromJson(value.data);

      if(helpResponseModel!.status==200){
        print(value.data);
        emit(GetHelpSuccessStates(helpResponseModel));
      }else
      {
        emit(GetHelpErrorStates(helpResponseModel!.message));
      }

    }).catchError((error) {
      print(error.toString());
      emit(GetHelpErrorStates(error.toString()));
    });
  }
}

























