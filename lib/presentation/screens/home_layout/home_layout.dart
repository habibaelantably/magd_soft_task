import 'package:flutter/material.dart';
import 'package:magdsoft_flutter_structure/data/models/product_data_model.dart';
import 'package:magdsoft_flutter_structure/presentation/screens/home_layout/home_screen/home_screen.dart';

import '../../widget/home_layout_widget/bottom_nav_bar.dart';

class HomeLayout extends StatelessWidget
{
   HomeLayout({Key? key}) : super(key: key);

   ProductsDataModel? productsDataModel;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.home),
        onPressed: (){},),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: const BottomNavBar(),
      body:  HomeScreen(productsDataModel: productsDataModel,),
    );
  }

}