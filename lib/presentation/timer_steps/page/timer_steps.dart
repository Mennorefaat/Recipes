import 'package:circular_countdown_timer/circular_countdown_timer.dart';
import 'package:flutter/material.dart';
import 'package:order_tracker/order_tracker.dart';
import 'package:recipes/colors/recipe_colors.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import '../../../navigators/navigators.dart';
import '../../navigation_bar/page/main_screen.dart';

class TimerSteps extends StatefulWidget {
  const TimerSteps({super.key});

  @override
  State<TimerSteps> createState() => _TimerStepsState();
}

class _TimerStepsState extends State<TimerSteps> {
  List<TextDto> orderList = [
    TextDto("Your order has been placed", "Fri, 25th Mar '22 - 10:47pm"),
    TextDto("Seller ha processed your order", "Sun, 27th Mar '22 - 10:19am"),
    TextDto("Your item has been picked up by courier partner.", "Tue, 29th Mar '22 - 5:00pm"),
  ];

  List<TextDto> shippedList = [
    TextDto("Your order has been shipped", "Tue, 29th Mar '22 - 5:04pm"),
    TextDto("Your item has been received in the nearest hub to you.", null),
  ];

  List<TextDto> outOfDeliveryList = [
    TextDto("Your order is out for delivery", "Thu, 31th Mar '22 - 2:27pm"),
  ];

  List<TextDto> deliveredList = [
    TextDto("Your order has been delivered", "Thu, 31th Mar '22 - 3:58pm"),
  ];
  
  final int _duration = 20;
  final CountDownController _controller = CountDownController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
       body: SingleChildScrollView(
        child: Container(
          margin: const EdgeInsets.all(10),
          padding: const EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              minute(),
              const SizedBox(height: 10,),
              const Text('𝐇𝐨𝐰 𝐓𝐨 𝐂𝐨𝐨𝐤',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 40),),
              const Text('Steak', style: TextStyle(fontSize: 40),),
             timer(),

              const Align(
                  alignment: Alignment.center,
                  child: Text('Season the steaks',
                    style: TextStyle(
                        fontSize: 25,
                        fontWeight: FontWeight.bold),)),
              const SizedBox(height: 10,),
              const Align(
                alignment: Alignment.center,
                  child: Text('Just before cooking, liberally coat the steaks \nwith the salts.',
                    style: TextStyle(color: Colors.grey,fontWeight: FontWeight.bold),)),

              const SizedBox(height: 40,),
              controlTheTimer(),
              SizedBox(height: 10.h,),
              done(),

            ],
          ),
        ),
      ),
    );
  }

 Widget done() {
    return SizedBox(
      width: double.infinity,
      height:6.h,
      child: ElevatedButton(
        onPressed:() => showDialog<String>(
          context: context,
          builder: (BuildContext context) => AlertDialog(
            shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(32.0))
            ),
            //title: const Text('AlertDialog Title'),
            //content: const Text('AlertDialog description'),
            backgroundColor: Colors.black,
            actions: <Widget>[
              Stack(
                alignment: Alignment.bottomCenter,
                children: [
                  ClipRRect(
                      borderRadius: const BorderRadius.all(Radius.circular(32.0)),
                    child: Image.asset('assets/images/done.gif',
                                  fit: BoxFit.fill,
                    ),
                  ),
                  Column(
                    children: [
                      SizedBox(height: 10.h,),
                      SizedBox(
                        width: double.infinity,
                        height: 50,
                        child: ElevatedButton(
                          onPressed: (){
                            pushReplacement(context, const MainScreen());
                          },
                          style: ElevatedButton.styleFrom(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20.sp),
                            ),
                            backgroundColor: Colors.black,
                          ),
                          child: Text ('Back to home',
                              style: TextStyle(
                                  color: Colors.white,fontSize: 18.sp,
                                  fontWeight: FontWeight.bold)),
                        ),
                      ),
                    ],
                  )
                ],
              ),

            ],
          ),
        ),
        style: ElevatedButton.styleFrom(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15.sp),
          ),
          backgroundColor: RecipesColor.firstColor,
        ),
        child: const Text ('Done',style: TextStyle(color: Colors.black,fontSize: 20,fontWeight: FontWeight.bold)),
      ),
    );
 }

 Widget controlTheTimer() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        FloatingActionButton(
          backgroundColor: Colors.white,
          onPressed: () => _controller.start(),
          child: Icon(Icons.not_started_outlined,
            color: RecipesColor.firstColor,),
        ),
        FloatingActionButton(
          backgroundColor: Colors.white,
          onPressed: () => _controller.pause(),
          child: Icon(Icons.pause, color: RecipesColor.firstColor),
        ),
        FloatingActionButton(
          backgroundColor: Colors.white,
          onPressed: () => _controller.resume(),
          child: Icon(Icons.stop_circle_outlined,
              color: RecipesColor.firstColor),
        ),
        FloatingActionButton(
          backgroundColor: Colors.white,
          onPressed: () => _controller.restart(),
          child: Icon(
              Icons.restart_alt, color: RecipesColor.firstColor),
        ),
      ],
    );
 }
 Widget timer() {
    return Center(
      child: CircularCountDownTimer(
          duration: _duration,
          initialDuration: 0,
          controller: _controller,
          width: MediaQuery
              .of(context)
              .size
              .width / 2,
          height: 250,
          ringColor: Colors.black12,
          ringGradient: null,
          fillColor: RecipesColor.firstColor,
          fillGradient: null,
          backgroundColor: Colors.white,
          backgroundGradient: null,
          strokeWidth: 5,
          strokeCap: StrokeCap.round,
          textStyle: TextStyle(
            fontSize: 33.0,
            color: RecipesColor.orangeColor,
            fontWeight: FontWeight.bold,
          ),
          textFormat: CountdownTextFormat.MM_SS,
          isReverse: true,
          isReverseAnimation: true,
          isTimerTextShown: true,
          autoStart: true,
          onStart: () {
            debugPrint('Countdown Started');
          },
          onComplete: () {
            debugPrint('Countdown Ended');
          },
          onChange: (String timeStamp) {
            debugPrint('Countdown Changed $timeStamp');

          },
          timeFormatterFunction: (defaultFormatterFunction, duration) {
            if (duration.inSeconds == 0) {
              return 'Done!';
            } else {
              return Function.apply(defaultFormatterFunction, [duration]);
            }
          }
      ),
    );
 }

 Widget minute() {
    return Container(
      padding: const EdgeInsets.all(15),
      decoration: BoxDecoration(
        color: Colors.orange[100],
        borderRadius: BorderRadius.circular(30),
      ),
      child: Text('20 Min', style: TextStyle(
          color: RecipesColor.orangeColor,
          fontWeight: FontWeight.bold),),
    );
 }
}
