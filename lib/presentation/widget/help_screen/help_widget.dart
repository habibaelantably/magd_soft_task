import 'package:flutter/material.dart';

class ExpansionTileWidget extends StatelessWidget
{
  const ExpansionTileWidget({Key? key,required this.title,required this.body}) : super(key: key);
  final String title;
  final String body;

  @override
  Widget build(BuildContext context) {
    return  Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10.0),
        boxShadow: [BoxShadow(
          color: Colors.grey.withOpacity(0.5),
          spreadRadius: 2,
          blurRadius: 3,
        ),],
        color: Colors.white,
      ),
      child: ExpansionTile(
          title: Text(title,style: const TextStyle(color: Colors.blue),),
        children: [
          ListTile(title: Text(body),)
        ],


      ),
    );
  }
  
}