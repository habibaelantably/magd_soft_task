
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:magdsoft_flutter_structure/business_logic/chips_cubit/chips_state.dart';

class ChipsColorCubit extends Cubit<ChipColorStates>
{
  ChipsColorCubit() : super(InitialChipColorState());

  static ChipsColorCubit get(context)=>BlocProvider.of(context);

  int chipColor=0;

  void changeChipColor(index)
  {
    chipColor=index;
    emit(ChangeChipColorState());
  }
}

