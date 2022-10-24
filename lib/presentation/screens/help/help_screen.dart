
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:magdsoft_flutter_structure/business_logic/help_cubit/help_cubit.dart';
import 'package:magdsoft_flutter_structure/business_logic/help_cubit/help_states.dart';
import 'package:magdsoft_flutter_structure/presentation/widget/shared_widgets/toast.dart';


import '../../widget/shared_widgets/default_button.dart';
import '../../widget/help_screen/help_widget.dart';

class HelpScreen extends StatelessWidget
{
  const HelpScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context)=>HelpCubit()..getHelpData(),
      child: BlocConsumer<HelpCubit,GetHelpStates>(
        builder: (BuildContext context, state){
          return state is GetHelpSuccessStates ?
             Scaffold(
              body: Container(
                height: MediaQuery.of(context).size.height,
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: [
                        Colors.blue.withOpacity(0.9),
                        Colors.white,
                        Colors.white,
                      ]
                  ),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Column(
                    children: [
                      SizedBox(height: MediaQuery.of(context).size.height/26,),
                      const Text('Help',style: TextStyle(color: Colors.white,fontSize: 28),),
                      SizedBox(height: MediaQuery.of(context).size.height/22,),
                      ListView.separated(
                      shrinkWrap: true,
                      itemBuilder:(context, index) => ExpansionTileWidget(
                        title: HelpCubit.get(context).helpResponseModel!.data[index].question,
                        body: HelpCubit.get(context).helpResponseModel!.data[index].answer,),
                      separatorBuilder: (context, index) =>const SizedBox(height: 20.0,),
                      itemCount: HelpCubit.get(context).helpResponseModel!.data.length),
                     const Spacer(),
                      DefaultButton(
                        isUpperCase: false,
                        text: 'Continue',
                        function: (){},
                        width:MediaQuery.of(context).size.width/1.8 ,
                        height:MediaQuery.of(context).size.height/20,
                        radius: 20,
                      )
                    ],
                  ),
                ),
              )
          ): const Scaffold(body: Center(child: CircularProgressIndicator()),);
        },
        listener: (BuildContext context, Object? state) { 
          if(state is GetHelpSuccessStates){
            showToast(text: state.helpResponseModel!.message!, toastColor: Colors.green);
          }else if(state is GetHelpErrorStates)
          {
            showToast(text: state.error!, toastColor: Colors.red);
          }
        },
      ),
    );
  }
  }

