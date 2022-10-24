import 'package:flutter/material.dart';
import 'package:magdsoft_flutter_structure/presentation/widget/home_screen_widgets/View_product_images.dart';

//this container contain the image in the upper slider in home widget and the text on it
class ProductImageContainer extends StatelessWidget
{
  const ProductImageContainer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height/3.5,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20.0),
            boxShadow: [BoxShadow(
              color: Colors.grey.withOpacity(0.5),
              spreadRadius: 0,
              blurRadius: 3,
              offset: const Offset(0, 3), // changes position of shadow
            ),],
            color: Colors.white,
          ),
          child:Padding(
            padding: const EdgeInsets.all(8.0),
            child: Image.asset('assets/images/product.png'),
          ) ,
        ),
        const SizedBox(height: 10,),
        SizedBox(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height/8,
          child: ListView.separated(
              shrinkWrap: true,
              scrollDirection: Axis.horizontal,
              itemBuilder:(context, index) => const ViewProductImage(image: 'assets/images/product.png',),
              separatorBuilder: (context, index) => const SizedBox(width: 10,),
              itemCount: 4),
        ),
      ],
    );
  }

}