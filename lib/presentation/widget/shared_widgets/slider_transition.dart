import 'package:flutter/material.dart';

class SlideRoute extends PageRouteBuilder {
  final Widget page;
  @override
  final RouteSettings settings;
  SlideRoute({required this.page, required this.settings})
      : super(
    pageBuilder: (
         context,
         animation,
         secondaryAnimation,
        ) => page,
    settings: settings,
    transitionsBuilder: (
         context,
         animation,
         secondaryAnimation,
         child,
        ) => SlideTransition(
          position: Tween<Offset>(
            begin: const Offset(1,0),
            end: Offset.zero,
          ).animate(animation),
          child:child,
        ),
  );
}