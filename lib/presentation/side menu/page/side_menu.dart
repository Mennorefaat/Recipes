import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:recipes/navigators/navigators.dart';
import 'package:recipes/presentation/login/page/login_screen.dart';
import 'package:recipes/presentation/side%20menu/manager/theme_cubit.dart';
import 'package:recipes/shared/my_shared.dart';
import 'package:recipes/shared/my_shared_keys.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import '../info_card/info_card.dart';

class SideMenu extends StatefulWidget {
  const SideMenu({super.key});

  @override
  State<SideMenu> createState() => _SideMenuState();
}

class _SideMenuState extends State<SideMenu> {

  //Info selectedMenu = menuInfo.first;
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
  create: (context) => ThemeCubit(),
  child: BlocConsumer<ThemeCubit, ThemeState>(
  listener: (context, state) => signOut(state),
  builder: (context, state) {
    return Scaffold(
      body: Container(
        width: 288,
        height: double.infinity,
        color: Colors.red,
        child:  SafeArea(
            child: Column(
            children: [
              const InfoCard(
                name: 'Menna',
                profession: 'Developer',),
              IconButton(
                  onPressed: ()=> signOut(state),
                  icon: const Icon(Icons.exit_to_app)),
              InkWell(
                onTap: ()=>showBottomSheet(),
                child: Container(
                  color: Colors.white,
                  child:  Row(
                    children: [
                      const Icon(Icons.color_lens_outlined),
                      const Expanded(child: Text("Theme")),
                      Text(PreferenceUtils.getBool(PrefKeys.darkTheme)?"Dark":"Light"),
                      const Icon(Icons.navigate_next),
                    ],
                  ),
                ),
              ),

             /*
             ...menuInfo.map(
                 (menu) => SideMenu(
                   menu: menu,
                   press: (){
                     menu.input!.change(true);
                     Future.delayed(Duration(seconds: 1),(){
                       menu.input!.change(false);
                     });
                     setState(() {
                       selectedMenu=menu;
                     });
                   },
                   isActive: selectedMenu== menu,



                 ),
             ),
      */
          ],
        )),
      ),
    );
  },
),
);
  }

  showBottomSheet(){
    showModalBottomSheet<void>(
      context: context,
      shape: RoundedRectangleBorder(
          borderRadius:BorderRadius.only(
              topLeft: Radius.circular(25.sp),
              topRight: Radius.circular(25.sp)) ),
      builder: (BuildContext context) {
        return Container(
          height: 20.h,
          padding: EdgeInsets.all(10.sp),
          margin: EdgeInsets.all(10.sp),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            mainAxisSize: MainAxisSize.max,
            children: <Widget>[
              SizedBox(height: 5.h,),
              Text('Select Theme',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 15.sp)),
             InkWell(
               onTap: ()async{
                 await PreferenceUtils.setBool(PrefKeys.darkTheme, false);
                 Navigator.pop(context);
               },
                 child: SizedBox(
                   width: double.infinity,
                     child: Text("Light",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20.sp),))
             ),
              InkWell(
                  onTap: ()async{
                    await PreferenceUtils.setBool(PrefKeys.darkTheme, true);
                    Navigator.pop(context);
                  },
                  child: SizedBox(
                    width: double.infinity,
                      child: Text("Dark",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20.sp)))
              ),
            ],
          ),
        );
      },
    ).then((value){
      BlocProvider.of<ThemeCubit>(context).themeChanged();
    }
    );
  }

  signOut(ThemeState state) {
    if(state is LoadingState){
      showDialog(context: context, builder: (context) {
        return const Center(child: CircularProgressIndicator());
      },);
    }
    FirebaseAuth.instance.signOut().then((value) {
      pushReplacement(context, const LoginScreen());
    });
  }

}




