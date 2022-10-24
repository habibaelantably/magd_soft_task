
import 'package:flutter/material.dart';

//this container is to adjust the image and the container contain it in upper slider in home screen

class ViewProductImage extends StatelessWidget
{
  const ViewProductImage({Key? key,required this.image}) : super(key: key);
  final String image;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Container(
        width: MediaQuery.of(context).size.width/4,
        height: MediaQuery.of(context).size.height/8,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20.0),
          boxShadow: [BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            spreadRadius: 2,
            blurRadius: 3,
            offset: const Offset(0, 2), // changes position of shadow
          ),],
          color: Colors.white,
        ),
        child:Padding(
          padding: const EdgeInsets.all(8.0),
          child: Image.asset(image),
        ) ,


      ),
    );
  }

}