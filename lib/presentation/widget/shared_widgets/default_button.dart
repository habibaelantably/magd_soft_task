
import 'package:flutter/material.dart';

class DefaultButton extends StatelessWidget
{
  DefaultButton({
    Key? key,
    this.width,
    this.height,
    this.radius,
    required this.isUpperCase,
    required this.text,
    required this.function,

  }) : super(key: key);
  final double? width;
  final double? height;
  final double? radius ;
  final bool isUpperCase ;
  final VoidCallback  function;
  final String text;

  @override
  Widget build(BuildContext context) {
    return  Container(
      height: height,
      width: width,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(radius!),
        gradient: LinearGradient(
          colors: [
            Colors.blue,
            Colors.blue.withOpacity(0.8),
            Colors.blue.withOpacity(0.4)
          ]
        )
      ),

      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          tapTargetSize: MaterialTapTargetSize.shrinkWrap,
          primary: Colors.transparent,
          shadowColor: Colors.transparent,
          elevation: 0
        ),
        onPressed: function,

        child: FittedBox(
          child: Text(
            isUpperCase ? text.toUpperCase() : text,
            style: const TextStyle(
                fontSize: 18.0,
                color: Colors.white),
          ),
        ),
      ),
    );
  }

}