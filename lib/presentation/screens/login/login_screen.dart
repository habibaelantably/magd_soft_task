
import 'package:buildcondition/buildcondition.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:magdsoft_flutter_structure/business_logic/verify_phone_cubit/verify_phone_cubit.dart';
import 'package:magdsoft_flutter_structure/business_logic/verify_phone_cubit/verify_phone_states.dart';
import 'package:magdsoft_flutter_structure/presentation/router/app_router.dart';
import 'package:magdsoft_flutter_structure/presentation/styles/colors.dart';
import 'package:magdsoft_flutter_structure/presentation/widget/shared_widgets/toast.dart';
import 'package:sizer/sizer.dart';

import '../../widget/shared_widgets/default_button.dart';
import '../../widget/shared_widgets/default_form_field.dart';

class LoginScreen extends StatelessWidget
{
   LoginScreen({Key? key}) : super(key: key);

  final nameController = TextEditingController();
  final phoneController = TextEditingController();


   var formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: Stack(
          children: [
            SizedBox(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height/2.5,
              child: Image.asset('assets/images/welcome.png',
                fit: BoxFit.cover,
              ),
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(height: MediaQuery.of(context).size.height/3,),
                Expanded(
                  child: Container(
                    decoration: const BoxDecoration(
                      borderRadius: BorderRadius.only(topLeft: Radius.circular(45.0),topRight: Radius.circular(45.0)),
                      color:AppColor.white,
                    ),
                  ),
                ),
              ],
            ),
            SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.only(top:0.0,left: 35,right: 35),
                child: Column(
                  children: [
                    SizedBox(height: MediaQuery.of(context).size.height/5,),
                    Center(
                      child: Container(
                        height: MediaQuery.of(context).size.height/2.4,
                        width: MediaQuery.of(context).size.width,
                        decoration: BoxDecoration(
                          color:AppColor.white,
                          borderRadius: BorderRadius.circular(30.0),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey.withOpacity(0.5),
                              spreadRadius: 3,
                              blurRadius: 4,
                              offset: const Offset(0, 3), // changes position of shadow
                            ),
                          ],
                        ),
                        child: BlocProvider(
                          create: (BuildContext context) =>VerifyPhoneCubit(),
                          child: BlocConsumer<VerifyPhoneCubit,VerifyPhoneStates>(
                            builder: (BuildContext context, state) {
                              return Center(
                                child: Padding(
                                  padding: const EdgeInsets.only(top: 20.0,left: 15.0,right: 15.0),
                                  child: Form(
                                    key: formKey,
                                    child: Column(
                                      children:  [
                                        Text('Welcome',style: TextStyle(color: Colors.black,fontSize: 20.sp),),
                                        const SizedBox(height:10.0),
                                        Container(
                                          color:AppColor.mainColor,
                                          width: MediaQuery.of(context).size.width/3,
                                          height: 5.0,
                                        ),
                                        const SizedBox(height:25.0),
                                        DefaultFormField(
                                          controller: nameController,
                                          type: TextInputType.name,
                                          hintText: 'Enter Your Full Name',
                                          validator: (value) {
                                            if (value!.isEmpty) {
                                              return 'please enter your name';
                                            }
                                            return null;
                                          },
                                          haveSuffixIcon: false,
                                        ),
                                        const SizedBox(height: 18,),
                                        DefaultFormField(
                                          controller: phoneController,
                                          type: TextInputType.phone,
                                          hintText: 'Enter Your Phone number',
                                          validator: (value) {
                                            if (value!.isEmpty) {
                                              return 'please enter your phone number';
                                            }
                                            return null;
                                          },
                                          haveSuffixIcon: false,
                                        ),
                                        SizedBox(height: MediaQuery.of(context).size.height/15,),
                                        BuildCondition(
                                          condition: state is! VerifyPhoneLoadingState,
                                          builder: (context) => DefaultButton(
                                            function: (){
                                              if(formKey.currentState!=null && formKey.currentState!.validate()){
                                                print(formKey.currentState!);
                                                VerifyPhoneCubit.get(context).verifyPhone(
                                                    name: nameController.text,
                                                    phone: phoneController.text);}
                                            },
                                            isUpperCase: false,
                                            text: 'Login',
                                            height: 50,
                                            width: MediaQuery.of(context).size.width,
                                            radius: 20,
                                          ),
                                          fallback: (context) =>
                                          const Center(child: CircularProgressIndicator()),
                                        ),

                                      ],
                                    ),
                                  ),
                                ),
                              );
                            },
                            listener: (BuildContext context, Object? state) {
                              if(state is VerifyPhoneSuccessState)
                              {
                                showToast(text: state.verifyPhoneResponseModel.message!, toastColor: Colors.green);
                                Navigator.pushNamed(context,Routes.otpScreen,arguments: {'phone':phoneController.text});
                              }else if(state is VerifyPhoneErrorState){
                                showToast(text: state.error, toastColor: Colors.red);
                              }
                            },
                          ),
                        ),
                      ),
                    ),
                    Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Expanded(
                              child: Container(
                                width: MediaQuery.of(context).size.width,
                                height: 1,
                                color: AppColor.mainColor,
                              ),
                            ),
                            const Padding(
                              padding: EdgeInsets.symmetric(horizontal: 8.0),
                              child: FittedBox(child: Text('OR',style: TextStyle(color: AppColor.mainColor),)),
                            ),
                            Expanded(
                              child: Container(
                                width: MediaQuery.of(context).size.width,
                                height: 1,
                                color: AppColor.mainColor,
                              ),
                            ),
                            SizedBox(height: MediaQuery.of(context).size.height/5,),
                          ],
                        ),

                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children:   [
                            Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(100) ,
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.grey.withOpacity(0.5),
                                    spreadRadius: 3,
                                    blurRadius: 4,
                                    offset: const Offset(0, 3), // changes position of shadow
                                  ),
                                ],
                              ),
                              child: CircleAvatar(
                                radius: 25,
                                backgroundColor: AppColor.white,
                                child: Image.asset('assets/images/facebook.png',width: 40,height: 40,),
                              ),
                            ),
                            const SizedBox(width: 15,),
                            Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(100) ,
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.grey.withOpacity(0.5),
                                    spreadRadius: 3,
                                    blurRadius: 4,
                                    offset: const Offset(0, 3), // changes position of shadow
                                  ),
                                ],
                              ),
                              child: CircleAvatar(
                                radius: 25,
                                backgroundColor: AppColor.white,
                                child: Image.asset('assets/images/google.png',width: 40,height: 40,),
                              ),
                            ),
                            const SizedBox(width: 15,),
                            Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(100) ,
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.grey.withOpacity(0.5),
                                    spreadRadius: 3,
                                    blurRadius: 4,
                                    offset: const Offset(0, 3), // changes position of shadow
                                  ),
                                ],
                              ),
                              child: CircleAvatar(
                                radius: 25,
                                backgroundColor: AppColor.white,
                                child: Image.asset('assets/images/apple.png',width: 40,height: 40,),
                              ),
                            ),

                          ],
                        )
                      ],
                    ),
                  ],
                ),
              ),
            )
          ],
        ),

    );
  }

}