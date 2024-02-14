import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:recipes/colors/recipe_colors.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../../Model/myRecipe.dart';
import '../../../navigators/navigators.dart';
import '../../navigation_bar/page/main_screen.dart';

class MyFridge extends StatefulWidget {
  const MyFridge({super.key});

  @override
  State<MyFridge> createState() => _MyFridgeState();
}

class _MyFridgeState extends State<MyFridge> {
  List<MyRecipe> recipe=[];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: SafeArea(
          child: Container(
            margin: const EdgeInsets.all(10),
            padding: const EdgeInsets.all(20),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: 5.h,
                  width: 5.h,
                  child: FloatingActionButton(
                    backgroundColor: Colors.white,
                    shape: BeveledRectangleBorder(
                      borderRadius: BorderRadius.circular(5),
                    ),
                      onPressed: (){
                        pop(context,const MainScreen());
                      },
                    child: const Icon(Icons.arrow_back,color: Colors.black,),
                  ),
                ),
                SizedBox(height: 8.h),
                const Text('What`s in my fridge?',
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 30),),
                const SizedBox(height: 10,),
                const Text('Can add up to 2 ingredients \nand search find recipe',
                  style: TextStyle(
                    color: Colors.grey,
                    fontSize: 15),),
                search(),
                ingredients(),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    InkWell(
                      onTap: (){},
                      child: Column(
                        children: [
                          Image.asset(
                              "assets/images/delete.png",
                            height: 10.h,
                            width: 30.w,
                          ),
                          Text('Delete All',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 15.sp),),
                        ],
                      ),
                    ),

                    InkWell(
                      onTap: (){
                        pop(context, const MainScreen());
                      },
                      child: Column(
                        children: [
                          Image.asset(
                            "assets/images/done.png",
                            height: 10.h,
                            width: 30.w,
                          ),
                           Text('Done/Save',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 15.sp),),
                        ],
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 2.h,),
                findRecipes(),
              ],
            ),
          ),
        ),
      ),
    );
  }

 Widget search() {
    return  Container(
      margin: const EdgeInsets.symmetric(vertical: 15),
      width: double.infinity,
      child: TextFormField(
        obscureText: true,
        autofocus: false,
        decoration: InputDecoration(
          suffixIcon: Container(
            margin: const EdgeInsets.all(10),
            decoration: BoxDecoration(
              color: RecipesColor.firstColor,
              borderRadius: BorderRadius.circular(18.sp),
            ),
            child: IconButton(
              icon: const Icon(Icons.add, color: Colors.white),
              onPressed: () {  },),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(15.0.sp),
            borderSide:  BorderSide(
              color: Colors.grey,
              width: 0.2.sp,
            ),
          ),
          border:  OutlineInputBorder(
            borderSide: BorderSide(
              color: Colors.grey,
              width: 0.2.sp,
            ),
            borderRadius: BorderRadius.circular(20.sp),
          ),
          hintText: 'Type and add your ingredients...',
          hintStyle: const TextStyle(color: Colors.grey),
          fillColor: Colors.white,
          filled: true,
          contentPadding: const EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
        ),
      ),
    );
 }

 Widget ingredients() {
    return SizedBox(
      child: ListView.builder(
          shrinkWrap: true,
          physics:  const NeverScrollableScrollPhysics(),
          itemCount:  recipe.length,
          scrollDirection: Axis.vertical,
          itemBuilder: (context, index) {
            return Container(
              margin: EdgeInsets.all(10.sp),
              padding: EdgeInsets.all(12.sp),
              decoration:  BoxDecoration(
                  color: Colors.grey[200],
                  borderRadius: BorderRadius.circular(15.sp)
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(15.sp),
                        child: Image.network(
                          recipe[index].imageUrl,
                          fit: BoxFit.cover,
                          height: 50,
                          width: 50,
                        ), ),
                      const SizedBox(width: 10,),
                      Expanded(
                          child: Text(recipe[index].name,
                            style: const TextStyle(
                                fontSize: 15,
                                fontWeight: FontWeight.bold),)),
                      IconButton(
                          onPressed: (){},
                          icon:  Icon(Icons.cancel,size: 25,
                            color: RecipesColor.firstColor,))
                    ],
                  ),
                ],
              ),
            );

          }
      ),
    );
 }

  Widget findRecipes() {
    return Align(
        alignment: Alignment.bottomCenter,
        child: InkWell(
          onTap: (){},
          child: Container(
            height:7.h,
            width: 100.w,
            decoration:  BoxDecoration(
              color: Colors.black,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(20.sp),
                topRight: Radius.circular(20.sp)
              ),
            ),

            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: Row(
                 children: [
                  const Expanded(child: Text ('Find recipes',style: TextStyle(color: Colors.white,fontSize: 15,fontWeight: FontWeight.bold))),
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
