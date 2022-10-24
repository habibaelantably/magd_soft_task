import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:magdsoft_flutter_structure/business_logic/OTP_cubit/OTP_cubit.dart';
import 'package:magdsoft_flutter_structure/business_logic/OTP_cubit/OTP_states.dart';
import 'package:magdsoft_flutter_structure/presentation/styles/colors.dart';
import 'package:magdsoft_flutter_structure/presentation/widget/shared_widgets/toast.dart';
import 'package:sizer/sizer.dart';
import '../../../data/data_providers/local/cache_helper.dart';
import '../../router/app_router.dart';
import '../../widget/shared_widgets/default_button.dart';
import '../../widget/otp_screen_widgets/otp_field.dart';

class OTPScreen extends StatelessWidget
{
  final TextEditingController firstController=TextEditingController();
  final TextEditingController secondController=TextEditingController();
  final TextEditingController thirdController=TextEditingController();
  final TextEditingController fourthController=TextEditingController();

  String? otp;
  // OTPResponseModel? otpResponseModel;

   final formKey = GlobalKey<FormState>();


  OTPScreen({Key? key,required this.phone}) : super(key: key);
  final String phone;

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body:SingleChildScrollView(
        child: Container(
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
          child: BlocProvider(
            create: (BuildContext context)=>OTPCubit(),
            child: BlocConsumer<OTPCubit,OTPStates>(
              builder: (BuildContext context, Object? state) {
                return Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 45.0),
                  child: Form(
                    key: formKey,
                    child: Column(
                      children: [
                        SizedBox(height:MediaQuery.of(context).size.height/14),
                        Text('Verify Phone',style: TextStyle(color:AppColor.white,fontSize: 25.sp),),
                        SizedBox(height:MediaQuery.of(context).size.height/8),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children:  [
                            OTPTextField(firstController, true),
                            OTPTextField(secondController, true),
                            OTPTextField(thirdController, true),
                            OTPTextField(fourthController, true),
                          ],
                        ),
                        SizedBox(height:MediaQuery.of(context).size.height/6),
                        Text('Resend Code',style: TextStyle(color: Colors.blue,fontSize: 18.sp),),
                        SizedBox(height:MediaQuery.of(context).size.height/10),
                        DefaultButton(
                          function: ()async{
                            otp=firstController.text+secondController.text+thirdController.text+fourthController.text;
                            if(otp!.isNotEmpty && otp!.length==4){
                            OTPCubit.get(context).verifyOTP(code: otp!, phone: phone);
                            }else{
                              showToast(text: 'please complete OTP Code',toastColor: Colors.red);
                            }
                          },
                          isUpperCase: false,
                          text: 'verify ',
                          height: 50,
                          width: MediaQuery.of(context).size.width,
                          radius: 20,
                        )
                      ],
                    ),
                  ),
                );
              },
              listener: (BuildContext context, state) {
                if(state is OTPSuccessState){
                  showToast(text:state.otpResponseModel.message!,toastColor: Colors.green);
                  CacheHelper.saveDataSharedPreference(key: 'UserLoggedIn', value: true);
                     Navigator.pushNamedAndRemoveUntil(context, Routes.homeLayout,(route) => false);

                }else if(state is OTPErrorState)
                {
                  showToast(text:state.error.toString(),toastColor: Colors.red);
                }
              },
            ),
          ),
        ),
      ),
    );
  }

}