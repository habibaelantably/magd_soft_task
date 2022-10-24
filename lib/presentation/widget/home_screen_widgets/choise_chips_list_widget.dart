import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../business_logic/chips_cubit/chips_cubit.dart';
import '../../../business_logic/chips_cubit/chips_state.dart';
import '../../view/home_screen_views/choise_chip.dart';


//widget for home filters contain cubit to change colors with index changing
class ChoiceChipsList extends StatelessWidget
{
  const ChoiceChipsList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    //chips is getting it`s images and text value from local list
    List<String> chipsLabel=['All','Acer','Razer','apple'];
    List<String> chipsImages=['assets/images/cup.png','assets/images/acer.png','assets/images/razer.png','assets/images/apple.png'];
    return  SizedBox(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height/10,
      child: BlocProvider(
        create: (context)=>ChipsColorCubit(),
        child: BlocBuilder<ChipsColorCubit,ChipColorStates>(
          builder: (BuildContext context, state) {
            return ListView.separated(
              shrinkWrap: true,
              itemBuilder: (context, index) =>  ChoiceChips(
                avatar: chipsImages[index],
                label: chipsLabel[index],
                index:index,),
              separatorBuilder:(context, index) => const SizedBox(width: 10,),
              itemCount: 4,
              scrollDirection: Axis.horizontal,

            );
          },

        ),
      ),
    );
  }

}