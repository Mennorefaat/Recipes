import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:recipes/presentation/timer_steps/page/timer_steps.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';
import '../../../Model/myRecipe.dart';
import '../../../colors/recipe_colors.dart';
import '../../../navigators/navigators.dart';

class RecipeDetails extends StatefulWidget {
  const RecipeDetails({super.key, required this.vUrl, required this.rate, required this.level, required this.name, required this.chefName, required this.followers, required this.description, required this.time, required this.cal});
final String vUrl;
  final String rate;
  final String level;
  final String name;
  final String chefName;
  final String followers;
  final String description;
  final String time;
  final String cal;



  @override
  State<RecipeDetails> createState() => _RecipeDetailsState();
}

class _RecipeDetailsState extends State<RecipeDetails> {
  late YoutubePlayerController _controller;
  late String videoId;
  bool favourite =false;
List<MyRecipe> recipe=[];

  @override
  void initState() {
    super.initState();

    _controller = YoutubePlayerController(
      initialVideoId: "${widget.vUrl}",
      //${recipes["youtube url"]}
      flags: const YoutubePlayerFlags(
        autoPlay: true,
        mute: true,
        loop: true,
        enableCaption: true,
      ),
    );
  }
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
                        color: Theme.of(context).brightness == Brightness.light
                            ?Colors.white
                            :Colors.grey[900],
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
                           style: TextStyle(fontWeight:FontWeight.bold,fontSize: 20,color: Colors.grey[400]),),
                       ),
                        Row(
                         mainAxisAlignment: MainAxisAlignment.spaceBetween,
                         children: [
                            Text("${widget.name}",style: TextStyle(fontSize: 30,fontWeight: FontWeight.bold),),
                           Row(
                             children: [
                               Icon(Icons.star,color: RecipesColor.firstColor,size: 20.sp,),
                               const SizedBox(width: 5,),
                               Text ("${widget.rate}",style: TextStyle(fontSize: 17.sp,fontWeight: FontWeight.bold),),
                               Container(
                                 margin: const EdgeInsets.all(10),
                                 decoration: BoxDecoration(
                                   color: RecipesColor.firstColor,
                                   borderRadius: BorderRadius.circular(15),
                                 ),
                                 child: IconButton(
                                   onPressed: (){
                                     setState(() {
                                       favourite=!favourite;
                                     });
                                   },
                                   icon: Icon(favourite ? Icons.favorite_border_outlined:Icons.favorite
                                       , color: Colors.white,)),
                               ),
                             ],
                           ),
                         ],
                       ),
                        Row(
                         children: [
                           Image.asset("assets/images/chef.png",width: 20.w,height: 10.h,),
                           const SizedBox(width: 10,),
                            Expanded(
                             child: Column(
                               crossAxisAlignment: CrossAxisAlignment.start,
                               children: [
                                 Text("${widget.chefName}",style: TextStyle(fontSize: 20),),
                                 Row(
                                   children: [
                                     Text("${widget.followers}",style: TextStyle(fontWeight: FontWeight.bold),),
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
                            Text("${widget.time}",style: TextStyle(color: Colors.grey),),
                           const SizedBox(width: 10,),

                           Icon(Icons.stacked_bar_chart,color: RecipesColor.firstColor,),
                            Text("${widget.level}",style: TextStyle(color: Colors.grey),),
                           const SizedBox(width: 10,),

                           Icon(Icons.local_fire_department_outlined,color: RecipesColor.firstColor,),
                            Text("${widget.cal}",style: TextStyle(color: Colors.grey),),
                           const SizedBox(width: 10,),
                           const Spacer(),
                           Image.asset("assets/images/bookmark.png",width: 20.w,height: 8.h,),
                         ],
                       ),
                       const SizedBox(height: 10,),
                       const Text('Description',style: TextStyle(fontSize: 25,fontWeight: FontWeight.bold),),
                       const SizedBox(height: 10,),
                        Text("${widget.description}",style: TextStyle(color: Colors.grey),),
                       const SizedBox(height: 10,),
                       const Text('Ingredients',style: TextStyle(fontSize: 25,fontWeight: FontWeight.bold),),
                      ingredients(),
                       SizedBox(height: 2.h,),
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
          itemCount:  recipe.length,
          scrollDirection: Axis.vertical,
          itemBuilder: (context, index) {
            return Container(
              padding: const EdgeInsets.all(10),
              margin:  EdgeInsets.all( 10.sp),
            decoration:  BoxDecoration(
              color: Theme.of(context).brightness == Brightness.light
                  ?Colors.grey[100]
                  :Colors.grey[800],
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
                          recipe[index].imageUrl,
                          fit: BoxFit.cover,
                          height: 50,
                          width: 50,
                        ), ),
                      const SizedBox(width: 10,),
                      Expanded(child: Text(recipe[index].name,style: const TextStyle(fontWeight: FontWeight.bold,fontSize: 20),)),
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
        onTap: (){
          push(context, const TimerSteps());
        },
        child: Container(
          height: 50,
          width: 250,
          decoration:  BoxDecoration(
            color: Theme.of(context).brightness == Brightness.light
                ?Colors.grey[100]
                :Colors.grey[800],
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
