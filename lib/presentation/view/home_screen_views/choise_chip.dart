
import 'package:flutter/material.dart';
import 'package:magdsoft_flutter_structure/business_logic/chips_cubit/chips_cubit.dart';

class ChoiceChips extends StatelessWidget
{
  const ChoiceChips({Key? key,required this.avatar,required this.label,required this.index}) : super(key: key);
  final String avatar;
  final String label;
  final int? index;



  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: (){
        ChipsColorCubit.get(context).changeChipColor(index);
      },
      child: Chip(
            backgroundColor: ChipsColorCubit.get(context).chipColor==index ? Colors.blue:Colors.white,
            elevation: 3.0,
            shadowColor: Colors.grey,
            label: Row(
              children: [
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(100) ,
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.5),
                        spreadRadius: 3,
                        blurRadius: 4,
                        offset: const Offset(0, 3), // changes position of shadow
                      ),
                    ],
                  ),
                  child: CircleAvatar(
                    radius: 25,
                    backgroundColor: Colors.white,
                    child: Image.asset(avatar,width: 30,height: 30,),
                  ),
                ),
                const SizedBox(width:10.0),
                Text(label,style: TextStyle(color:ChipsColorCubit.get(context).chipColor==index ? Colors.white:Colors.black ),),
              ],
            ),

        ),
    );

  }

}