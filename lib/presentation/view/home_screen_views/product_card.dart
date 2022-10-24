import 'package:flutter/material.dart';
import 'package:magdsoft_flutter_structure/data/models/product_data_model.dart';
import 'package:magdsoft_flutter_structure/presentation/styles/colors.dart';
import 'package:sizer/sizer.dart';

import '../../router/app_router.dart';

class BuildProductCardWidget extends StatelessWidget
{
   const BuildProductCardWidget({Key? key,
    required this.productsDataModel
  }) : super(key: key);
  final ProductsDataModel productsDataModel;


  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: (){
        Navigator.pushNamed(context, Routes.productScreen,arguments: productsDataModel.toMap());
      },
      child: Container(
          height:MediaQuery.of(context).size.height/3 ,
          width:MediaQuery.of(context).size.width/2.3,
          decoration:  BoxDecoration(
            borderRadius: const BorderRadius.all(Radius.circular(20.0)),
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.5),
                spreadRadius: 0,
                blurRadius: 3,
                offset: const Offset(0, 3), // changes position of shadow
              ),
            ],
            color: AppColor.white,
          ),
          child: Stack(
            alignment: Alignment.topRight,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    height:MediaQuery.of(context).size.height/5.5,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20.0),
                    ),
                    child: Container(
                      height:MediaQuery.of(context).size.height/2,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20.0),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.5),
                            spreadRadius: 0,
                            blurRadius: 3,
                            offset: const Offset(0, 3), // changes position of shadow
                          ),],
                        color: AppColor.white,
                      ),
                      child:Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Image.asset('assets/images/product.png'),
                      ) ,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(right: 8.0),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children:  [
                          FittedBox(
                            child: Text(productsDataModel.name,
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                              style:  TextStyle(
                                color:AppColor.mainColor,
                                fontSize: 20.sp
                              ),
                            ),
                          ),
                          FittedBox(
                            child: Text(productsDataModel.company,
                              style: const TextStyle(
                                color:Colors.black,
                              ),
                            ),
                          ),
                          const SizedBox(height: 30,),
                          FittedBox(
                            child: Text('${productsDataModel.price}EGP',
                              style: const TextStyle(
                                color:Colors.grey,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
              Column(
                  children:  [
                    const Padding(
                        padding: EdgeInsets.only(top: 8.0,right: 8.0),
                        child: Icon(Icons.favorite,color: Colors.red,)
                    ),
                    const Spacer(),
                    Container(
                      height:MediaQuery.of(context).size.height/20 ,
                      width:MediaQuery.of(context).size.width/10,
                      decoration:   BoxDecoration(
                         gradient: LinearGradient(
                             colors: [
                               Colors.blue.withOpacity(0.9),
                               Colors.blue.withOpacity(0.3)
                             ]),
                        borderRadius: const BorderRadius.only(topLeft:Radius.circular(20.0),bottomRight:Radius.circular(20.0)),
                    ),
                      child: const Icon(Icons.add,color: Colors.white,size: 30,),
                    )

                  ],
                ),

            ],
          )


      ),
    );
  }
}