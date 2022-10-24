import 'package:flutter/material.dart';

class DefaultFormField extends StatelessWidget {
  const DefaultFormField({
    Key? key,
    required this.controller,
    required this.type,
    this.hintText,
    this.fillColor,
    required this.validator,
    this.suffixIcon,
    required this.haveSuffixIcon,
  }) : super(key: key);
  final TextEditingController controller;
  final TextInputType type;
  final String? hintText;
  final Color? fillColor;
  final Function validator;
  final IconData? suffixIcon;
  final bool haveSuffixIcon;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height/14,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10.0),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.2),
            spreadRadius: 5,
            blurRadius: 3,
            // offset: const Offset(0, 2), // changes position of shadow
          ),
        ]
      ),
      child: TextFormField(
        controller: controller,
        cursorColor: Colors.blue,
        keyboardType: type,
        decoration: InputDecoration(
          border:  OutlineInputBorder(
            borderSide: BorderSide.none,
            borderRadius: BorderRadius.circular(10.0)
          ),
          filled: true,
          fillColor: Colors.white,
          hintText: hintText,
          hintStyle: const TextStyle(
              color: Colors.grey,
              fontSize: 12,),
          suffixIcon: haveSuffixIcon==true?Icon(
            suffixIcon,
          ):null,
        ),
        validator: (String? value) {
          return validator(value);
        },
        style: const TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.w400,
            fontSize: 15
        ),
        maxLines: 1,
      ),
    );
  }
}
