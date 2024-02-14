import 'package:flutter/material.dart';
import 'package:recipes/colors/recipe_colors.dart';
import 'package:recipes/navigators/navigators.dart';
import 'package:recipes/presentation/recipe_details/page/recipe_details.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import '../../../Model/myRecipe.dart';
class WatchedRecipes extends StatefulWidget {
  const WatchedRecipes({super.key, required this.rate, required this.name, required this.category, required this.imageUrl, required this.time});
  final String rate;
  final String name;
  final String category;
  final String imageUrl;
  final String time;

  @override
  State<WatchedRecipes> createState() => _WatchedRecipesState();
}

class _WatchedRecipesState extends State<WatchedRecipes> with SingleTickerProviderStateMixin {
  late TabController _controller;
  List<MyRecipe> recipe=[];
  @override
  void initState() {
    super.initState();
   _controller = TabController(length: 6, vsync: this);
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
     backgroundColor: RecipesColor.secondColor,
      body: SafeArea(
        child: Stack(
          //alignment: Alignment.topLeft,
          children: [
            Container(
              padding: EdgeInsets.all(20.sp),
             // margin: EdgeInsets.all(20.sp),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  IconButton(onPressed: (){}, icon: Icon(Icons.menu,color: RecipesColor.orangeColor,)),
                  const SizedBox(height: 10,),
                  const Text('Watched Recipes',
                    style: TextStyle( fontSize: 30,color: Colors.white70),),
                ],
              ),
            ),
            Container(
              width: double.infinity,
              height:100.h,
              padding: EdgeInsets.only(
                right: 10.sp,
                left: 10.sp,
                top: 20.sp,
              ),
              margin: EdgeInsets.only(top: 50.sp,left: 20.sp),
              decoration: BoxDecoration(
                  color: Theme.of(context).brightness == Brightness.light
                      ?Colors.white
                      :Colors.black,
                borderRadius: BorderRadiusDirectional.only(topStart: Radius.circular(30.sp))
              ),
              child: Column(
                children: [
                  tabBar(),
                ],
              ),
            ),

          ],
        ),
      ),

    );
  }

  Widget tabBar() {
    return Column(
      children: [
        SizedBox(
          width: double.infinity,
          height:50,
          child: TabBar(
              labelStyle: const TextStyle(fontSize: 15,fontWeight: FontWeight.bold),
              labelColor: RecipesColor.secondColor,
              //indicatorWeight: 1,
              unselectedLabelColor: Colors.grey,
              indicatorColor: Colors.white,
              controller: _controller,
              isScrollable: true,
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
          width: 100.w,
          height: 68.h,
          child: TabBarView(
              controller: _controller,
              children:<Widget> [
                watched(),
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

  Widget watched() {
    return SizedBox(
      width: double.infinity,
      child: GridView.builder(
          shrinkWrap: true,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            crossAxisSpacing: 2,
            childAspectRatio: 0.55,
          ),
          itemCount:  recipe.length,
          scrollDirection: Axis.vertical,
          itemBuilder: (context, index) {
            return Container(
              //height:5.h,
              width: double.infinity,
              margin:  EdgeInsets.all(10.sp),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20.sp),
                  color: Colors.white,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.5),
                      blurRadius:7,
                      spreadRadius: 1,
                      offset: const Offset(0,10), // Shadow position
                    )]
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.all(Radius.circular(20.sp)),
                    child: InkWell(
                      onTap:(){},
                      child: Image.network(
                        "${widget.imageUrl}",
                         height: 14.h,
                        width: 43.w,
                        fit: BoxFit.fitWidth,
                      ),
                    ),
                  ),
                  //SizedBox(height: 2.h,),
                  Container(
                    padding:EdgeInsets.all(15.sp),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "${widget.name}",
                          style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                              fontSize: 20.sp),),
                        Row(
                          children: [
                            Icon(Icons.access_time, color: RecipesColor.firstColor,),
                             Text("${widget.time}", style: TextStyle(color: Colors
                                .grey),),
                            const SizedBox(width: 10,),
                          ],
                        ),
                        Row(
                          children: [
                            Icon(Icons.stacked_bar_chart,
                              color: RecipesColor.firstColor,),
                             Text(recipe[index].level, style: TextStyle(color: Colors.grey),),
                            const SizedBox(width: 10,),
                          ],
                        ),
                        SizedBox(height: 1.h,),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            SizedBox(
                              width:20.w,
                              height:7.h,
                              child: ElevatedButton(
                               onPressed: ()=> push(context, RecipeDetails(vUrl: recipe[index].youtubeUrl,
                                    rate: recipe[index].rate, level: recipe[index].level,
                                    name: recipe[index].name, chefName: recipe[index].chefName,
                                    followers: recipe[index].followers,
                                    description: recipe[index].description, time: recipe[index].time, cal: recipe[index].cal,)),

                                    style: ElevatedButton.styleFrom(
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(15.sp),
                                  ),
                                  backgroundColor: RecipesColor.secondColor,
                                ),
                                child:
                                Text("ReWatch",style: TextStyle(color: Colors.white,fontSize: 14.sp),),
                              ),
                            ),
                            SizedBox(width: 1.w,),
                            Container(
                              height:7.h,
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
                        )
                      ],
                    ),
                  ),


                ],
              ),
            );

          }
      ),
    );
  }
  @override
  void dispose() {
   _controller.dispose();
    super.dispose();
  }



}
