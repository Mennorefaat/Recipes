import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import '../../../colors/recipe_colors.dart';
import '../../../navigators/navigators.dart';
import '../../navigation_bar/page/main_screen.dart';

class Payment extends StatefulWidget {
  const Payment({super.key});

  @override
  State<Payment> createState() => _PaymentState();
}

class _PaymentState extends State<Payment> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //backgroundColor: Colors.white,
      appBar: AppBar(
       // backgroundColor: Colors.white,
        title: const Text('Checkout',
          style: TextStyle(
            fontWeight: FontWeight.bold,
              fontSize: 30,
             // color: Colors.black
          ),),
        centerTitle: true,
        elevation: 0,
        leading: IconButton(
          onPressed: (){
           pop(context, const MainScreen());
          },
          icon: const Icon(Icons.arrow_back,
           // color: Colors.black,
          ),
        ),
      ),
      body: Container(
        margin: const EdgeInsets.all(10),
        padding: const EdgeInsets.all(10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text('Ship to',
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                      //color: Colors.black
                  ),),
                const SizedBox(width: 10,),
                const Text('11 Bannister Ct, Poquoson \nVirginia(VA), USA, 23662',
                  style: TextStyle(
                      fontSize: 15,
                      color: Colors.grey,
                  fontWeight: FontWeight.bold),),
                const SizedBox(width: 10,),
                IconButton(onPressed: (){},
                    icon: const Icon(
                      Icons.arrow_forward,
                      //color: Colors.black,
                      size: 20,)),
              ],
            ),
            const SizedBox(height: 15,),
            Divider(
              color: Colors.grey[200],
              thickness: 1,
              height: 1,
            ),
            const SizedBox(height: 15,),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text('Delivery',
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                     // color: Colors.black
                  ),),
                const SizedBox(width: 10,),
                const Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Address delivery',
                      style: TextStyle(
                          fontSize: 15,
                          color: Colors.grey,
                          fontWeight: FontWeight.bold),),

                    Text('Delivery by Mon, Oct 30',
                      style: TextStyle(
                          fontSize: 15,
                          color: Colors.grey,
                          ),),
                  ],
                ),
                const SizedBox(width: 10,),
                IconButton(onPressed: (){},
                    icon: const Icon(
                      Icons.arrow_forward,
                      //color: Colors.black,
                      size: 20,)),
              ],
            ),
            const SizedBox(height: 15),
            Divider(
              color: Colors.grey[200],
              thickness: 1,
              height: 1,
            ),
            const SizedBox(height: 15,),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text('Payment',
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                      //color: Colors.black
                  ),),
                const SizedBox(width: 10,),
                Image.asset("assets/images/visa.png",width: 20.w,height: 8.h,),
                const SizedBox(width: 10,),
                IconButton(onPressed: (){},
                    icon: const Icon(
                      Icons.arrow_forward,
                     // color: Colors.black,
                        size: 20,)),
              ],
            ),
            const SizedBox(height: 15,),
            Divider(
              color: Colors.grey[200],
              thickness: 1,
              height: 1,
            ),
            const SizedBox(height: 15,),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text('Promos',
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                      //color: Colors.black
                  ),),
                const SizedBox(width: 10,),
                const Text('Add Promo Code',
                  style: TextStyle(
                      fontSize: 15,
                      color: Colors.grey,
                      ),),
                const SizedBox(width: 10,),
                IconButton(onPressed: (){},
                    icon: const Icon(
                      Icons.arrow_forward,
                     // color: Colors.black,
                      size: 20,)),
              ],
            ),
            const SizedBox(height: 15,),
            Divider(
              color: Colors.grey[200],
              thickness: 1,
              height: 1,
            ),
            const Spacer(),
             Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('Subtotal:',style: TextStyle(
                    fontSize: 16.sp,
                    color: Colors.grey,
                fontWeight: FontWeight.bold),),
                Text('125,00',style: TextStyle(
                    color: Colors.grey,
                    fontSize: 16.sp,
                fontWeight: FontWeight.bold),),
              ],
            ),
            const SizedBox(height: 15,),
             Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('Est. Tax:',style: TextStyle(
                  fontSize: 16.sp,
                    color: Colors.grey,
                    fontWeight: FontWeight.bold),),
                Text('Not Included',style: TextStyle(
                    fontSize: 16.sp,
                    color: Colors.grey,
                    fontWeight: FontWeight.bold),),
              ],
            ),
            const SizedBox(height: 15,),
            const Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('Total:',style: TextStyle(
                    //color: Colors.black,
                    fontSize: 20,
                    fontWeight: FontWeight.bold),),
                Text('125,00',style: TextStyle(
                   // color: Colors.black,
                    fontSize: 20,
                    fontWeight: FontWeight.bold),),
              ],
            ),
            const SizedBox(height: 15,),

            SizedBox(
              width: double.infinity,
              height:6.h,
              child: ElevatedButton(
                onPressed: () {
                  pop(context,const MainScreen() );
                },
                style: ElevatedButton.styleFrom(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15.sp),
                  ),
                  backgroundColor: RecipesColor.firstColor,
                ),
                child: const Text ('Done',style: TextStyle(color: Colors.black,fontSize: 20,fontWeight: FontWeight.bold)),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
