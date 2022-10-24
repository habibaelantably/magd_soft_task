
import 'package:flutter/material.dart';
import 'package:magdsoft_flutter_structure/data/models/product_data_model.dart';
import 'package:magdsoft_flutter_structure/presentation/screens/product_layout/overView/over_view.dart';
import 'package:magdsoft_flutter_structure/presentation/screens/product_layout/review/review.dart';
import 'package:magdsoft_flutter_structure/presentation/screens/product_layout/specification/specification.dart';
import 'package:magdsoft_flutter_structure/presentation/styles/colors.dart';
import 'package:magdsoft_flutter_structure/presentation/widget/product_screen_widget/circular_indicator.dart';
import 'package:sizer/sizer.dart';

class ProductLayout extends StatefulWidget{
  const ProductLayout({Key? key,required this.productsDataModel}) : super(key: key);
  final ProductsDataModel productsDataModel;

  @override
  State<ProductLayout> createState() => _ProductLayoutState(productsDataModel: productsDataModel);
}

class _ProductLayoutState extends State<ProductLayout> with TickerProviderStateMixin{
  final ProductsDataModel productsDataModel;

   _ProductLayoutState({required this.productsDataModel});
  @override
  Widget build(BuildContext context) {
    TabController tabController =TabController(length: 3, vsync: this);
    return Column(
        children: [
          SizedBox(
            height:MediaQuery.of(context).size.height/12,
            child: TabBar(
              controller: tabController,
              indicatorColor: AppColor.mainColor,
              indicator:  CircleTabIndicator(color: AppColor.mainColor, radius: 5,),
              tabs:   <Widget>[
                Text('OverView',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      fontSize: 9.sp,
                      color: Colors.grey
                  ),
                ),
                Text('specification',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      fontSize: 9.sp,
                      color: Colors.grey
                  ),
                ),
                Text('Review',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      fontSize: 9.sp,
                      color: Colors.grey
                  ),
                ),
              ],

            ),
          ),
          SizedBox(
            width: MediaQuery.of(context).size.width,
            height:MediaQuery.of(context).size.height/1,
            child: TabBarView(
              controller: tabController,
              children:  <Widget> [
                OverView(productsDataModel: productsDataModel),
                Specification(productsDataModel: productsDataModel),
                Review(productsDataModel: productsDataModel),
              ],
            ),
          )
        ],
    );
  }
}