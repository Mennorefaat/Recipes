import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'Model/category_product.dart';
import 'colors/recipe_colors.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen>  with SingleTickerProviderStateMixin{
  CarouselController buttonCarouselController = CarouselController();
  late TabController _controller;
  List<CategoryProduct> categoryProduct=[
    CategoryProduct('Cheese Pizza', '', '', '25000 EGP', 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTd3OdttwDOTezV_h-qSf0SH3HeIaScZGp5og&usqp=CAU',true),
    CategoryProduct('Burger', '45 %', '10230 EGP', '5599 EGP','https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTjr_mHTGKmVilBiLWCHtxnpSG0GYEARaMaJA&usqp=CAU',false),
    CategoryProduct('Pasta', '8 %', '12499 EGP', '11499', 'https://i5.walmartimages.com/seo/SAMSUNG-65-Class-Curved-4K-2160P-Ultra-HD-Smart-LED-TV-UN65MU6500FXZA_f18ae77b-ccbb-4d31-9b90-577bd770e1ed_3.dfaaa48e38496b4c3b9ef8116cd36866.jpeg',false),
    CategoryProduct('Apple ', '', '', '44500 EGP', 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRHNQEZDCM-3RJ0tjMlZH0oZYCs5O8pqO4muw&usqp=CAU',true),
    CategoryProduct('salad', '6 %', '35000 EGP', '32860 EGP', 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRsYLJB04kLq-pEfMVY4gYiXhr2BiP36plJmA&usqp=CAU',false),
    CategoryProduct('meat', '', '', '530', 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSeboeQ8ddboCpljMoy2R2jjg_O4fYpScu3rA&usqp=CAU',true),
  ];

  List<String> images = [
    "https://images.wallpapersden.com/image/download/purple-sunrise-4k-vaporwave_bGplZmiUmZqaraWkpJRmbmdlrWZlbWU.jpg",
    "https://wallpaperaccess.com/full/2637581.jpg",
    "https://uhdwallpapers.org/uploads/converted/20/01/14/the-mandalorian-5k-1920x1080_477555-mm-90.jpg"
  ];


  @override
  void initState() {
    super.initState();
    _controller = TabController(length: 6, vsync: this);
  }
  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
      body: SafeArea(
        child: SingleChildScrollView(
          child: Container(
            margin: EdgeInsets.all(10.sp),
            padding: EdgeInsets.symmetric(horizontal: 15.sp),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text('Recipes',style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold,fontSize: 30),),
                 const Row(
                   children: [
                    CircleAvatar(
                      radius: 25,
                    ),
                     SizedBox(width: 10,),
                     Expanded(
                       child: Column(
                         crossAxisAlignment: CrossAxisAlignment.start,
                         children: [
                           Text('Hi, Anne',style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold,fontSize:23),),
                           Text('Good morning!',style:TextStyle(color: Colors.grey) ,),
                         ],
                       ),
                     ),
                      CircleAvatar(),
                  ],
                ),
                const SizedBox(height: 10,),
                const SizedBox(height: 10,),
                const Text('What would you like \nto cook today?',style: TextStyle(fontSize: 32,fontWeight: FontWeight.bold),),
                const SizedBox(height: 10,),
                search(),
                //const SizedBox(height: 10,),
                SizedBox(
                  width: double.infinity,
                  height:50,
                  child: TabBar(
                    labelStyle: const TextStyle(fontSize: 15),
                    labelColor: Colors.amberAccent,
                    indicatorWeight: 3,
                    unselectedLabelColor: Colors.grey,
                    indicatorColor: Colors.amberAccent,
                    controller: _controller,
                    isScrollable: true,
                    tabs:  const [
                       Tab(child:Text('All'),),
                       Tab(child:Text('Cake'),),
                       Tab(child:Text('Snacks'),),
                       Tab(child:Text('Drinks'),),
                       Tab(child:Text('Fast Food'),),
                       Tab(child:Text('Kids'),),
                      ]),
                ),
                SizedBox(
                  width: 400,
                  height: 200,
                  child: TabBarView(
                      controller: _controller,
                      children:<Widget> [
                       recipes(),
                       const Text('Italian'),
                        const Text('Italian'),
                        const Text('Italian'),
                        const Text('Italian'),
                       const Text('Asian'),
                  ]
                  ),
                ),
                imageSlider(),
                popularDishes(),
               recentRecipes(),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget search() {
    return Align(
      alignment: Alignment.center,
      child: SizedBox(
        height: 50,
        width: 300,
        child: TextField(
          decoration: InputDecoration(
            suffixIcon: Container(
              decoration: const BoxDecoration(
                shape: BoxShape.circle,
                gradient: LinearGradient(
                  colors: [
                    Color(0XFF8C4400),
                    Color(0XFFFF7C00),
                    Color(0XFFFFB872),
                    Color(0XFFFFB872),
                  ],
                ),
              ),
              child: CircleAvatar(
                backgroundColor: Colors.transparent,
                radius: 25,
                child: IconButton(
                    color:Colors.white ,
                    onPressed: (){},
                    icon: const Icon(Icons.search)),
              ),
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(26.0.sp),
              borderSide:  BorderSide(
                color: Colors.grey,
                width: 0.2.sp,
              ),
            ),
            filled: true,
            fillColor: Colors.white,
            hintText:  'Search Recipes',
            hintStyle: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.grey,
                  fontSize: 15.sp),
            border:  OutlineInputBorder(
              borderSide: BorderSide(
                color: Colors.grey,
                width: 0.2.sp,
              ),
              borderRadius: BorderRadius.circular(20.sp),
            ),
          ),
        ),
      ),
    );
  }

  Widget recipes() {
    return  Expanded(
      child: GridView.builder(
          //physics: NeverScrollableScrollPhysics(),
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 1,
            //childAspectRatio: 0.64,
          ),
          itemCount:  categoryProduct.length,
          scrollDirection: Axis.horizontal,
          itemBuilder: (context, index) {
            return Container(
              margin: const EdgeInsets.symmetric(vertical: 5),
              padding: EdgeInsets.all(10.sp),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    child: Stack(
                      alignment: Alignment.bottomRight,
                      children: [
                        InkWell(
                          onTap: () {},
                          child:
                          ClipRRect(
                            borderRadius: BorderRadius.circular(20.sp),
                            child: Image.network(
                              categoryProduct[index].image,
                              fit: BoxFit.cover,
                              height: 100,
                              width: 200,
                            ), ),),
                        Visibility(
                          visible: categoryProduct[index].priceBefore .isNotEmpty,
                          child: Container(
                            margin: EdgeInsets.all(18.sp),
                            child: OutlinedButton.icon(
                              onPressed: () {},
                              style: ElevatedButton.styleFrom(
                                shape: const StadiumBorder(),
                                backgroundColor: RecipesColor.firstColor,
                              ),
                              icon: Icon(Icons.star,color: Colors.black,size: 17.sp,),
                              label: Text ('4.5',style: TextStyle(color: Colors.black,fontSize: 17.sp,fontWeight: FontWeight.bold),),
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                  SizedBox(height: 2.h,),
                  Text(
                    categoryProduct[index].name,
                    style: const TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                    fontSize: 15),),
                  const Text('Dessert',style: TextStyle(color: Colors.grey),)
                ],
              ),
            );

          }
      ),
    );
  }

 Widget popularDishes() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Text('Popular Dishes',style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold,fontSize: 25),),
            TextButton(onPressed: (){}, child: Text('See All',style: TextStyle(color: RecipesColor.firstColor,fontWeight: FontWeight.bold,fontSize: 18),))
          ],
        ),
        SizedBox(
          height: 40.h,
          child: ListView.builder(
           itemCount:  categoryProduct.length,
           scrollDirection: Axis.horizontal,
           itemBuilder: (context, index) {

           return Container(
               height: 38.h,
               margin:  EdgeInsets.all(15.sp),
               decoration: BoxDecoration(
                 borderRadius: BorderRadius.circular(20.sp),
                 color: Colors.white,
               ),
               child: Column(
                 crossAxisAlignment: CrossAxisAlignment.start,
                 children: [
                   InkWell(
                     child: Stack(
                       alignment: Alignment.topRight,
                       children: [
                         Image.network(
                         "https://images.unsplash.com/photo-1682685795557-976f03aca7b2?w=800&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDF8MHxlZGl0b3JpYWwtZmVlZHwxfHx8ZW58MHx8fHx8",
                            fit: BoxFit.cover,
                           height: 10.h,
                           width: double.infinity,
                         ),
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
                     ),),
                   // SizedBox(height: 2.h,),
                   // Container(
                   //   margin: EdgeInsets.symmetric(horizontal: 20.sp),
                   //   child: const Text(
                   //     'Menna',
                   //     style: TextStyle(
                   //         color: Colors.black,
                   //         fontWeight: FontWeight.bold,
                   //         fontSize: 20),),
                   // ),
                   // Container(
                   //   margin: EdgeInsets.symmetric(horizontal: 20.sp),
                   //   child: Row(
                   //     children: [
                   //       Icon(Icons.access_time, color: RecipesColor.firstColor,),
                   //       const Text('15 min', style: TextStyle(color: Colors
                   //           .grey),),
                   //       const SizedBox(width: 10,),
                   //
                   //       Icon(Icons.stacked_bar_chart,
                   //         color: RecipesColor.firstColor,),
                   //       const Text('Medium', style: TextStyle(color: Colors.grey),),
                   //       const SizedBox(width: 10,),
                   //
                   //       Icon(Icons.local_fire_department_outlined,
                   //         color: RecipesColor.firstColor,),
                   //       const Text('512 cal', style: TextStyle(color: Colors.grey),),
                   //       const SizedBox(width: 10,),
                   //     ],
                   //   ),
                   // )
                 ],
               ),
             );
           }
          ),
        ),
      ],
    );
 }

 Widget imageSlider() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text('#Spacial For You',style: TextStyle(fontSize: 25,fontWeight: FontWeight.bold),),
        const SizedBox(height: 10,),
        CarouselSlider(
          options: CarouselOptions(
            autoPlay: true,
            height: 180.0,
            enlargeCenterPage: true,
            enableInfiniteScroll: true,
            autoPlayAnimationDuration: const Duration(milliseconds: 800),
            viewportFraction: 0.8,
            autoPlayCurve: Curves.fastOutSlowIn,
            aspectRatio: 2.0,
          ),
          items:images.map((e) => ClipRRect(
            borderRadius: BorderRadius.circular(8),
            child: Stack(
              fit: StackFit.expand,
              children: [
                Image.network(e,width: 1050,height: 350,fit: BoxFit.cover,)
              ],
            ),
          )).toList(),

        ),
      ],
    );
 }

 Widget recentRecipes() {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Text('Recent Recipes',style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold,fontSize: 25),),
            TextButton(onPressed: (){}, child: Text('See All',style: TextStyle(color: RecipesColor.firstColor,fontWeight: FontWeight.bold,fontSize: 18),))
          ],
        ),
        SizedBox(
          child: ListView.builder(
            shrinkWrap: true,
            physics:  NeverScrollableScrollPhysics(),
              itemCount:  categoryProduct.length,
              scrollDirection: Axis.vertical,
              itemBuilder: (context, index) {
                return Container(
                  margin: EdgeInsets.all(10.sp),
                  padding: EdgeInsets.all(12.sp),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15.sp),
                    color: Colors.white,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Expanded(
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(15.sp),
                              child: Image.network(
                                categoryProduct[index].image,
                                fit: BoxFit.cover,
                                height: 50,
                                width: 50,
                              ), ),
                          ),
                          const SizedBox(width: 10,),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(categoryProduct[index].name,style: const TextStyle(fontWeight: FontWeight.bold,fontSize: 20),),
                               Row(
                                children: [
                                  Icon(Icons.access_time_rounded,color: RecipesColor.firstColor,),
                                  Text('10 mins',style: TextStyle(color: Colors.grey),),
                                  SizedBox(width: 10,),

                                  Icon(Icons.stacked_bar_chart,color:RecipesColor.firstColor,),
                                  Text('Medium',style: TextStyle(color: Colors.grey),),
                                  SizedBox(width: 10,),

                                  Icon(Icons.local_fire_department_outlined,color: RecipesColor.firstColor,),
                                  Text('512 cal',style: TextStyle(color: Colors.grey),),
                                  SizedBox(width: 10,),
                                ],
                              ),
                            ],
                          ),
                          IconButton(onPressed: (){}, icon: const Icon(Icons.navigate_next))
                             ],
                      ),
                    ],
                  ),
                );

              }
          ),
        ),
      ],
    );
 }

}

