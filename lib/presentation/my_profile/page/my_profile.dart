import 'package:flutter/material.dart';
import 'package:recipes/navigators/navigators.dart';
import 'package:recipes/presentation/payment/page/payment.dart';
import 'package:recipes/presentation/watched_recipes/page/watched_recipes.dart';
import 'package:recipes/presentation/weekly_list/page/weekly_list.dart';
import 'package:recipes/presentation/wishlist/page/wishlist.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import '../../../colors/recipe_colors.dart';
import '../../my_fridge/page/my_fridge.dart';
import '../../side menu/page/side_menu.dart';

class MyProfile extends StatefulWidget {
  const MyProfile({super.key});

  @override
  State<MyProfile> createState() => _MyProfileState();
}

class _MyProfileState extends State<MyProfile> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
     // backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text('My Profile',
          style: TextStyle(fontWeight: FontWeight.bold,fontSize: 25),),
        actions: [
          InkWell(
            onTap:()=>push(context, const SideMenu()) ,
              child: Image.asset("assets/images/settings.png")),
           ],
        elevation: 0,
      ),
      body: Stack(
        children: [
          Container(
            padding: const EdgeInsets.all(15),
            color: Theme.of(context).brightness == Brightness.light
            ?Colors.grey[100]
            :Colors.black,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Stack(
                  alignment:Alignment.center,
                  children: [
                    const CircleAvatar(
                      backgroundColor: Colors.white,
                      radius: 70,
                    ),
                    CircleAvatar(
                      radius: 60,
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(30.sp),
                        child: Image.asset('assets/images/potato.jpeg',
                          width: 130,
                          height: 130,
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  ],
                ),
                const Text('Evie-Mai Reese',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 30),),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(Icons.location_on_outlined,color: RecipesColor.firstColor,),
                    Text('New York, United States',style: TextStyle(color: RecipesColor.firstColor,fontWeight: FontWeight.bold),),
                  ],
                ),
                const SizedBox(height: 15,),
                const Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Column(
                      children: [
                        Text('45',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 25),),
                        Text('Following',style: TextStyle(color: Colors.grey),),
                      ],
                    ),
                    VerticalDivider(
                      color: Colors.black,
                      thickness: 2,
                    ),
                    Column(
                      children: [
                        Text('1.32k',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 25),),
                        Text('Followers',style: TextStyle(color: Colors.grey),),
                      ],
                    )
                  ],
                )
              ],
            ),
          ),
          SingleChildScrollView(
            child: Container(
              margin: EdgeInsets.only(top: 70.sp),
              padding:  EdgeInsets.all(20.sp),
              width: double.infinity,
              decoration:  BoxDecoration(
                  color: Theme.of(context).brightness == Brightness.light
                      ?Colors.white
                      :Colors.grey[900],
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(23.sp),
                    topRight: Radius.circular(23.sp),
                  )
              ),
              child: InkWell(
               // onTap: ()=>push(context, const WatchedRecipes() ),
                child: Column(
                  children: [
                    Row(
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.circular(15.sp),
                          child: Image.asset('assets/images/watched.png',
                            width: 15.w,
                            height:8.h,),
                        ),
                        const SizedBox(width: 10,),
                        Expanded(child: Text('Watched recipes',style: Theme.of(context).textTheme.titleMedium),),
                        IconButton(
                        onPressed: (){},
                            icon: const Icon(Icons.arrow_forward_ios_outlined,size: 18,))
                      ],
                    ),
                    const SizedBox(height: 15,),
                    InkWell(
                      onTap: ()=>push(context, const WeeklyList() ),
                      child: Row(
                        children: [
                          ClipRRect(
                            borderRadius: BorderRadius.circular(15.sp),
                            child: Image.asset('assets/images/weekly list.png',
                              width: 15.w,
                              height:8.h,),
                          ),
                          const SizedBox(width: 10,),
                           Expanded(child: Text('Weekly list',style: Theme.of(context).textTheme.titleMedium),),
                          IconButton(onPressed: (){},
                              icon: const Icon(Icons.arrow_forward_ios_outlined,size: 18,))
                        ],
                      ),
                    ),
                    const SizedBox(height: 15,),
                    InkWell(
                      onTap: ()=>push(context, const MyFridge() ),
                      child: Row(
                        children: [
                          ClipRRect(
                            borderRadius: BorderRadius.circular(15.sp),
                            child: Image.asset('assets/images/fridge.png',
                              width: 15.w,
                              height:8.h,),
                          ),
                          const SizedBox(width: 10,),
                          Expanded(child: Text('My fridge',style: Theme.of(context).textTheme.titleMedium),),
                          IconButton(
                              onPressed: (){
                            push(context, const MyFridge() );
                          },
                              icon: const Icon(Icons.arrow_forward_ios_outlined,size: 18,))
                        ],
                      ),
                    ),
                    const SizedBox(height: 15,),
                    InkWell(
                      //onTap: ()=>push(context, const WishList() ),
                      child: Row(
                        children: [
                          ClipRRect(
                            borderRadius: BorderRadius.circular(15.sp),
                            child: Image.asset('assets/images/wishlist.png',
                              width: 15.w,
                              height:8.h,),
                          ),
                          const SizedBox(width: 10,),
                          Expanded(child: Text('Wishlist',style: Theme.of(context).textTheme.titleMedium),),
                          IconButton(onPressed: (){
                           // push(context,const WishList() );
                          },
                              icon: const Icon(Icons.arrow_forward_ios_outlined,size: 18,))
                        ],
                      ),
                    ),
                    const SizedBox(height: 15,),
                    InkWell(
                      onTap: (){},
                      child: Row(
                        children: [
                          ClipRRect(
                            borderRadius: BorderRadius.circular(15.sp),
                            child: Image.asset('assets/images/gifts.png',
                              width: 15.w,
                              height:8.h,),
                          ),
                          const SizedBox(width: 10,),
                          Expanded(child: Text('Gifts & PromoCodes',style: Theme.of(context).textTheme.titleMedium),),
                          IconButton(onPressed: (){
                          },
                              icon: const Icon(Icons.arrow_forward_ios_outlined,size: 18,))
                        ],
                      ),
                    ),
                    const SizedBox(height: 15,),
                    InkWell(
                      onTap: ()=>push(context, const Payment()),
                      child: Row(
                        children: [
                          ClipRRect(
                            borderRadius: BorderRadius.circular(15.sp),
                            child: Image.asset('assets/images/payment.png',
                              width: 15.w,
                              height:8.h,),
                          ),
                          const SizedBox(width: 10,),
                          Expanded(child: Text('Payment method ',style: Theme.of(context).textTheme.titleMedium),),
                          IconButton(onPressed: (){
                            push(context, const Payment());
                          },
                              icon: const Icon(Icons.arrow_forward_ios_outlined,size: 18,))
                        ],
                      ),
                    ),
                    SizedBox(height: 10.h,)
                  ],
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
