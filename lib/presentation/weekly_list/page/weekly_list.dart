
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:recipes/colors/recipe_colors.dart';
import 'package:recipes/navigators/navigators.dart';
import 'package:recipes/presentation/recipe_details/page/recipe_details.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import '../../../Model/myRecipe.dart';

class WeeklyList extends StatefulWidget {
  const WeeklyList({super.key});

  @override
  State<WeeklyList> createState() => _WeeklyListState();
}

class _WeeklyListState extends State<WeeklyList> {

 List<MyRecipe> recipe=[];
  void doNothing(BuildContext context) {}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Stack(
          children: [
            ClipRRect(
              child: Image.asset("assets/images/2.png"),
            ),
            Container(
              margin: EdgeInsets.only(top: 60.sp),
              padding:  EdgeInsets.all(15.sp),
              width: double.infinity,
              decoration:  BoxDecoration(
                  color: RecipesColor.secondColor,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(25.sp),
                    topRight: Radius.circular(25.sp),
                  )
              ),
              child:Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Align(
                    alignment:Alignment.center,
                    child:  Text('______',
                      style: TextStyle(fontWeight:FontWeight.bold,fontSize: 20,color: RecipesColor.paje),),
                  ),
                 slideAble(),
                 //recentRecipes(),
                ],
              ),
            )
          ],
        ),
      ),

    );
  }
Widget slideAble(){
    return Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('𝕨𝕖𝕖𝕜𝕝𝕪 𝕝𝕚𝕤𝕥',style: TextStyle(color: RecipesColor.paje,fontWeight: FontWeight.bold,fontSize: 25),),],
          ),
          SizedBox(
            child: ListView.builder(
                shrinkWrap: true,
                physics:  const NeverScrollableScrollPhysics(),
                itemCount:  recipe.length,
                scrollDirection: Axis.vertical,
                itemBuilder: (context, index) {
                  return Slidable(
                      key: const ValueKey(0),
                      endActionPane:  ActionPane(
                        motion: const ScrollMotion(),
                        dismissible: DismissiblePane(onDismissed: () {}),
                        children: [
                        SlidableAction(
                      borderRadius: BorderRadius.circular(20.sp),
                      onPressed: doNothing,
                      backgroundColor: Colors.black,
                      foregroundColor: Colors.white,
                      icon: Icons.delete,
                      label: 'Delete',
                      ),
                      ],
                      ),
                    child:
                    InkWell(
                      onTap:()=> push(context, RecipeDetails(vUrl: recipe[index].youtubeUrl,
                          rate: recipe[index].rate, level: recipe[index].level,
                          name: recipe[index].name, chefName: recipe[index].chefName,
                          followers: recipe[index].followers,
                          description: recipe[index].description, time: recipe[index].time, cal: recipe[index].cal,)),
                        child: Container(
                      margin: EdgeInsets.all(15.sp),
                      padding: EdgeInsets.all(20.sp),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20.sp),
                        color: Theme.of(context).brightness == Brightness.light
                            ?Colors.white54
                            :Colors.grey[900],
                        boxShadow: [
                          BoxShadow(
                            color: Colors.white.withOpacity(0.2),
                            spreadRadius: 1,
                            blurRadius: 7,
                            offset: const Offset(0, 10), // changes position of shadow
                          ),
                        ],

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
                                    recipe[index].imageUrl,
                                    fit: BoxFit.cover,
                                    height: 10.h,
                                    width: 20.w,
                                  ), ),
                              ),
                              const SizedBox(width: 10,),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(recipe[index].name,style: const TextStyle(fontWeight: FontWeight.bold,fontSize: 20),),
                                  SizedBox(height: 2.h,),
                                  Container(
                                    padding: EdgeInsets.all(10.sp),
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(15.sp),
                                      color: Colors.black,
                                    ),
                                    child: Row(
                                      children: [
                                        Icon(Icons.access_time_rounded,color: RecipesColor.firstColor,),
                                        Text('10 mins',style: TextStyle(color: RecipesColor.firstColor),),
                                        const SizedBox(width: 10,),

                                      ],
                                    ),
                                  ),
                                ],
                              ),
                              IconButton(onPressed: (){}, icon:  Icon(Icons.navigate_next,size: 25.sp,))
                            ],
                          ),
                        ],
                      ),
                    ),),
                  );
                }
            ),
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
            Text('Weekly List',style: TextStyle(color: RecipesColor.paje,fontWeight: FontWeight.bold,fontSize: 25),),],
        ),
        SizedBox(
          child: ListView.builder(
              shrinkWrap: true,
              physics:  const NeverScrollableScrollPhysics(),
              itemCount:  recipe.length,
              scrollDirection: Axis.vertical,
              itemBuilder: (context, index) {
                return InkWell(
                  onTap:()=> push(context,RecipeDetails(vUrl: recipe[index].youtubeUrl,
                      rate: recipe[index].rate, level: recipe[index].level,
                      name: recipe[index].name, chefName: recipe[index].chefName,
                      followers: recipe[index].followers,
                      description: recipe[index].description, time: recipe[index].time, cal: recipe[index].cal,)),
                    child: Container(
                    margin: EdgeInsets.all(10.sp),
                    padding: EdgeInsets.all(20.sp),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20.sp),
                      color: RecipesColor.firstColor,
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
                                  recipe[index].imageUrl,
                                  fit: BoxFit.cover,
                                  height: 10.h,
                                  width: 20.w,
                                ), ),
                            ),
                            const SizedBox(width: 10,),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(recipe[index].name,style: const TextStyle(fontWeight: FontWeight.bold,fontSize: 20),),
                               SizedBox(height: 2.h,),
                                Container(
                                  padding: EdgeInsets.all(10.sp),
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(15.sp),
                                    color: RecipesColor.paje,
                                  ),
                                  child: Row(
                                    children: [
                                      Icon(Icons.access_time_rounded,color: RecipesColor.firstColor,),
                                     Text('10 mins',style: TextStyle(color: RecipesColor.firstColor),),
                                      const SizedBox(width: 10,),
                                       ],
                                  ),
                                ),
                              ],
                            ),
                            IconButton(onPressed: (){}, icon:  Icon(Icons.navigate_next,size: 25.sp,))
                          ],
                        ),
                      ],
                    ),
                  ),
                );



              }
          ),
        ),
      ],
    );
  }


}
