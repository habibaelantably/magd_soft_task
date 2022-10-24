import 'package:flutter/material.dart';

class ViewStoreItem extends StatelessWidget
{
  const ViewStoreItem({Key? key,required this.storeName}) : super(key: key);
 final  String storeName;

  @override
  Widget build(BuildContext context) {
    return  Container(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height/12,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10.0),
        boxShadow: [BoxShadow(
          color: Colors.grey.withOpacity(0.5),
          spreadRadius: 2,
          blurRadius: 3,
          offset: const Offset(0, 3), // changes position of shadow
        ),],
        color: Colors.white,
      ),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          children: [
            Container(
              width: MediaQuery.of(context).size.width/8,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15.0),
                boxShadow: [BoxShadow(
                  color: Colors.grey.withOpacity(0.5),
                  spreadRadius: 2,
                  blurRadius: 3,
                  offset: const Offset(0, 2), // changes position of shadow
                ),],
                color: Colors.white,
              ),
              child:Padding(
                padding: const EdgeInsets.all(8.0),
                child: Image.asset('assets/images/acerLogo.png'),
              ) ,
            ),
            const SizedBox(width: 10),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children:  [
                FittedBox(child: Text(storeName)),
                const SizedBox(height: 6,),
                const FittedBox(child: Text('View Store',style: TextStyle(color: Colors.grey,fontSize: 10.0),)),
              ],
            ),
            const Spacer(),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  width: MediaQuery.of(context).size.width/12,
                  height: MediaQuery.of(context).size.height/26,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5.0),
                    boxShadow: [BoxShadow(
                      color: Colors.grey.withOpacity(0.5),
                      spreadRadius: 2,
                      blurRadius: 3,
                      offset: const Offset(0, 2), // changes position of shadow
                    ),],
                    color: Colors.white,
                  ),
                  child:const Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Icon(Icons.arrow_forward_ios_outlined,color: Colors.blue,size: 14,)
                  ) ,
                ),
              ],
            ),


          ],
        ),
      ),
    );
  }

}