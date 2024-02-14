
import 'package:carousel_slider/carousel_slider.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:recipes/presentation/profile%20screen/profile_screen.dart';
import 'package:recipes/presentation/recipe_details/page/recipe_details.dart';
import 'package:recipes/shared/my_shared.dart';
import 'package:recipes/shared/my_shared_keys.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import '../../../Model/myRecipe.dart';
import '../../../colors/recipe_colors.dart';
import '../../../navigators/navigators.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen>  with SingleTickerProviderStateMixin{
  CarouselController buttonCarouselController = CarouselController();
  late TabController _controller;

  List<String> popular = [
    "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQZShxk7KecySp3UC8tuKb29R9hDGv3o-S8jA&usqp=CAU",
    "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTJmcBVBIxEP6bGJsupa0IpojvRR6TJnkodqLV-e-s8xtaAruWLU6dsegjvXVDQZHMGg8w&usqp=CAU",
    "https://www.halfbakedharvest.com/wp-content/uploads/2023/01/Baked-Crunchy-Hot-Honey-Chicken-1.jpg"
  ];

   List<String> slider = [
    "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcS_Ht-Q4Vf3pvcuaXH8udotKxRM16mtCGJWow&usqp=CAU",
    "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQ1I8iAeZEMNn6Rvhxdxma1UmLdSJRrwuGyyA&usqp=CAU",
    "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcT9tpil4uoVKWLhzpaa2nFoQAvBPl0EMEayaA&usqp=CAU"
  ];
  //String imageUrl = '';
  bool uploading = false;

  final firestore = FirebaseFirestore.instance;
  final auth = FirebaseAuth.instance;
  final storage = FirebaseStorage.instance;
  List<MyRecipe> recipe=[];
  getRecipes() {
    final userId = FirebaseAuth.instance.currentUser?.uid;
    firestore
        .collection('recipes').get().then((value) {
      recipe.clear(); //to not repeat the info
      for (var document in value.docs) {
        final recipes = MyRecipe.fromMap(document.data());
        recipe.add(recipes);
      }
      print(recipe.toString());
      setState(() {});
    }).catchError((e) {
      print(e);

    });
  }
  @override
  void initState() {
    super.initState();
    getRecipes();
    _controller = TabController(length: 6, vsync: this);
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //backgroundColor: RecipesColor.firstColor,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Container(
            margin: EdgeInsets.all(10.sp),
            padding: EdgeInsets.symmetric(horizontal: 15.sp),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text('Mum`s Cooking',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 30),),
                SizedBox(height: 2.h,),
                Row(
                   children: [
                    InkWell(
                      onTap: ()=> push(context, const ProfileScreen()),
                      child:Stack(
                        alignment: Alignment.center,
                        children: [
                          InkWell(
                            borderRadius: BorderRadius.circular(50),
                            child: const CircleAvatar(
                              //backgroundImage: NetworkImage(imageUrl),
                              radius: 30,
                            ),
                          ),
                          Visibility(
                            visible: uploading,
                            child: const CircularProgressIndicator(),
                          ),
                        ],
                      ),
                    ),
                     const SizedBox(width: 10,),
                      Expanded(
                       child: Column(
                         crossAxisAlignment: CrossAxisAlignment.start,
                         children: [
                           Text('Hi, ${PreferenceUtils.getString(PrefKeys.name)}',style: TextStyle(fontWeight: FontWeight.bold,fontSize:23),),
                           Text('Good morning!',style:TextStyle(color: Colors.grey) ,),
                         ],
                       ),
                     ),
                      Image.asset("assets/images/icon1.png",
                      height: 8.h,
                      width: 20.w,),
                  ],
                ),
                const SizedBox(height: 10,),
                const SizedBox(height: 10,),
                const Text('What would you like \nto cook today?',style: TextStyle(fontSize: 30,fontWeight: FontWeight.bold),),
                const SizedBox(height: 10,),
                search(),
                SizedBox(height: 2.h,),
                tabBar(),
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
        height: 7.h,
        width: 200.w,
        child: TextField(
          decoration: InputDecoration(
            suffixIcon: Container(
              margin: EdgeInsets.all(10.sp),
              decoration:  BoxDecoration(
                shape: BoxShape.circle,
                gradient: LinearGradient(
                  colors: [
                    RecipesColor.firstColor,
                    RecipesColor.secondColor,
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
    return  SizedBox(
      child: GridView.builder(
          //physics: NeverScrollableScrollPhysics(),
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 1,
            //childAspectRatio: 0.64,
          ),
          itemCount:  recipe.length,
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
                      alignment: Alignment.bottomLeft,
                      children: [
                        InkWell(
                          onTap: () {
                            push
                              (context,  RecipeDetails(vUrl: recipe[index].youtubeUrl,
                                rate: recipe[index].rate, level: recipe[index].level,
                                name: recipe[index].name, chefName: recipe[index].chefName,
                                followers: recipe[index].followers,
                                description: recipe[index].description, time: recipe[index].time, cal: recipe[index].cal,));
                          },
                          child:
                          ClipRRect(
                            borderRadius: BorderRadius.circular(20.sp),
                            child: Image.network(
                              recipe[index].imageUrl,
                              fit: BoxFit.cover,
                              height: 50.h,
                              width: 100.w,
                            ), ),),
                        Visibility(
                          visible: recipe[index].rate .isNotEmpty,
                          child: Container(
                            width: 20.w,
                            margin: EdgeInsets.all(10.sp),
                            padding: EdgeInsets.all(10.sp),
                            decoration: BoxDecoration(
                              color: RecipesColor.firstColor,
                              borderRadius: BorderRadius.circular(20.sp),
                            ),
                              child: Row(
                                  children:[
                                    Icon(Icons.star,color: Colors.black,size: 20.sp,),
                                    Text (recipe[index].rate,
                                      style: TextStyle(
                                        color: Colors.black,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 17.sp,),),
                                    Text("/5",
                                      style: TextStyle(
                                        color: Colors.grey,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 17.sp,),)
                                  ]
                              ),
                            ),
                          ),
                      ],
                    ),
                  ),
                  SizedBox(height: 2.h,),
                  Text(
                    recipe[index].name,
                    style: const TextStyle(
                        //color: Colors.black,
                        fontWeight: FontWeight.bold,
                    fontSize: 15),),
                  Text(recipe[index].category,
                    style: const TextStyle(color: Colors.grey),)
                ],
              ),
            );

          }
      ),
    );
  }
  Widget popularDishes() {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Text('Popular Dishes',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 25),),
            TextButton(onPressed: (){}, child: const Text('See All',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 18),))
          ],
        ),
        SizedBox(
          height: 35.h,
          child: ListView.builder(
              itemCount:  recipe.length,
              padding: EdgeInsets.all(10.sp),
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) {
                return Container(
                  height: 25.h,
                  width: 75.w,
                  margin:  EdgeInsets.all(15.sp),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20.sp),
                    color: Theme.of(context).brightness == Brightness.light
                        ?Colors.white
                        :RecipesColor.secondColor,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      ClipRRect(
                        borderRadius: const BorderRadius.only(
                          topRight: Radius.circular(20),
                          topLeft: Radius.circular(20),
                        ),
                        child: InkWell(
                          onTap:(){},
                          child: Stack(
                            alignment: Alignment.topRight,
                            children: [
                              Image.network(
                                recipe[index].imageUrl,
                                 height: 20.h,
                                width: 75.w,
                                fit: BoxFit.fitWidth,
                              ),
                              Container(
                                margin: const EdgeInsets.all(10),
                                decoration: BoxDecoration(
                                  color: RecipesColor.firstColor,
                                  borderRadius: BorderRadius.circular(15),
                                ),
                                child: IconButton(
                                    onPressed: (){
                                      setState(() {
                                        recipe[index].isFavourite=!recipe[index].isFavourite;
                                      });
                                    },
                                    icon: Icon(recipe[index].isFavourite? Icons.favorite_border_outlined:Icons.favorite
                                      , color: Colors.white,)),
                              ),
                            ],
                          ),
                        ),
                      ),
                      SizedBox(height: 2.h,),
                      Container(
                        margin: EdgeInsets.symmetric(horizontal: 20.sp),
                        child:  Text(
                          recipe[index].name,
                          style: TextStyle(
                             // color: Colors.black,
                              fontWeight: FontWeight.bold,
                              fontSize: 20),),
                      ),
                      Container(
                        margin: EdgeInsets.symmetric(horizontal: 20.sp),
                        child: Row(
                          children: [
                            Icon(Icons.access_time, color: RecipesColor.firstColor,),
                             Text(recipe[index].time, style: const TextStyle(color: Colors
                                .grey),),
                            const SizedBox(width: 10,),

                            Icon(Icons.stacked_bar_chart,
                              color: RecipesColor.firstColor,),
                             Text(recipe[index].level, style: const TextStyle(color: Colors.grey),),
                            const SizedBox(width: 10,),

                            Icon(Icons.local_fire_department_outlined,
                              color: RecipesColor.firstColor,),
                             Text(recipe[index].cal, style: const TextStyle(color: Colors.grey),),
                            const SizedBox(width: 10,),
                          ],
                        ),
                      )
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
        const Text('Spacial For You',style: TextStyle(fontSize: 25,fontWeight: FontWeight.bold),),
        const SizedBox(height: 10,),
        CarouselSlider(
          options: CarouselOptions(
            autoPlay: true,
            height: 200.0,
            enlargeCenterPage: true,
            enableInfiniteScroll: true,
            autoPlayAnimationDuration: const Duration(milliseconds: 800),
            viewportFraction: 0.8,
            autoPlayCurve: Curves.fastOutSlowIn,
            aspectRatio: 2.0,
          ),
          items:slider.map((e) => Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20.sp),
              boxShadow: [
                BoxShadow(
                  color: RecipesColor.paje.withOpacity(0.5),
                  blurRadius:7,
                  spreadRadius: 1,
                  offset: const Offset(0,10), // Shadow position
                ),
              ],
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(20.sp),
              child: Stack(
               fit: StackFit.expand,
               children: [
                 Image.network(e,width: 1050,height: 300,fit: BoxFit.cover,)
               ],
                ),
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
            const Text('Recent Recipes',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 25),),
            TextButton(onPressed: (){}, child: const Text('See All',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 18),))
          ],
        ),
        SizedBox(
          child: GridView.builder(
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
              crossAxisSpacing: 2,
              childAspectRatio: 0.55,),
            shrinkWrap: true,
            physics:  const NeverScrollableScrollPhysics(),
              itemCount:  recipe.length,
              scrollDirection: Axis.vertical,
              itemBuilder: (context, index) {
                return Container(
                  width: double.infinity,
                  margin: EdgeInsets.all(10.sp),
                  padding: EdgeInsets.all(12.sp),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15.sp),
                      color: Theme.of(context).brightness == Brightness.light
                          ?Colors.white
                          :Colors.black,
                      boxShadow: [
                        BoxShadow(
                          color: Colors.brown.withOpacity(0.5),
                          blurRadius:7,
                          spreadRadius: 1,
                          offset: const Offset(0,10), // Shadow position
                        )]
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(15.sp),
                          child: Image.network(
                            recipe[index].imageUrl,
                            fit: BoxFit.cover,
                            height: 30.h,
                            width: 40.w,
                          ), ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(recipe[index].name,style: const TextStyle(fontWeight: FontWeight.bold,fontSize: 20),),
                               Column(
                                children: [
                                  Icon(Icons.access_time_rounded,color: RecipesColor.firstColor,),
                                  const Text('10 Min',style: TextStyle(color: Colors.grey),),
                                  const SizedBox(width: 10,),

                                  Icon(Icons.stacked_bar_chart,color:RecipesColor.firstColor,),
                                  const Text('Medium',style: TextStyle(color: Colors.grey),),
                                  const SizedBox(width: 10,),

                                  Icon(Icons.local_fire_department_outlined,color: RecipesColor.firstColor,),
                                  const Text('512 Cal',style: TextStyle(color: Colors.grey),),
                                  const SizedBox(width: 10,),
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
        SizedBox(height: 8.h,),
      ],
    );
 }
  Widget tabBar() {
    return Column(
      children: [
        SizedBox(
          width: double.infinity,
          height:50,
          child: TabBar(
              labelStyle: const TextStyle(fontSize: 15),
              labelColor: RecipesColor.firstColor,
              indicatorWeight: 3,
              //unselectedLabelColor: Colors.black,
              //indicatorColor: Colors.black,
              controller: _controller,
              isScrollable: true,
              indicator: BoxDecoration(
                  borderRadius: BorderRadius.circular(20.sp), // Creates border
                  color: RecipesColor.orangeColor),
              tabs:  const [
                Tab(child:Text('All Food'),),
                Tab(child:Text('French'),),
                Tab(child:Text('Snacks'),),
                Tab(child:Text('Meat'),),
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
      ],
    );
 }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

}

