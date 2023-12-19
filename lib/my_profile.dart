import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import 'Model/category_product.dart';
import 'colors/recipe_colors.dart';

class MyProfile extends StatefulWidget {
  const MyProfile({super.key});

  @override
  State<MyProfile> createState() => _MyProfileState();
}

class _MyProfileState extends State<MyProfile> {

  List<CategoryProduct> categoryProduct=[
    CategoryProduct('Cheese Pizza', '', '', '25000 EGP', 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTd3OdttwDOTezV_h-qSf0SH3HeIaScZGp5og&usqp=CAU',true),
    CategoryProduct('Burger', '45 %', '10230 EGP', '5599 EGP','https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTjr_mHTGKmVilBiLWCHtxnpSG0GYEARaMaJA&usqp=CAU',false),
    CategoryProduct('Pasta', '8 %', '12499 EGP', '11499', 'https://i5.walmartimages.com/seo/SAMSUNG-65-Class-Curved-4K-2160P-Ultra-HD-Smart-LED-TV-UN65MU6500FXZA_f18ae77b-ccbb-4d31-9b90-577bd770e1ed_3.dfaaa48e38496b4c3b9ef8116cd36866.jpeg',false),
    CategoryProduct('Apple ', '', '', '44500 EGP', 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRHNQEZDCM-3RJ0tjMlZH0oZYCs5O8pqO4muw&usqp=CAU',true),
    CategoryProduct('salad', '6 %', '35000 EGP', '32860 EGP', 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRsYLJB04kLq-pEfMVY4gYiXhr2BiP36plJmA&usqp=CAU',false),
    CategoryProduct('meat', '', '', '530', 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSeboeQ8ddboCpljMoy2R2jjg_O4fYpScu3rA&usqp=CAU',true),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text('My Profile',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 25),),
        actions: [
          IconButton(onPressed: (){}, icon: Icon(Icons.settings_outlined,size: 35,color: Colors.grey[700],),)
        ],
        elevation: 0,
        backgroundColor: Colors.white,
      ),
      body: Stack(
        children: [
          Container(
            padding: const EdgeInsets.all(15),
            color: Colors.grey[100],
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
                        child: Image.asset('assets/image/potato.jpeg',
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
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(23.sp),
                    topRight: Radius.circular(23.sp),
                  )
              ),
              child: Column(
                children: [
                  SizedBox(
                    child: ListView.builder(
                        shrinkWrap: true,
                        physics:  const NeverScrollableScrollPhysics(),
                        itemCount:  categoryProduct.length,
                        scrollDirection: Axis.vertical,
                        itemBuilder: (context, index) {
                          return Container(
                            margin: EdgeInsets.all(10.sp),
                            padding: EdgeInsets.all(12.sp),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  children: [
                                    ClipRRect(
                                      borderRadius: BorderRadius.circular(15.sp),
                                      child: Image.network(
                                        categoryProduct[index].image,
                                        fit: BoxFit.cover,
                                        height: 50,
                                        width: 50,
                                      ), ),
                                    const SizedBox(width: 10,),
                                    Expanded(child: Text(categoryProduct[index].name,style: const TextStyle(fontWeight: FontWeight.bold,fontSize: 20),)),
                                    IconButton(onPressed: (){}, icon: const Icon(Icons.arrow_forward_ios_outlined,size: 18,))
                                  ],
                                ),
                              ],
                            ),
                          );

                        }
                    ),
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
