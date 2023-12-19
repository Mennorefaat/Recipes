import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

import 'Model/category_product.dart';
import 'colors/recipe_colors.dart';

class RecipeDetails extends StatefulWidget {
  const RecipeDetails({super.key});

  @override
  State<RecipeDetails> createState() => _RecipeDetailsState();
}

class _RecipeDetailsState extends State<RecipeDetails> {
  late YoutubePlayerController _controller;
  List<CategoryProduct> categoryProduct=[
    CategoryProduct('Cheese Pizza', '', '', '25000 EGP', 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTd3OdttwDOTezV_h-qSf0SH3HeIaScZGp5og&usqp=CAU',true),
    CategoryProduct('Burger', '45 %', '10230 EGP', '5599 EGP','https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTjr_mHTGKmVilBiLWCHtxnpSG0GYEARaMaJA&usqp=CAU',false),
    CategoryProduct('Pasta', '8 %', '12499 EGP', '11499', 'https://i5.walmartimages.com/seo/SAMSUNG-65-Class-Curved-4K-2160P-Ultra-HD-Smart-LED-TV-UN65MU6500FXZA_f18ae77b-ccbb-4d31-9b90-577bd770e1ed_3.dfaaa48e38496b4c3b9ef8116cd36866.jpeg',false),
    CategoryProduct('Apple ', '', '', '44500 EGP', 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRHNQEZDCM-3RJ0tjMlZH0oZYCs5O8pqO4muw&usqp=CAU',true),
    CategoryProduct('salad', '6 %', '35000 EGP', '32860 EGP', 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRsYLJB04kLq-pEfMVY4gYiXhr2BiP36plJmA&usqp=CAU',false),
    CategoryProduct('meat', '', '', '530', 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSeboeQ8ddboCpljMoy2R2jjg_O4fYpScu3rA&usqp=CAU',true),
  ];
  @override
  void initState() {
    super.initState();
    _controller = YoutubePlayerController(
      initialVideoId: '-BYWbosiYlw',
      flags: const YoutubePlayerFlags(
        autoPlay: true,
        mute: true,
        loop: true,
        enableCaption: true,
      ),
    );}
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
          child:  Stack(
            children: [
              Column(
                children: [
                   YoutubePlayer(
                      controller: _controller,
                      showVideoProgressIndicator: true,
                      progressIndicatorColor: RecipesColor.firstColor,
                      progressColors:ProgressBarColors(
                      playedColor: RecipesColor.firstColor,
                      handleColor: RecipesColor.firstColor,
                  ),
                  onReady: () {
                  _controller.addListener(() {});
                  },
                  ),
                    ],
              ),
                 Container(
                    margin: EdgeInsets.only(top: 57.sp),
                    padding:  EdgeInsets.all(20.sp),
                    width: double.infinity,
                    decoration:  BoxDecoration(
                    color: Colors.grey[100],
                    borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(25.sp),
                    topRight: Radius.circular(25.sp),
                    )
                    ),
                    child:Column(
                     crossAxisAlignment: CrossAxisAlignment.start,
                     children: [
                        Row(
                         mainAxisAlignment: MainAxisAlignment.spaceBetween,
                         children: [
                           const Text('Recipe Name',style: TextStyle(fontSize: 30,fontWeight: FontWeight.bold),),
                           Row(
                             children: [
                               Icon(Icons.star,color: RecipesColor.firstColor,size: 20.sp,),
                               const SizedBox(width: 5,),
                               Text ('4.5',style: TextStyle(color: Colors.black,fontSize: 17.sp,fontWeight: FontWeight.bold),),
                               Container(
                                 margin: const EdgeInsets.all(10),
                                 decoration: BoxDecoration(
                                   color: RecipesColor.firstColor,
                                   borderRadius: BorderRadius.circular(15),
                                 ),
                                 child: IconButton(
                                     onPressed: () {},
                                     icon: const Icon(
                                       Icons.favorite_border, color: Colors.white,)),
                               ),
                             ],
                           ),
                         ],
                       ),
                        Row(
                         children: [
                           const CircleAvatar(
                             radius: 30,
                           ),
                           const SizedBox(width: 10,),
                           const Expanded(
                             child: Column(
                               crossAxisAlignment: CrossAxisAlignment.start,
                               children: [
                                 Text('Heba Magdy',style: TextStyle(color: Colors.black),),
                                 Row(
                                   children: [
                                     Text('4.4M',style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold),),
                                     Text('Followers',style: TextStyle(color: Colors.grey),),
                                   ],
                                 ),
                               ],
                             ),
                           ),
                           ElevatedButton(
                             onPressed: () {},
                             style: ElevatedButton.styleFrom(
                               shape: const StadiumBorder(),
                               backgroundColor: RecipesColor.firstColor,
                             ),
                             child: const Text ('Follow',style: TextStyle(color: Colors.white,fontSize: 20)),
                           ),
                         ],
                       ),
                       const SizedBox(height: 10,),
                        Row(
                         children: [
                           Icon(Icons.access_time_rounded,color: RecipesColor.firstColor,),
                           const Text('10 mins',style: TextStyle(color: Colors.grey),),
                           const SizedBox(width: 10,),

                           Icon(Icons.stacked_bar_chart,color: RecipesColor.firstColor,),
                           const Text('Medium',style: TextStyle(color: Colors.grey),),
                           const SizedBox(width: 10,),

                           Icon(Icons.local_fire_department_outlined,color: RecipesColor.firstColor,),
                           const Text('512 cal',style: TextStyle(color: Colors.grey),),
                           const SizedBox(width: 10,),
                         ],
                       ),
                       const SizedBox(height: 10,),
                       const Text('Description',style: TextStyle(fontSize: 25,fontWeight: FontWeight.bold),),
                       const SizedBox(height: 10,),
                       const Text('Hearty Chicken sausage. fresh, juicy shrimp and asparagus make for a perfect sheet pan dinner.  ',style: TextStyle(color: Colors.grey),),
                       const SizedBox(height: 10,),
                       const Text('Ingredients',style: TextStyle(fontSize: 25,fontWeight: FontWeight.bold),),
                      ingredients(),
                       getStarted(),
                     ],
                   ),
                 )
               ],
          ),
               )
    );
  }

 Widget ingredients() {
    return SizedBox(
      height: 60.h,
      child: ListView.builder(
          physics: const NeverScrollableScrollPhysics(),
          itemCount:  categoryProduct.length,
          scrollDirection: Axis.vertical,
          itemBuilder: (context, index) {
            return Container(
              padding: const EdgeInsets.all(10),
              margin:  EdgeInsets.all( 10.sp),
            decoration:  BoxDecoration(
            color: Colors.white,
              borderRadius: BorderRadius.circular(15),
            ),
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
                      const Text('160 g',style: TextStyle(fontWeight: FontWeight.bold),)
                    ],
                  ),
                ],
              ),
            );

          }
      ),
    );
  }

 Widget getStarted() {
    return Align(
      alignment: Alignment.center,
      child: InkWell(
        onTap: (){},
        child: Container(
          height: 50,
          width: 250,
          decoration:  BoxDecoration(
              color: Colors.white70,
              borderRadius: BorderRadius.circular(30),
            ),

          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                CircleAvatar(
                    radius:23,
                    backgroundColor: RecipesColor.firstColor,
                    child: const Icon(Icons.arrow_right_alt_outlined,color: Colors.white,)),
                Expanded(child: Text ('Get Started',style: TextStyle(color: RecipesColor.firstColor,fontSize: 15,fontWeight: FontWeight.bold))),
                const Icon(Icons.navigate_next_sharp,color: Colors.orangeAccent,),
                Icon(Icons.navigate_next_sharp,color: RecipesColor.firstColor,size: 20,),
                Icon(Icons.navigate_next_sharp,color: Colors.orange[100],size: 17,)

              ],
            ),
          ),

        ),
      )
    );
 }
}
