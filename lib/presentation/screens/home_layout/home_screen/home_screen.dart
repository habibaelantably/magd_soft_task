import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:magdsoft_flutter_structure/business_logic/get_products_cubit/get_products_cubit.dart';
import 'package:magdsoft_flutter_structure/business_logic/get_products_cubit/get_products_state.dart';
import 'package:magdsoft_flutter_structure/data/models/product_data_model.dart';
import 'package:magdsoft_flutter_structure/presentation/styles/colors.dart';
import 'package:magdsoft_flutter_structure/presentation/widget/shared_widgets/default_form_field.dart';
import 'package:sizer/sizer.dart';
import '../../../view/home_screen_views/product_card.dart';
import '../../../widget/home_screen_widgets/choise_chips_list_widget.dart';

class HomeScreen extends StatelessWidget
{
  final TextEditingController searchController=TextEditingController();

  HomeScreen({Key? key,required this.productsDataModel}) : super(key: key);

    final ProductsDataModel? productsDataModel;

  final List<String> bannerImage=['assets/images/bannerImage.png','assets/images/secondBannerImage.png',];
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context)=>GetProductsCubit()..getProductsData(),
      child: BlocConsumer<GetProductsCubit,GetProductsStates>(
        builder: (BuildContext context, state) {
          return state is GetProductsSuccessStates?Scaffold(
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
                      AppColor.white
                    ]
                ),
              ),
              child: SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: Column(
                    children: [
                      SizedBox(height:MediaQuery.of(context).size.height/14),
                      Row(
                        children: [
                          Expanded(
                            child: DefaultFormField(
                              validator: (){},
                              controller: searchController,
                              type: TextInputType.text,
                              haveSuffixIcon: true,
                              hintText: 'search',
                              suffixIcon: Icons.search,),
                          ),
                          SizedBox(width:MediaQuery.of(context).size.width/40),
                          Container(
                            height: MediaQuery.of(context).size.height/15,
                            width: MediaQuery.of(context).size.width/7,
                            decoration: BoxDecoration(
                                color: AppColor.white,
                                borderRadius: BorderRadius.circular(10.0),
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.grey.withOpacity(0.2),
                                    spreadRadius: 5,
                                    blurRadius: 3,
                                  ),
                                ]
                            ),
                            child: const Icon(Icons.filter_alt_sharp,color: Colors.grey,),

                          )
                        ],
                      ),
                      const SizedBox(height: 10,),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 0.0),
                        child: SizedBox(
                          height:MediaQuery.of(context).size.height/4,
                          width:MediaQuery.of(context).size.width,
                          child: ListView.separated(
                            shrinkWrap: true,
                            itemBuilder: (context, index) => Container(
                                width:MediaQuery.of(context).size.width,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(20.0),
                                    image:  DecorationImage(fit: BoxFit.cover,image:AssetImage(bannerImage[index]))
                                ),
                                child: Padding(
                                  padding: const EdgeInsets.only(left: 20.0),
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      SizedBox(height:MediaQuery.of(context).size.height/5.4),
                                      FittedBox(child: Text('New Release',style: TextStyle(color: AppColor.white,fontSize: 12.sp),)),
                                      FittedBox(child: Text('Acer Predator Helios 300',style: TextStyle(color: AppColor.white,fontSize: 10.sp),)),
                                    ],
                                  ),
                                )
                            ),
                            separatorBuilder:(context, index) => const SizedBox(width: 30,),
                            itemCount: 2,
                            scrollDirection: Axis.horizontal,
                            //To build this I usually use carousal slider but I did it in a horizontal list to avoid using Packages
                          ),
                        ),
                      ),
                      const SizedBox(height: 10,),
                      const ChoiceChipsList(),
                      const SizedBox(height: 10,),
                      StaggeredGrid.count(
                          crossAxisCount: 2,
                          mainAxisSpacing: 20,
                          crossAxisSpacing: 20,
                          children:[
                            StaggeredGridTile.fit(
                              crossAxisCellCount: 1,
                              child: SizedBox(
                                height: MediaQuery.of(context).size.height / 10,
                                child:  Text(
                                  "Recommended \nFor You",
                                  softWrap: false,
                                  maxLines: 2,
                                  style: TextStyle(
                                    fontSize: 15.sp
                                  ),
                                ),
                              ),
                            ),
                            for (var product in GetProductsCubit.get(context).productsResponseModel!.data)
                              BuildProductCardWidget(
                                productsDataModel: product,
                              ),
                          ]
                      )
                    ],
                  ),
                ),
              ),
            ),
          ):
          const Scaffold(body:Center(child: CircularProgressIndicator()),);
        },
        listener: (BuildContext context, Object? state) {  },

      ),
    );
  }
}
