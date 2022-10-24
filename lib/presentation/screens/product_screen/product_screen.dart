import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:magdsoft_flutter_structure/business_logic/get_products_cubit/get_products_cubit.dart';
import 'package:magdsoft_flutter_structure/business_logic/get_products_cubit/get_products_state.dart';
import 'package:magdsoft_flutter_structure/data/models/product_data_model.dart';
import 'package:magdsoft_flutter_structure/presentation/styles/colors.dart';
import 'package:magdsoft_flutter_structure/presentation/widget/shared_widgets/default_button.dart';
import 'package:magdsoft_flutter_structure/presentation/widget/home_screen_widgets/product_image_container.dart';
import 'package:sizer/sizer.dart';
import '../../view/product_screen_view/view_store_item.dart';
import '../product_layout/product_layout.dart';

class ProductScreen extends StatelessWidget {

  const ProductScreen({Key? key,required this.productsDataModel}) : super(key: key);

  final ProductsDataModel? productsDataModel;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context)=>GetProductsCubit(),
      child: BlocConsumer<GetProductsCubit,GetProductsStates>(
        builder: (BuildContext context, state) {
          return Scaffold(
            body: Container(
              height: MediaQuery.of(context).size.height,
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [
                      AppColor.mainColor.withOpacity(0.9),
                      AppColor.white,
                      AppColor.white,
                    ]
                ),
              ),
              child: SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(height: MediaQuery.of(context).size.height/26,),
                      Container(
                        height: MediaQuery.of(context).size.height/20,
                        width: MediaQuery.of(context).size.width/10,
                        decoration: BoxDecoration(
                            color: AppColor.white,
                            borderRadius: BorderRadius.circular(10.0),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.grey.withOpacity(0.3),
                                spreadRadius: 5,
                                blurRadius: 4,
                                offset: const Offset(0, 2), // changes position of shadow
                              ),
                            ]
                        ),
                        child: const Padding(
                          padding: EdgeInsets.only(left: 8.0),
                          child: Icon(Icons.arrow_back_ios,color: Colors.grey,),
                        ),

                      ),
                      const SizedBox(height: 10,),
                       Text(
                        'Predator Helios 300',
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 20.sp,
                            color: AppColor.white),),
                      const SizedBox(height: 10,),
                      Text(productsDataModel!.type,style: const TextStyle(color: AppColor.white),),
                      const SizedBox(height: 10,),
                      const ProductImageContainer(),
                      const SizedBox(height: 10,),
                      ViewStoreItem(storeName: productsDataModel!.company,),
                      const SizedBox(height: 20,),
                      Row(
                        children: [
                          FittedBox(
                            child: SizedBox(
                              height: MediaQuery.of(context).size.height/18,
                              width: MediaQuery.of(context).size.width/3,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children:  [
                                  const Text('Price',style: TextStyle(color: Colors.grey),),
                                  const SizedBox(height: 5,),
                                  Text(productsDataModel!.price),
                                ],
                              ),
                            ),
                          ),
                          const Spacer(),
                          FittedBox(
                            child: DefaultButton(
                              isUpperCase: false,
                              text: 'Add To Cart',
                              function: (){},
                              radius: 10,
                              height: MediaQuery.of(context).size.height/18,
                              width: MediaQuery.of(context).size.width/1.8,

                            ),
                          )
                        ],
                      ),
                      SizedBox(height: MediaQuery.of(context).size.height/22,),
                      Padding(
                        padding:  EdgeInsets.symmetric(horizontal: MediaQuery.of(context).size.width/18),
                        child: Column(
                          children: [
                            Container(
                              width: MediaQuery.of(context).size.width,
                              height: 1,
                              color: Colors.grey,
                            ),
                          ],
                        ),
                      ),
                       ProductLayout(productsDataModel: productsDataModel!,)

                    ],),
                ),
              ),
            ),
          );
        },
        listener: (BuildContext context, Object? state) {
          if(state is GetProductsSuccessStates)
          {

          }
        },

      ),
    );
  }

}