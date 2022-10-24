

import 'package:flutter/material.dart';
import 'package:magdsoft_flutter_structure/data/models/product_data_model.dart';

class Specification extends StatelessWidget
{
  const Specification({Key? key,required this.productsDataModel}) : super(key: key);
  final ProductsDataModel productsDataModel;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          children:  [
            Text(productsDataModel.description)
          ],
        ),
      ),
    );
  }

}