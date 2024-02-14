import 'package:filter_list/filter_list.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'model/SelectedListController.dart';

class SearchForRecipes extends StatefulWidget {
  const SearchForRecipes({super.key});

  @override
  State<SearchForRecipes> createState() => _SearchForRecipesState();
}

class _SearchForRecipesState extends State<SearchForRecipes> {
var controller = Get.put(SelectedListController());

List<String> dishTypee=[
    "Desserts",
    "Snacks",
    "Salads",
    "Side Dishes",
    "Soups",
    "Breakfast",
    "Main Course",
    ];
List<String> cuisinee=[
  "Italian",
  "Mexican",
  "Asian",
  "American"
];
List<String> difficultyLevell=[
  "Easy",
  "Medium",
  "Difficult"
];
List<String> preparationTimee=[
  "20 Min",
  "25 Min",
  "30 Min",
  "40 Min"
];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
     // backgroundColor: Colors.white,
       appBar: AppBar(
         elevation: 0,
        // backgroundColor: Colors.white,
         title: const Text('Search For Recipes',
           style: TextStyle(
            // color: Colors.black,
             fontSize: 25,
             fontWeight: FontWeight.bold),),
         centerTitle: true,
         actions: [
           TextButton(
               onPressed: (){},
               child: const Text('Reset',
                 style: TextStyle(color: Colors.grey,fontSize: 20),)),
         ],
       ),
      body: SingleChildScrollView(
        child: Container(
          margin: const EdgeInsets.all(10),
          padding: const EdgeInsets.all(10),
          child: Column(
            children: [
              search(),
              dishType(),
              cuisine(),
              difficultyLevel(),
              preparationTime(),
              showResults(),
              SizedBox(height: 8.h,),
            ],
          ),
        ),
      ),

    );
  }

Widget search() {
    return  TextField(
      decoration: InputDecoration(
        prefixIcon: const Icon(Icons.search,color: Colors.black,),
        enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(15.sp),
            borderSide: const BorderSide(
              color: Colors.grey,
            )
        ),
        filled: true,
        fillColor: Colors.white,
        hintText:  'Enter Ingredients',
        hintStyle: TextStyle(
            color: Colors.grey,
            fontSize: 18.sp),
        border:  OutlineInputBorder(
          borderSide: BorderSide(
            color: Colors.grey,
            width: 2.sp,
          ),
          borderRadius: BorderRadius.circular(15.sp),
        ),
      ),
    );
 }
Widget dishType() {
    return Container(
      margin: const EdgeInsets.all(10),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text('Dish Type',style: TextStyle(
                  fontSize: 25,
                  fontWeight: FontWeight.bold),
              ),
              IconButton(
                  onPressed:()=> openFilterDialogDishType(context),
                  icon: Icon(Icons.arrow_drop_down_sharp,size: 30.sp,)),

            ],
          ),
          Obx(()=> controller.dishList.isEmpty
              ?  const Center(child: Text('No Selected'))
              : Wrap(
                children: controller
                    .dishList
                    .value
                    .map((e)=>
                Padding(
                    padding:  EdgeInsets.all(15.sp),
                    child:Chip(label: Text(e),
                    ),
            ))
              .toList(),
          )),

          const Divider(
            thickness: 0.7,
            color: Colors.grey,
          ),
        ],
      ),
    );
 }
