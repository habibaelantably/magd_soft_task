import 'package:flutter/material.dart';
import 'package:magdsoft_flutter_structure/data/models/product_data_model.dart';

import 'package:magdsoft_flutter_structure/presentation/screens/help/help_screen.dart';
import 'package:magdsoft_flutter_structure/presentation/screens/home_layout/home_layout.dart';
import 'package:magdsoft_flutter_structure/presentation/screens/login/login_screen.dart';
import 'package:magdsoft_flutter_structure/presentation/screens/shared/splash_screen.dart';
import '../screens/otp/otp_screen.dart';
import '../screens/product_screen/product_screen.dart';
import '../widget/shared_widgets/slider_transition.dart';

class Routes{
  static const String initialRoute = '/';
  static const String loginScreen = '/loginScreen';
  static const String otpScreen = '/otpScreen';
  static const String homeLayout = '/homeLayout';
  static const String productScreen = '/productScreen';
  static const String helpScreen = '/helpScreen';

}
class AppRouter {
  Route? onGenerateRoute(RouteSettings settings) {
    Map<String, dynamic>?   routeArguments;
    if(settings.arguments!=null){
      routeArguments=settings.arguments as Map<String,dynamic>;
    }

    switch (settings.name) {
      case (Routes.initialRoute):
        return MaterialPageRoute(builder: (context) => const SplashScreen());
      case (Routes.loginScreen):
        return MaterialPageRoute(builder: (context) => LoginScreen());
      case (Routes.otpScreen):
        return SlideRoute(page:OTPScreen(phone: routeArguments!['phone'],), settings: settings);
      case (Routes.homeLayout):
        return MaterialPageRoute(builder: (context) => HomeLayout());
      case (Routes.productScreen):
        return MaterialPageRoute(builder: (context) =>
            ProductScreen(productsDataModel:ProductsDataModel.fromJson(routeArguments!)));
      case (Routes.helpScreen):
        return MaterialPageRoute(builder: (context) => const HelpScreen());
      default:
        return null;
    }
  }
}

