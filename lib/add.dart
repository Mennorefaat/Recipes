import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import 'colors/recipe_colors.dart';

class Add extends StatefulWidget {
  const Add({super.key});

  @override
  State<Add> createState() => _AddState();
}

class _AddState extends State<Add> {
  final nameController = TextEditingController();
  final categoryController = TextEditingController();
  final rateController = TextEditingController();
  final chefNameController = TextEditingController();
  final followersController = TextEditingController();
  final timeController = TextEditingController();
  final calController = TextEditingController();
  final levelController = TextEditingController();
  final descriptionController = TextEditingController();
  final imageController=TextEditingController();
  final youtubeController=TextEditingController();

CollectionReference recipes=FirebaseFirestore.instance.collection("recipes");

Future<void> add(){
  return recipes
      .add({
    "name":nameController.text,
    "category":categoryController.text,
    "cal":calController.text,
    "level":levelController.text,
    "time":timeController.text,
    "rate":rateController.text,
    "description":descriptionController.text,
    "chef name":chefNameController.text,
    "followers":followersController.text,
    "youtube url":youtubeController.text,
    "image url":imageController.text,
  })
  .then((value) => print('Added'))
  .catchError((error)=> print("failed:$error"));
}
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: SingleChildScrollView(
        child: Container(
          margin: EdgeInsets.all(10.sp),
          padding: EdgeInsets.all(10.sp),
          child: Column(
            children: [
              TextFormField(
                controller: nameController,
                textInputAction: TextInputAction.next,
                keyboardType: TextInputType.text,
                decoration:   InputDecoration(
                    label: Text('Name',style: TextStyle(color: RecipesColor.secondColor,fontSize: 15,fontWeight: FontWeight.bold),)
                ),
              ),
              TextFormField(
                controller: categoryController,
                textInputAction: TextInputAction.next,
                keyboardType: TextInputType.text,
                decoration:   InputDecoration(
                    label: Text('Category',style: TextStyle(color: RecipesColor.secondColor,fontSize: 15,fontWeight: FontWeight.bold),)
                ),
              ),
              TextFormField(
                controller: rateController,
                textInputAction: TextInputAction.next,
                keyboardType: TextInputType.number,
                decoration:   InputDecoration(
                    label: Text('rate',style: TextStyle(color: RecipesColor.secondColor,fontSize: 15,fontWeight: FontWeight.bold),)
                ),
              ),
              TextFormField(
                controller: imageController,
                textInputAction: TextInputAction.next,
                keyboardType: TextInputType.text,
                decoration:   InputDecoration(
                    label: Text('Image',style: TextStyle(color: RecipesColor.secondColor,fontSize: 15,fontWeight: FontWeight.bold),)
                ),
              ),
              TextFormField(
                controller: timeController,
                textInputAction: TextInputAction.next,
                keyboardType: TextInputType.number,
                decoration:   InputDecoration(
                    label: Text('Time',style: TextStyle(color: RecipesColor.secondColor,fontSize: 15,fontWeight: FontWeight.bold),)
                ),
              ),
              TextFormField(
                controller: calController,
                textInputAction: TextInputAction.next,
                keyboardType: TextInputType.number,            decoration:   InputDecoration(
                    label: Text('Cal',style: TextStyle(color: RecipesColor.secondColor,fontSize: 15,fontWeight: FontWeight.bold),)
                ),
              ),
              TextFormField(
                controller: levelController,
                textInputAction: TextInputAction.next,
                keyboardType: TextInputType.text,
                decoration:   InputDecoration(
                    label: Text('Level',style: TextStyle(color: RecipesColor.secondColor,fontSize: 15,fontWeight: FontWeight.bold),)
                ),
              ),
              TextFormField(
                controller: descriptionController,
                textInputAction: TextInputAction.next,
                keyboardType: TextInputType.text,
                decoration:   InputDecoration(
                    label: Text('Description',style: TextStyle(color: RecipesColor.secondColor,fontSize: 15,fontWeight: FontWeight.bold),)
                ),
              ),
              TextFormField(
                controller: chefNameController,
                textInputAction: TextInputAction.next,
                keyboardType: TextInputType.text,            decoration:   InputDecoration(
                    label: Text('Chef name',style: TextStyle(color: RecipesColor.secondColor,fontSize: 15,fontWeight: FontWeight.bold),)
                ),
              ),
              TextFormField(
                controller: followersController,
                textInputAction: TextInputAction.next,
                keyboardType: TextInputType.text,            decoration:   InputDecoration(
                    label: Text('followers',style: TextStyle(color: RecipesColor.secondColor,fontSize: 15,fontWeight: FontWeight.bold),)
                ),
              ),
              TextFormField(
                controller: youtubeController,
                textInputAction: TextInputAction.next,
                keyboardType: TextInputType.text,            decoration:   InputDecoration(
                    label: Text('youtube url',style: TextStyle(color: RecipesColor.secondColor,fontSize: 15,fontWeight: FontWeight.bold),)
                ),
              ),


              SizedBox(
                width: double.infinity,
                height: 50,
                child: ElevatedButton(
                  onPressed: (){
                      add();
                    },
                  style: ElevatedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15.sp),
                    ),
                    //backgroundColor: RecipesColor.firstColor,
                  ),
                  child: Text ('add',
                      style: TextStyle(
                          color: Colors.black,fontSize: 18.sp,
                          fontWeight: FontWeight.bold)),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
