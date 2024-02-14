import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../model/info.dart';

class SideMenuTile extends StatelessWidget {
  const SideMenuTile({super.key, required this.menu, required this.press, required this.isActive});

  final Info menu;
  final VoidCallback press;
  final  bool isActive;

  @override
  Widget build(BuildContext context) {
    return  Column(
      children: [
        const Padding(
          padding: EdgeInsets.only(left: 24),
          child: Divider(
            color: Colors.white24,
            height: 1,
          ),
        ),
        Stack(
          children: [
            AnimatedPositioned(
              height: 56,
                width: isActive? 288:0,
                curve: Curves.fastOutSlowIn,
                left: 0,
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.orangeAccent,
                  ),
                ),
                duration: Duration(milliseconds: 300),)
          ],
        ),
        ListTile(
          onTap: press,
          leading: SizedBox(
            height: 34,
            width: 34,
            child: SvgPicture.asset(
                menu.url,
                semanticsLabel: menu.semanticsLabel),

          ),
          title: Text(menu.title),
          titleTextStyle: TextStyle(color: Colors.white),
        ),
      ],
    );
  }
}
