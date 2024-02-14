import 'package:flutter/material.dart';
import 'package:recipes/colors/recipe_colors.dart';
import 'package:recipes/presentation/wishlist/page/wishlist.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import '../../home/page/home_screen.dart';
import '../../my_profile/page/my_profile.dart';
import '../../search for recipes/search_for_recipes.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int currentIndex = 0;
  final List <Widget> screens = <Widget>[
    const HomeScreen(),
    const SearchForRecipes(),
    const WishList(),
    const MyProfile(),

  ];


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton:Container(
        height: 7.h,
        padding: EdgeInsets.symmetric(vertical:15.sp,horizontal: 28.sp),
        margin: EdgeInsets.only(right:10.sp,bottom: 10.sp,left: 10.sp),
        decoration: BoxDecoration(
            color: RecipesColor.secondColor.withOpacity(0.7),
            borderRadius: BorderRadius.circular(20.sp)
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            InkWell(
              onTap: () {
                setState(() {
                  currentIndex= 0;
                });
              },
              child:  Column(
                children: [
                  const Expanded(child: Divider()),
                  Image.asset("assets/images/home.png",width: 7.w,),
                ],
              ),
            ),
            InkWell(
              onTap: () {
                setState(() {
                  currentIndex = 1;
                });
              },
              child:  Column(
                children: [
                  const Expanded(child: Divider()),
                  Image.asset("assets/images/search.png",width: 7.w,),
                ],
              ),
            ),
            InkWell(
              onTap: () {
                setState(() {
                  currentIndex = 2;
                });
              },
              child:  Column(
                children: [
                  const Expanded(child: Divider()),
                  Image.asset("assets/images/love.png",width: 7.w,),
                ],
              ),
            ),
            InkWell(
              onTap: () {
                setState(() {
                  currentIndex = 3;
                });
              },
              child:  Column(
                children: [
                  const Expanded(child: Divider()),
                  Image.asset("assets/images/person.png",width: 7.w,),
                ],
              ),
            ),

          ],
        ),
      ) ,
      /*
         bottomNavigationBar: ClipRRect(
           borderRadius:  BorderRadius.circular(20.sp),
           child: Theme(
             data: Theme.of(context)
                 .copyWith(canvasColor: Colors.white70),
              child: BottomNavigationBar(
                elevation: 0,
              currentIndex: currentIndex,
              onTap: (index) => _changeTab(index),
              selectedItemColor: Colors.white,
              unselectedItemColor: Colors.grey,
              showSelectedLabels: false,
              showUnselectedLabels: false,
              items:  const[
                BottomNavigationBarItem(icon: Icon(Icons.home_outlined), label: "Home"),
                BottomNavigationBarItem(icon: Icon(Icons.search), label: "Search"),
                BottomNavigationBarItem(icon: Icon(Icons.favorite_border), label: "Wishlist"),
                BottomNavigationBarItem(icon: Icon(Icons.person_outline), label: "Profile"),
        ],
        ),
        ),
         ),*/
      body: screens[currentIndex],


    );
  }
}