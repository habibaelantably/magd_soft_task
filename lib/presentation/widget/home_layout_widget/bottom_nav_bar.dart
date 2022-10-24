import 'package:flutter/material.dart';
import 'package:magdsoft_flutter_structure/presentation/router/app_router.dart';

class BottomNavBar extends StatelessWidget {
  const BottomNavBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context)
  {
    return BottomAppBar(
      shape: const CircularNotchedRectangle(),
      notchMargin: 10,
      child: SizedBox(
        height: 60,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                MaterialButton(
                  onPressed: (){},
                  minWidth: 40,
                  child: const Icon(
                    Icons.logout,
                    color: Colors.grey,
                  ),),
                MaterialButton(
                  onPressed: (){},
                  minWidth: 40,
                  child: const Icon(
                    Icons.favorite,
                    color: Colors.grey,
                  ),),
              ],
            ),
            //right side of container
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                MaterialButton(
                  onPressed: (){},
                  minWidth: 40,
                  child: const Icon(
                    Icons.notifications_active,
                    color: Colors.grey,
                  ),),
                MaterialButton(
                  onPressed: (){
                    Navigator.pushNamed(context, Routes.helpScreen);
                  },
                  minWidth: 40,
                  child: const Icon(
                    Icons.settings,
                    color: Colors.grey,
                  ),),
              ],
            ),
          ],

        ),
      ),
    );
  }

}