Widget cuisine() {
  return Container(
    margin: const EdgeInsets.all(10),
    child: Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Text('Cuisine',style: TextStyle(
                fontSize: 25,
                fontWeight: FontWeight.bold),
            ),
            IconButton(
                onPressed:()=> openFilterDialogCuisine(context),
                icon: Icon(Icons.arrow_drop_down_sharp,size: 30.sp,)),

          ],
        ),
        Obx(()=> controller.cuisineList.isEmpty
            ?  const Center(child: Text('No Selected'))
            : Wrap(
          children: controller
              .cuisineList
              .value
              .map((e)=>
              Padding(
                padding:  EdgeInsets.all(15.sp),
                child:Chip(label: Text(e),
                ),
              ))
              .toList(),
        )),
        const Divider(
          thickness: 0.7,
          color: Colors.grey,
        ),
      ],
    ),
  );
}
Widget difficultyLevel() {
  return Container(
    margin: const EdgeInsets.all(10),
    child: Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Text('Difficulty Level',style: TextStyle(
                fontSize: 25,
                fontWeight: FontWeight.bold),
            ),
            IconButton(
                onPressed:()=> openFilterDialogDifficulty(context),
                icon: Icon(Icons.arrow_drop_down_sharp,size: 30.sp,)),

          ],
        ),
        Obx(()=> controller.difficultyList.isEmpty
            ?  const Center(child: Text('No Selected'))
            : Wrap(
          children: controller
              .difficultyList
              .value
              .map((e)=>
              Padding(
                padding:  EdgeInsets.all(15.sp),
                child:Chip(label: Text(e),
                ),
              ))
              .toList(),
        )),
        const Divider(
          thickness: 0.7,
          color: Colors.grey,
        ),
      ],
    ),
  );
}
Widget preparationTime() {
  return Container(
    margin: const EdgeInsets.all(10),
    child: Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Text('Preparation Time',style: TextStyle(
                fontSize: 25,
                fontWeight: FontWeight.bold),
            ),
            IconButton(
                onPressed:()=> openFilterDialogPreparation(context),
                icon: Icon(Icons.arrow_drop_down_sharp,size: 30.sp,)),

          ],
        ),
        Obx(()=> controller.preparationList.isEmpty
            ?  const Center(child: Text('No Selected'))
            : Wrap(
          children: controller
              .preparationList
              .value
              .map((e)=>
              Padding(
                padding:  EdgeInsets.all(15.sp),
                child:Chip(label: Text(e),
                ),
              ))
              .toList(),
        )),
        const Divider(
          thickness: 0.7,
          color: Colors.grey,
        ),
      ],
    ),
  );
}
void openFilterDialogDishType(context) async {
    await FilterListDialog.display<String>(context,
      listData: dishTypee,
      selectedListData: controller.dishList,
      headlineText: 'select',
      choiceChipLabel: (item) => item,
      validateSelectedItem: (list, val) => list!.contains(val),
      onItemSearch: (list, text) {
        return false;
      //}
      },
      onApplyButtonClick: (list) {
        controller.dishList.value=(List<String>.from(list!));
        Navigator.of(context).pop();
      });
  }
void openFilterDialogDifficulty(context) async {
  await FilterListDialog.display<String>(context,
      listData: difficultyLevell,
      selectedListData: controller.difficultyList,
      headlineText: 'select',
      choiceChipLabel: (item) => item,
      validateSelectedItem: (list, val) => list!.contains(val),
      onItemSearch: (list, text) {
        return false;
        //}
      },
      onApplyButtonClick: (list) {
        controller.difficultyList.value=(List<String>.from(list!));
        Navigator.of(context).pop();
      });
}
void openFilterDialogCuisine(context) async {
  await FilterListDialog.display<String>(context,
      listData: cuisinee,
      selectedListData: controller.cuisineList,
      headlineText: 'select',
      choiceChipLabel: (item) => item,
      validateSelectedItem: (list, val) => list!.contains(val),
      onItemSearch: (list, text) {
        return false;
        //}
      },
      onApplyButtonClick: (list) {
        controller.cuisineList.value=(List<String>.from(list!));
        Navigator.of(context).pop();
      });
}
void openFilterDialogPreparation(context) async {
  await FilterListDialog.display<String>(context,
      listData: preparationTimee,
      selectedListData: controller.preparationList,
      headlineText: 'select',
      choiceChipLabel: (item) => item,
      validateSelectedItem: (list, val) => list!.contains(val),
      onItemSearch: (list, text) {
        return false;
        //}
      },
      onApplyButtonClick: (list) {
        controller.preparationList.value=(List<String>.from(list!));
        Navigator.of(context).pop();
      });
}

Widget showResults() {
    return  SizedBox(
      width: double.infinity,
      height:6.h,
      child: ElevatedButton(
        onPressed: () {},
        style: ElevatedButton.styleFrom(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15.sp),
          ),
          backgroundColor: Colors.black,
        ),
        child: const Text ('Show Results',style: TextStyle(color: Colors.white,fontSize: 20)),
      ),
    );
 }


 }

