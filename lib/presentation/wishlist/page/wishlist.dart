import 'package:flutter/material.dart';
import 'package:recipes/presentation/recipe_details/page/recipe_details.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import '../../../Model/myRecipe.dart';
import '../../../colors/recipe_colors.dart';
import '../../../navigators/navigators.dart';

class WishList extends StatefulWidget {
  const WishList({super.key, });


  @override
  State<WishList> createState() => _WishListState();
}

class _WishListState extends State<WishList> {

 List<MyRecipe> recipe=[];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        title: const Text('WishList',
          style: TextStyle(
              fontSize: 25,
              fontWeight: FontWeight.bold),),
        centerTitle: true,
      ),

      body: GridView.builder(
       // physics: const NeverScrollableScrollPhysics(),
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            childAspectRatio: 1,
          ),
          itemCount:  recipe.length,
          scrollDirection: Axis.vertical,
          itemBuilder: (context, index) {
            return Stack(
              alignment: Alignment.bottomCenter,
              children: [
                Stack(
                  children: [
                    Container(
                      width: 45.w,
                      height: 17.h,
                       padding: EdgeInsets.all(15.sp),
                      decoration: BoxDecoration(
                        color: RecipesColor.firstColor,
                        borderRadius: BorderRadius.circular(20.sp),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(height: 5.h,),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                "widget.name",
                                style: const TextStyle(
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold,
                                    fontSize:20),),

                              Visibility(
                                  visible: recipe[index].rate .isNotEmpty,
                                  child: Row(
                                      children:[
                                        Icon(Icons.star,color: Colors.black,size: 20.sp,),
                                        Text ("widget.rate",
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
                                  )
                              ),
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                               Text("widget.category",
                                style: TextStyle(color: Colors.white,fontSize: 20),),
                              IconButton(
                                  onPressed: (){
                                    setState(() {
                                      recipe[index].isFavourite=!recipe[index].isFavourite;
                                    });
                                  },
                                  icon:Icon(recipe[index].isFavourite? Icons.favorite_border_outlined:Icons.favorite,color: Colors.black,)),
                            ],
                          )
                           ],
                      ),
                    ),
                  ],
                ),
                Align(
                  alignment: Alignment.topCenter,
                  child: InkWell(
                    onTap: () {
                      push(context, RecipeDetails(vUrl: recipe[index].youtubeUrl,
                          rate: recipe[index].rate, level: recipe[index].level,
                          name: recipe[index].name, chefName: recipe[index].chefName,
                          followers: recipe[index].followers,
                          description: recipe[index].description, time: recipe[index].time, cal: recipe[index].cal,));
                    },
                    child:
                    CircleAvatar(
                      radius: 30.sp,
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(30.sp),
                        child: Image.network(
                          "widget.imageUrl",
                          fit: BoxFit.cover,
                          height: 50.h,
                          width: 100.w,
                        ),
                      ),
                    ), ),
                ),
              ],
            );

          }
      ),
    );
  }
}
